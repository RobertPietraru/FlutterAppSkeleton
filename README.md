# skeleton
A skeleton app, or a template for Flutter Authentication with Bloc and Clean Architecture. 
I'd say this is an acceptable approach for authentication as it only depends on firebase in the Data layer.
## Getting Started
1. Install Flutter
2. Clone the repository and rename the folder from AuthenticationSkeleton to something without uppercases
3. Replace all occurences of the word "skeleton" with the name of your project
3. Run flutter create .  (make sure the folder you're working in has no capital letters. Rename after cloning or clone into the proper folder)
4. Run make get in bash (git bash on Windows)
5. Do the FlutterFire setup (https://firebase.google.com/docs/flutter/setup?platform=ios#available-plugins)
6. Replace the firebase_options.dart file


Future things to add (not in any order, but in groups):
- Different modes (Production, Development)
- Proper localization
- Notifications (reminders and notifiers for actions)
- Deep linking
- Authentication with Google, Twitter and all That 
- Better authentication checking. Technically, it should check if the user is authenticated after every operation involving in the backend
- Testing, CI/CD
- Best practices in general (Clean Architecture, clean code, etc)
- Improved theme system, user settings
- Improved error system. Proper error messaging. Decoupling from Firebase. 
- Logging (both in production and in development)
- Caching, cache validation
- Sockets, or a way to do realtime stuff without Firebase
- Bug reporting and feedback system
- Account deletion, data safety and stuff
- Performance monitoring, Crashlytics

- A consistent Presentation layer structure.
- A consistent Widget reusability.
- A consistent state management structure.
- A consistent way of handling form and form validation.
- Better and consistent routing, navigation and redirecting
- Working with URLs and stuff
- Webviews
- Responsive UI
- Maybe splitting the code into packages.
- Proper animations for loading and things like that.
- Offline mode
- Admin dashboard, statistics
- Improved way to work with files



Nice to have:
- Easy way to switch between modes
- A Rust based cli for creating the app (the developer would select what features to add to the app)
- more features (chat, search with multiple services, etc)
- Almost automatic setup
- Documentation
- Automatic deployment