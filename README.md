Lenskart Movie App – Flutter Assignment
Description

This project is a Flutter-based mobile application developed as part of the Lenskart internship coding assignment. The application uses TMDB (The Movie Database) API to fetch and display popular movies and allows users to search, view movie details, and manage favourites and a watchlist.

The focus of this project is on clean UI, readable code, and handling common UI states such as loading, empty, and error conditions.

Features

Splash Screen

Bottom Navigation with Movies, Favourites, and Watchlist

Fetch popular movies using TMDB API

Search movies by title

Movie details screen with:

Banner image

Description

Genres

Rating

Release date

Add movies to Favourites and Watchlist

Visual feedback for favourite and watchlist actions

In-app notification on Play Now

App Flow

Splash Screen → Home Page

Home Page includes:

Movies (Landing Screen)

Favourites

Watchlist

Selecting a movie opens the Movie Detail screen.

Tech Stack

Flutter (Dart)

TMDB API

HTTP package

Setup Instructions

Install Flutter by following the official guide:
https://docs.flutter.dev/get-started/install

Clone the repository:
git clone <repository-url>

Navigate to the project directory:
cd movie_dle

Install dependencies:
flutter pub get

Add TMDB API key in lib/main.dart:
const String apiKey = "YOUR_TMDB_API_KEY";

Run the application:
flutter run

Select a device (Chrome, Windows, or Android).

Steps to Run the Assignment Locally

Clone the GitHub repository.

Install dependencies using flutter pub get.

Add a valid TMDB API key in lib/main.dart.

Run the app using flutter run.

Select the desired device to launch the application.

UI State Handling

Loading State: Displays a progress indicator while data is fetched.

Empty State: Displays a message when no movies or search results are available.

Error State: Displays an error message if the API request fails.

Assumptions & Design Decisions

Authentication was not required, so no login functionality is implemented.

Each app session is treated as a unique user.

Favourites and Watchlist are stored in memory.

Genre names are mapped locally from TMDB genre IDs to avoid extra API calls.

Focus was on clarity, correctness, and timely completion.

Dependencies

flutter

http

All dependencies are listed in pubspec.yaml.
