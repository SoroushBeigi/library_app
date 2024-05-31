# Library Database App

Welcome to the Library Database App for Iran University of Science and Technology's database course! This project is developed using Flutter and it is available both as a web application(at [LibraryDB IUST](https://librarydbiust.netlify.app)) and an Android application.

## Project Overview

This app serves as a library database management system, allowing users to view, add, update, and remove library books. The project follows the Model-View-ViewModel (MVVM) architectural pattern and uses Provider for state management. Shared Preferences package is used as the local database to store user authentication status. The app design is fully responsive and includes various animations for an enhanced user experience.

## Features

- **Web Application**: Deployed using Netlify and accessible at [LibraryDB IUST](https://librarydbiust.netlify.app).
- **Android Application**: APK file is available in the repository files.
- **State Management**: Implemented using Provider.
- **Architecture**: Follows the MVVM pattern.
- **RESTful API**: Uses GET, POST, PUT and DELETE http requests to communicate with backend server written in Python(FastAPI).
- **Local Database**: Uses Shared Preferences.
- **Responsive Design**: Ensures a seamless experience across different screen sizes.
- **Animations**: Enhances the user interface and experience.

## Deployment

### Web

The web version is deployed on Netlify. To deploy your own version:

1. **Build the web app**:

    ```sh
    flutter build web
    ```

2. **Deploy to Netlify**:
    - Follow the [Netlify Deployment Guide](https://docs.netlify.com/site-deploys/create-deploys/) to deploy the contents of the `build/web` directory.

### Android

To generate a release APK for Android:

1. **Build the APK**:

    ```sh
    flutter build apk --release
    ```

2. **Find the APK**:
    - The release APK can be found in `build/app/outputs/flutter-apk/app-release.apk`.

## Project Structure

The project follows the MVVM architectural pattern. Here's an overview of the project structure:

```plaintext
lib/
├── core/             # Core project files, only app constants are implemented in this project
├── models/         # Data models
├── pages/              # UI screens and widgets
├── providers/           # Providers which are used as view-models
├── services/              # Data services to read and write data on local device and web server
├── routes.dart              # Routes configuration
└── main.dart           # Entry point of the application
