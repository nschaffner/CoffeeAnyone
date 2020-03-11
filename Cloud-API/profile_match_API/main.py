from flask import Flask, render_template, request, redirect, json, session, url_for,jsonify
from google.cloud import datastore
from werkzeug.useragents import UserAgent
import requests
import base64
client = datastore.Client('abetterdatingapp')
#import helper,forms and config file
import importlib
helper = importlib.import_module('helper')
if helper is None:
    print("can't find tbe helper module")
form = importlib.import_module('forms')
if form is None:
    print("can't find tbe forms module")
config = importlib.import_module('config')
if config is None:
    print("can't find the configuration settings module")

app = Flask(__name__)
app.secret_key = config.STATE
auth_uri = ('https://appleid.apple.com/auth/authorize?response_type=code'
            '&client_id={}&redirect_uri={}&scope={}&response_mode=form_post&state={}').format(config.CLIENT_ID, config.REDIRECT_URI,
                                                                      config.SCOPE, app.secret_key)
@app.route('/oauth2callback', methods=['GET','POST'])
def oauth2callback():
    """Trys again to get credentials from server"""
    if 'credentials' not in session:
        return redirect(url_for('token'))
    credentials = json.loads(session['credentials'])
    if credentials['expires_in'] <= 0:
        return redirect(url_for('token'))
    else:
        return session['credentials']

@app.route('/token', methods=['GET', 'POST'])
def token():
    """Sends POST to Apple API Token Server to Get Token"""
    print(request.form)
    if 'code' not in request.form: #args:
        response = redirect(auth_uri)
        return response
    else:
        if request.form['state'] != app.secret_key:
            return jsonify(Error='State Returned does Not match that of client '), '403'
        #code is sent in form, will need to have my app send the code and verify then ... send it back token?
        auth_code = request.form['code']
        data = {'code': auth_code,
                'client_id': config.CLIENT_ID,
                'client_secret': config.CLIENT_SECRET,
                'redirect_uri': config.REDIRECT_URI,
                'grant_type': 'authorization_code'}
        user_agent = UserAgent(request.headers.get('User-Agent'))
        headers = {'User-Agent': '{}'.format(user_agent)}
        req = requests.post('https://appleid.apple.com/auth/token', data=data,headers=headers)
        jsonreturn = req.json()
        id_token = jsonreturn['id_token']
        session['id_token'] = id_token
        session['credentials'] = req.text
        return redirect(url_for('oauth2callback'))

@app.route('/authenticate', methods=['POST'])
def authenticate():
    """Sends POST to Apple API Token Server to Get Token
    to send back to app to attach to request. This is not working yet"""
    if 'code' not in request.form: #args:
        response = redirect(auth_uri)
        return response
    else:
        if request.form['state'] != app.secret_key:
            return jsonify(Error='State Returned does Not match that of client '), '403'
        #code is sent in form, will need to have my app send the code and verify then ... send it back token?
        auth_code = request.form['code']
        data = {'code': auth_code,
                'client_id': config.CLIENT_ID,
                'client_secret': config.CLIENT_SECRET,
                'redirect_uri': config.REDIRECT_URI,
                'grant_type': 'authorization_code'}
        user_agent = UserAgent(request.headers.get('User-Agent'))
        headers = {'User-Agent': '{}'.format(user_agent)}
        req = requests.post('https://appleid.apple.com/auth/token', data=data,headers=headers)
        jsonreturn = req.json()
        id_token = jsonreturn['id_token']
        session['id_token'] = id_token
        session['credentials'] = req.text
        return redirect(url_for('oauth2callback'))

@app.route('/users', methods=['GET', 'POST'])
@app.route('/users/', methods=['GET','POST'])
def oauth_Apple():
    """POST request to Apple authorization url on submit of form button"""
    if request.method == 'POST':
        return redirect(auth_uri)
    else:
        """Starting Login Page sent at GET request"""
        form_info = form.LoginForm()
        return render_template('signin.html', form=form_info)

@app.route('/',methods=['GET','POST','DELETE'])
def index():
    # Returns a not found html page with info on endpoints
    return render_template('404.html')

@app.route('/matches',methods=['GET','POST','DELETE'])
@app.route('/matches/', methods=['DELETE','PUT','PATCH'])
def matches():
    # Returns a not found html page with info on endpoints
    return render_template('404.html')

@app.route('/profiles',methods=['POST','PUT','DELETE','GET'])
@app.route('/profiles/', methods=['DELETE','PUT','PATCH'])
@app.route('/profiles?pages=<int:page>',methods=['GET'])
def profile_post_get(page=1):
    url = str(request.base_url)
    if request.method == 'PUT' or request.method == 'DELETE'or request.method == 'PATCH':
        return helper.NotSupported405()
    if request.method == 'POST' or request.method == 'GET':
        if request.mimetype != 'application/json':
            return helper.NotAccepted406('Content-Type', request.mimetype)
        if not request.accept_mimetypes['application/json']:
            return helper.NotAccepted406('Accept', request.accept_mimetypes)
    if request.method == 'POST':
        # This will fail and return error if JWT is missing or incorrect. otherwise it will continue
        if 'Authorization' not in request.headers:
            return helper.Unauthorized401()
        token = helper.GetToken(request)
        if token is None:
            return helper.Unauthorized401()
        try:
            userid = helper.GetUserID(token)
        except ValueError:
            return helper.Unauthorized401()
        content = request.get_json(silent=True)
        if not content:
            return helper.BadRequest400()
        #check that token matches user id
        if userid != content["userid"]:
           return helper.Unauthorized401()

        #checks if this user is already in system
        duplicate = helper.CheckIfDuplicate('profiles', 'userid', content["userid"])
        if duplicate == 1:
            #Create a PUT if profile exists
            profile_key = client.key("profiles", id)
            profiles = client.get(key=profile_key)

        elif duplicate != 1:
            profiles = datastore.entity.Entity(key=client.key('profiles'))

        else:
            return helper.BadRequest400()

        profiles.update(
            {
                "name": content["name"],"statement": content["statement"],"bodytype": content["bodytype"],
                'userid': content["userid"], "age": content["age"],"height": content["height"],"haskids": content["haskids"],
                "gender": content["gender"], "status": content["status"], "occupation": content["occupation"],
                "education": content["education"], "city": content["city"], "state": content["state"], "hobbies1": content["hobbies1"],
                "hobbies2": content["hobbies2"], "hobbies3": content["hobbies3"], "hobbies4": content["hobbies4"],
                "hobbies5": content["hobbies5"], "bodytypePref": content["bodytypePref"], "genderPref": content["genderPref"],
                "educationPref": content["educationPref"], "agePref": content["agePref"],"personalitytype": content["personalitytype"],
                "lovelang1": content["lovelang1"],"lovelang2": content["lovelang2"],"lovelang3": content["lovelang3"],
                "lovelang4": content["lovelang4"],"lovelang5": content["lovelang5"],"photo_url": content["photo_url"],
                "email": content["email"]
            }
        )
        client.put(profiles)
        #now find matches
        helper.MakeMatches(content["userid"],content["genderPref"],content["gender"],content["agePref"],content["age"],content["educationPref"],
                               content["education"],content["bodytypePref"],content["bodytype"])
        #return profile information for verification
        return jsonify(id=profiles.key.id,name=content["name"],statement=content["statement"],bodytype=content["bodytype"],userid=content['userid'],
                           age=content["age"],height=content["height"],haskids=content["haskids"],gender=content["gender"],
                           status=content["status"],occupation=content["occupation"],education=content["education"],city=content["city"],
                           state=content["state"],hobbies1=content["hobbies1"],hobbies2=content["hobbies2"],hobbies3=content["hobbies3"],
                           hobbies4=content["hobbies4"],hobbies5=content["hobbies5"],bodytypePref=content["bodytypePref"],genderPref=content["genderPref"],
                           educationPref=content["educationPref"],agePref=content["agePref"],personalitytype=content["personalitytype"],
                           lovelang1=content["lovelang1"],lovelang2=content["lovelang2"],lovelang3=content["lovelang3"],lovelang4=content["lovelang4"],
                           lovelang5=content["lovelang5"], email=content["email"], photo_url=content["photo_url"], self=url+"/"+str(profiles.key.id)),'201 Created'


    elif request.method == 'GET':
        page_num = request.args.get('pages')
        if page_num is None:
            page_num = page
        #This will return even if JWT is missing or incorrect
        next_url, results, number = helper.PaginationResultsAndLink(url, int(page_num), 'profiles')
        for e in results:
            e["id"] = e.key.id
            e['self'] = url + "/" + str(e.key.id)
        # In the future here we will include related answers and their self links
        output = {"results": results}
        if next_url:
            output['next'] = next_url
        output['number'] = number
        return jsonify(output),'200 OK'
    else:
        return helper.BadRequest400()

@app.route('/profiles/<id>', methods=['GET','DELETE','PUT'])
def profiles_get_put_patch_delete(id):
    if not id:
        return helper.BadRequest400()
    if 'Authorization' not in request.headers:
        return helper.Unauthorized401()
    token = helper.GetToken(request)
    if token is None:
        return helper.Unauthorized401()
    try:
        userid = helper.GetUserID(token)
    except ValueError:
        return helper.Unauthorized401()
    # check that token matches user id
    if userid != id:
       return helper.Unauthorized401()
    isint = helper.CheckValInt(id)
    if isint is False:
        return helper.BadRequest400()
    url = str(request.base_url)
    profile_key = client.key("profiles", int(id))
    profile = client.get(key=profile_key)
    if profile is None:
        return helper.NotFound404('profile', 'user_id')
    if request.mimetype != 'application/json':
        return helper.NotAccepted406('Content-Type', request.mimetype)
    if not request.accept_mimetypes['application/json']:
        return helper.NotAccepted406('Accept', request.accept_mimetypes)
    if request.method == 'GET':
        profile["id"] = int(id)
        profile['self'] = url
        return jsonify(profile), '200 OK'

    elif request.method == 'DELETE':
        #delete profile matches relationships
        query1 = client.query(kind='profile_matches')
        query2 = client.query(kind='profile_matches')
        query1.add_filter('match_id1', '=', profile["userid"])
        query2.add_filter('match_id2', '=', profile["userid"])
        results = list(query1.fetch())
        results2 = list(query2.fetch())
        for e in results:
            profile_match_key = client.key("profile_matches", e.key.id)
            client.delete(profile_match_key)
        for e in results2:
            profile_match_key = client.key("profile_matches", e.key.id)
            client.delete(profile_match_key)
        client.delete(profile_key)
        return jsonify(),"204 No Content"
        #fully edit the profile
    elif request.method == 'PUT':
        content = request.get_json(silent=True)
        if not content:
            return helper.BadRequest400()
        if len(content) == 30:
            profile.update(
                {
                    "name": content["name"], "statement": content["statement"], "bodytype": content["bodytype"],
                    'userid': content["userid"], "age": content["age"], "height": content["height"],
                    "haskids": content["haskids"],
                    "gender": content["gender"], "status": content["status"], "occupation": content["occupation"],
                    "education": content["education"], "city": content["city"], "state": content["state"],
                    "hobbies1": content["hobbies1"],
                    "hobbies2": content["hobbies2"], "hobbies3": content["hobbies3"],
                    "hobbies4": content["hobbies4"],
                    "hobbies5": content["hobbies5"], "bodytypePref": content["bodytypePref"],
                    "genderPref": content["genderPref"],
                    "educationPref": content["educationPref"], "agePref": content["agePref"],
                    "personalitytype": content["personalitytype"],
                    "lovelang1": content["lovelang1"], "lovelang2": content["lovelang2"],
                    "lovelang3": content["lovelang3"],
                    "lovelang4": content["lovelang4"], "lovelang5": content["lovelang5"],
                    "photo_url": content["photo_url"],
                    "email": content["email"]
                }
            )
            client.put(profile)
            #matches update if new ones because of edits. Does not remove any existing
            # now find matches
            helper.MakeMatches(content["userid"], content["genderPref"], content["gender"], content["agePref"],
                                content["age"], content["educationPref"],
                                content["education"], content["bodytypePref"], content["bodytype"])
            profile["id"] = int(id)
            profile['self'] = url
            return jsonify(profile), 303
        else:
            return helper.BadRequest400()

    else:
        return helper.NotFound404('profile', 'profile_id')

#get User's matches
@app.route('/matches/<id>', methods=['GET'])
def matches_get(id):
    url = str(request.base_url)
    if not id:
        return helper.BadRequest400()
    if request.mimetype != 'application/json':
        return helper.NotAccepted406('Content-Type', request.mimetype)
    if not request.accept_mimetypes['application/json']:
        return helper.NotAccepted406('Accept', request.accept_mimetypes)
    if request.method == 'GET':
        # This will fail and return error if JWT is missing or incorrect. otherwise it will continue
        if 'Authorization' not in request.headers:
            return helper.Unauthorized401()
        token = helper.GetToken(request)
        if token is None:
            return helper.Unauthorized401()
        try:
            userid = helper.GetUserID(token)
        except ValueError:
            return helper.Unauthorized401()
        # check that token matches user id
        # if userid != id  Removing this requirement for now
        #   return helper.Unauthorized401()
        #get users matches
        matches = helper.queryRelationship(id)
        # View matches
        return jsonify(matches), '200 OK'
    else:
        return helper.NotSupported405()

if __name__ == '__main__':
    # This is used when running locally only. When deploying to Google App
    # Engine, a webserver process such as Gunicorn will serve the app. This
    # can be configured by adding an `entrypoint` to app.yaml.
    # Flask's development server will automatically serve static files in
    # the "static" directory. See:
    # http://flask.pocoo.org/docs/1.0/quickstart/#static-files. Once deployed,
    # App Engine itself will serve those files as configured in app.yaml.
    app.run(host='127.0.0.1', port=8080, debug=True)
