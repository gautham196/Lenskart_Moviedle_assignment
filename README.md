# Lenskart Movie App – Flutter Assignment

## Description
This is a Flutter-based movie browsing application built as part of the
Lenskart internship assignment. The app uses **TMDB (The Movie Database) API**
to fetch and display popular movies and allows users to search, view details,
and manage favourites and a watchlist.

The focus of this project is on clean UI, proper app flow, and handling
different UI states such as loading, empty, and error scenarios.

---

## Features
- Splash Screen
- Bottom Navigation with:
  - Movies
  - Favourites
  - Watchlist
- Movie listing using TMDB API
- Search movies by title
- Movie detail screen with:
  - Banner image
  - Title
  - Overview
  - Release date
  - Genres
  - User rating
- Add movies to Favourites and Watchlist
- Visual feedback for liked/watchlisted movies
- In-app notification on **Play Now**
- Loading, Empty, and Error state handling
- Clean Material UI with card-based layout

---

## Tech Stack
- **Flutter (Dart)**
- **TMDB API**
- HTTP package for API calls

---

## App Flow
Splash Screen → Home Page  
Home Page contains Bottom Navigation:
- Movies (Landing Screen)
- Favourites
- Watchlist

Clicking a movie opens the Movie Detail screen.

---

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone <repository-url>
