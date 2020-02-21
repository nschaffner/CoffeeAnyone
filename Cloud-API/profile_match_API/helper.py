from flask import jsonify, request
from dateutil.parser import parse
from google.cloud import datastore
import datetime
from google.auth.transport import requests as google_auth_request
client = datastore.Client('abetterdatingapp')
import jwt

import importlib
config = importlib.import_module('config')
if config is None:
    print("can't find the configuration settings module")

'''Sample from https://stackoverflow.com/questions/25341945/check-if-string-has-date-any-format'''
def is_date(string, fuzzy=False):
    try:
        parse(string, fuzzy=fuzzy)
        return True
    except ValueError:
        return False

def BadRequest400():
    return jsonify(Error='The request object is missing at least one of the required attributes'), '400 Bad Request'

def Forbidden403(entity,entity2):
    error_message = f'{entity} does not have an existing relationship with {entity2}.'
    return jsonify(Error=str(error_message)), '403'

def Unauthorized401():
    error_message =  f'Unauthorized, Missing or Invalid JWT Token used.'
    return jsonify(Error=str(error_message)), '401'

def NotFound404(object,id):
    error_message = f'No {object} with this {id} exists'
    return jsonify(Error=str(error_message)), '404 Not Found'
def NotSupported405():
    error_message = f"PUT, PATCH or DELETE methods are not supported at root of this URL."
    return jsonify(Error=str(error_message)),405
def NotAccepted406(type,inrequest):
    error_message = f"{type} {inrequest} is not supported. Use application\u002Fjson"
    return jsonify(Error=error_message), 406

def CheckIfDuplicate(kind,attribute,value):
    query = client.query(kind= kind)
    query.add_filter(attribute, '=', str(value))
    object = list(query.fetch())
    if object:
        return 1
    else:
        return 0

def Forbidden403PUT(object1,object2):
    error_message = f'The {object1} is already assigned to this {object2}'
    return jsonify(Error=str(error_message)), '403 Forbidden'

def Duplicate403(entity,value):
    error_message = f'{value} is duplicate of an existing {entity}.'
    return jsonify(Error=str(error_message)), '403 Forbidden'

def decodeIDToken(id_token):
    decodedtok = jwt.decode(str(id_token), '', verify=False)
    return decodedtok


def GetUserID(id_token):
    decoded = decodeIDToken(id_token)
    sub = decoded.get('sub')
    return sub

def GetToken(req):
    bearer_token = request.headers['Authorization']
    token = bearer_token.rsplit(' ', 1)[1]
    return token

def GetEmail(id_token):
    decoded = decodeIDToken(id_token)
    email = decoded.get('email')
    return email

def PaginationResultsAndLink(url,page,entity):
    offset = (page-1)*config.LIMIT
    # get each entity in enity
    query = client.query(kind= entity)
    iterator = query.fetch(limit=config.LIMIT, offset=offset)
    pages = iterator.pages
    results = list(next(pages))
    query_total = client.query(kind=entity)
    objects = list(query_total.fetch())
    number = len(objects)
    next_page = page + 1
    if iterator.next_page_token:
        next_url = url + "?pages=" + str(next_page)
    else:
        next_url = None
    return next_url,results,number

def queryRelationship(userid):
    query1 = client.query(kind='profile_matches')
    query2 = client.query(kind='profile_matches')

    query1.add_filter('match_id1', '=', userid)
    query2.add_filter('match_id2', '=', userid)
    results = list(query1.fetch())
    results2 = list(query2.fetch())
    listofMatches = []
    if results and results2 is None:
        return None
    for entity in results:
        if entity['match_id2'] == userid:
            profiles = client.query(kind='profiles')
            profiles.add_filter('userid', '=', entity['match_id1'])
            listofMatches.extend(list(profiles.fetch()))
        elif entity['match_id1'] == userid:
            profiles = client.query(kind='profiles')
            profiles.add_filter('userid', '=', entity['match_id2'])
            listofMatches.extend(profiles.fetch())
    for entity in results2:
        if entity['match_id2'] == userid:
            profiles = client.query(kind='profiles')
            profiles.add_filter('userid', '=', entity['match_id1'])
            listofMatches.extend(profiles.fetch())

        elif entity['match_id1'] != userid:
            profiles = client.query(kind='profiles')
            profiles.add_filter('userid', '==', entity['match_id2'])
            listofMatches.extend(profiles.fetch())

    return listofMatches

def date():
    date = datetime.datetime.now()
    return date.strftime("%x")

def CheckValInt(value):
    returnval = True
    try:
        int(value)
    except:
        returnval = False
    return  returnval

def createRelationship(userid,matchid,matchtype):
    """profiles are many to many, users are linked and shown matches if they
    are either match_id1 or match_id2 in the list"""
    #avoid matching users twice, that are already matched
    query1 = client.query(kind='profile_matches')
    query1.add_filter('match_id1', '=', userid)
    query1.add_filter('match_id2', '=', matchid)
    results = list(query1.fetch())
    query2 = client.query(kind='profile_matches')
    query2.add_filter('match_id1', '=', matchid)
    query2.add_filter('match_id2', '=', userid)
    results2 = list(query2.fetch())
    if not results or results2:
        dateval = date()
        profile_matches = datastore.entity.Entity(key=client.key('profile_matches'))
        profile_matches.update({"match_id1": userid, "match_id2": matchid,"date": dateval,"match_type": matchtype})
        client.put(profile_matches)

def BasicFilter(genderPref,gender):
    query = client.query(kind='profiles')
    query.add_filter('gender', '=', genderPref)
    query.add_filter('genderPref', '=', gender)
    matches = list(query.fetch())
    match_len = len(matches)
    return matches,match_len

def AdvancedFilter(genderPref,gender, agePref, age):
    query = client.query(kind='profiles')
    query.add_filter('gender', '=', genderPref)
    query.add_filter('genderPref', '=', gender)
    query.add_filter('age', '=', agePref)
    query.add_filter('agePref', '=', age)
    matches = list(query.fetch())
    match_len = len(matches)
    return matches, match_len

def AdvancedFilterWithBody(genderPref,gender, agePref, age, bodytypePref, bodytype):
    query = client.query(kind='profiles')
    query.add_filter('gender', '=', genderPref)
    query.add_filter('genderPref', '=', gender)
    query.add_filter('age', '=', agePref)
    query.add_filter('agePref', '=', age)
    query.add_filter('bodytypePef', '=',bodytype)
    query.add_filter('bodytype', '=', bodytypePref)
    matches = list(query.fetch())
    match_len = len(matches)
    return matches, match_len


def AdvancedFilterwithEdu(genderPref,gender, agePref, age,education, educationPref):
    query = client.query(kind='profiles')
    query.add_filter('gender', '=', genderPref)
    query.add_filter('genderPref', '=', gender)
    query.add_filter('age', '=', agePref)
    query.add_filter('agePref', '=', age)
    query.add_filter('educationPef', '=',education)
    query.add_filter('education', '=', educationPref)
    matches = list(query.fetch())
    match_len = len(matches)
    return matches, match_len

def DeluxFilter(genderPref,gender, agePref, age, educationPref, education,bodytypePref,bodytype):
    query = client.query(kind='profiles')
    query.add_filter('gender', '=', genderPref)
    query.add_filter('genderPref', '=', gender)
    query.add_filter('age', '=', agePref)
    query.add_filter('agePref', '=', age)
    query.add_filter('bodytypePef', '=',bodytype)
    query.add_filter('bodytype', '=', bodytypePref)
    query.add_filter('educationPef', '=', education)
    query.add_filter('education', '=', educationPref)
    matches = list(query.fetch())
    match_len = len(matches)
    return matches, match_len

def MakeMatches(userid,genderPref,gender, agePref, age, educationPref, education,bodytypePref,bodytype):
    advmatches, match_len1 = AdvancedFilter(genderPref, gender, agePref, age)
    if match_len1 <= 6 and match_len1 >=1:
        print("adv was used to match")
        for entity in advmatches:
            if entity['userid'] != userid: #do not want to be matched with oneself
                createRelationship(userid, entity['userid'],'Advanced')
        return
    elif match_len1 < 1:
        basicmatches, match_len2 = BasicFilter(genderPref, gender)
        print("basics was used to match")
        for entity in basicmatches:
            if entity['userid'] != userid:
                createRelationship(userid, entity['userid'],'Basic') #This could result in no matches.
        return
    deluxmatches, match_len3 = DeluxFilter(genderPref, gender, agePref, age, educationPref, education, bodytypePref, bodytype)
    if match_len3 >=6:
        print("delux was used to match")
        for entity in deluxmatches:
            if entity['userid'] != userid:
                createRelationship(userid, entity['userid'],'Deluxe')
        return
    advBmatches, match_len4 = AdvancedFilterWithBody(genderPref,gender, agePref, age, bodytypePref, bodytype)
    if match_len4 >= 6:
        print("adv with bodytype was used to match")
        for entity in advBmatches:
            if entity['userid'] != userid:
                createRelationship(userid, entity['userid'],'Advanced_BodyType')
        return
    advEmatches, match_len5 = AdvancedFilterwithEdu(genderPref, gender, agePref, age, education, educationPref)
    if match_len5 >=6:
        print("adv with E was used to match")
        for entity in advEmatches:
            if entity['userid'] != userid:
                createRelationship(userid, entity['userid'],'Advanced_Education')
        return
    else: #use the original matching system if cant get enough matches further
        print("advanced was used to match")
        for entity in advmatches:
            if entity['userid'] != userid:
                createRelationship(userid, entity['userid'],'Advanced')
        return
