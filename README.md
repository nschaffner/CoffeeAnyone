# CS 467 Winter 2020 Capstone Project
---
#### _CoffeeAnyone Dating Application_

Team Members: _Carrie Davis, Eric Armstrong, Nicholas Schaffner_ 

This particular project came from embracing the idea that people do have a type and would like to find a long-term match in the dating pool. This iOS application will provide an easy to use step-by-step method to find people that match what a user is really looking for in a mate without allowing for smoke and mirrors in the profile creation process.

This project could be funded through directed advertisement or through membership fees, or both. Advertisements shown may be based on user location and interests/hobbies for places to meet for dates. Membership fees could be taken through in-app purchase API with auto renewable options.

## Getting Started ##
---
These instructions will get the extension running on your local machine for development and testing purposes. 

### Prerequisites
- Must be running macOS Catalina
- Must be running Xcode 11
- Must have an iOS device to run the application on a physical device

### Deployment
1) Clone or download the repository locally to a known location you can browse to
        - Unzip folder and you will see a folder called `CoffeeAnyone-master`
        - Navigate into the subfolder `CoffeeAnyone` under the `MidTermCheck` folder

2) Open the `CoffeeAnyone.xcworkspace` file in Xcode

3) In the upper left-hand corner, there will be a `Play` button that will build the CoffeeAnyone application. Please note, you may notice an error message in the top middle header of Xcode but if you proceed with building the project, this error message will be resolved.

4) Once the project has been successfully built, Simulator will open and the CoffeeAnyone application will open on the simulation device.

5) The application will land on the `Home` view with a horizontal navigation menu at the bottom of the view. The horizonal menu includes an image and text of the following views: `Home`, `Matches`, `Chat` and `Profile`. You can navigate to any of the views listed in the horizonatal navigation menu by clicking on the respective image and text associate with that view. The `Home` and `Matches` views have not yet been implemented but the `Chat` and `Profile` views provide additional functionality at the present time:
        - `Chat` functionality:
                - View a list of conversations with your current matches
                - Select a conversation within the list of matches and view the conversation thread
                - Send a message to your match, which is stored in our database
                - Navigate back to the list of conversations with your current matches
        - `Profile` functionality:
                - View your currently set profile picture
                - View profile information, match preferences or quiz results
                - `Edit Photo` button:
                        - Select to upload a new photo via your camera or via your photo gallery
                        - Navigate back to the initla `Profile` view
    
## Built With
---
* [Swift](https://swift.org)
* [SwiftUI](https://developer.apple.com/documentation/swiftui)
* [Firebase](https://firebase.google.com/)
