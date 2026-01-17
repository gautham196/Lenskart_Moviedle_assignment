#Lenskart Movie App – Flutter Assignment

##Description
This project is a Flutter-based mobile application developed as part of the Lenskart internship coding assignment. The application uses TMDB (The Movie Database) API to fetch and display popular movies and allows users to search, view movie details, and manage favourites and a watchlist.
The focus of this project is on clean UI, readable code, and handling common UI states such as loading, empty, and error conditions.

##Features
Splash Screen
Bottom Navigation with Movies, Favourites, and Watchlist
Fetch popular movies using TMDB API
Search movies by title
Movie details screen with banner, description, genres, rating, and release date
Add movies to Favourites and Watchlist
Visual feedback for favourite and watchlist actions
In-app notification on Play Now

##App Flow
Splash Screen → Home Page → Movie Detail Screen
Home Page includes Movies (Landing Screen), Favourites, and Watchlist.

##Tech Stack
Flutter (Dart)
TMDB API
HTTP package

##Setup Instructions
Install Flutter from https://docs.flutter.dev/get-started/install
Clone the repository using: git clone <repository-url>
Navigate to the project directory: cd movie_dle
Install dependencies using: flutter pub get
Open lib/main.dart and replace the API key with your TMDB API key
Run the application using: flutter run
Select a device (Chrome, Windows, or Android)

##Steps to Run the Assignment Locally
Clone the GitHub repository
Run flutter pub get
Add a valid TMDB API key in lib/main.dart
Run flutter run
Select the desired device

##UI State Handling
Loading State: Shows a progress indicator while data is fetched
Empty State: Shows a message when no movies or search results are found
Error State: Shows an error message if the API request fails

##Assumptions and Design Decisions
Authentication was not required, so no login functionality is implemented
Each app session is treated as a unique user
Favourites and Watchlist are stored in memory
Genre names are mapped locally from TMDB genre IDs
Focus was on clarity, correctness, and timely completion

##Dependencies
flutter
http
(All dependencies are listed in pubspec.yaml)

##Code Quality
Clean and readable structure
Logical widget separation
Meaningful variable and method names
Comments added for important logic

##Author
Joann M. Joseph
MS Ramaiah Institute of Technology
(Project repository hosted on a collaborator account due to system constraints)

Notes

This project is original work developed specifically for the Lenskart internship coding assignment and follows all provided guidelines.
