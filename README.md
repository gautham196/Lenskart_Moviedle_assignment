Lenskart Movie App – Flutter Assignment
Description

This project is a Flutter-based mobile application developed as part of the
Lenskart internship coding assignment. The application uses TMDB (The Movie
Database) API to fetch and display popular movies and allows users to search,
view movie details, and manage favourites and a watchlist.

The focus of this project is on clean UI, readable code, and handling common UI
states such as loading, empty, and error conditions.

Features

Splash Screen

Bottom Navigation with Movies, Favourites, and Watchlist

Fetch popular movies using TMDB API

Search movies by title

Movie details screen with banner, description, genres, rating, and release date

Add movies to Favourites and Watchlist

Visual feedback for favourite and watchlist actions

In-app notification on Play Now

Clean Material UI with card-based layout

Responsive layout for common screen sizes

App Flow

Splash Screen → Home Page

Home Page contains:

Movies (Landing Screen)

Favourites

Watchlist

Selecting a movie opens the Movie Detail screen.

Tech Stack

Flutter (Dart)

TMDB API

HTTP package

Setup Instructions

Install Flutter
Ensure Flutter SDK is installed on your system by following the official guide:
https://docs.flutter.dev/get-started/install

Clone the repository
git clone <repository-url>

Navigate to the project directory
cd movie_dle

Install dependencies
flutter pub get

Add TMDB API key
Open the file lib/main.dart and replace the following line:
const String apiKey = "YOUR_TMDB_API_KEY";
with your actual TMDB API key.

Run the application
flutter run

Select a device when prompted (Chrome, Windows, or Android device).

Steps to Run the Assignment Locally

Clone the GitHub repository.

Install dependencies using flutter pub get.

Add a valid TMDB API key in lib/main.dart.

Run the app using flutter run.

Select the desired device to launch the application.

UI State Handling

Loading State: A progress indicator is shown while movies are being fetched.

Empty State: A message is displayed when no movies are available or no search results are found.

Error State: An error message is displayed if the API request fails.

Assumptions & Design Decisions

Authentication was not required, so no login functionality is implemented.

Each app session is treated as a unique user.

Favourites and Watchlist are stored in memory.

Genre names are mapped locally from TMDB genre IDs to avoid additional API calls.

The focus was on correctness, clarity, and timely completion.

Dependencies

flutter

http

All dependencies are listed in the pubspec.yaml file.

Code Quality

Clean and readable folder structure

Clear widget separation

Meaningful variable and method names

Comments added to explain key logic

Author

Joann Joseph
MS Ramaiah Institute of Technology

(Project repository hosted on a collaborator account due to system constraints.)

Notes

This project is original work developed specifically for the Lenskart internship
coding assignment and follows all provided guidelines.
