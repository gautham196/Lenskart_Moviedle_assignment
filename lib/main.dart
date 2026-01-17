// Movie App Assignment
// Platform: Flutter (Dart)
// Description:
// A simple movie browsing app using TMDB API.
// Features include movie listing, search, favourites, watchlist,
// movie details screen, and basic UI states (loading, empty, error).

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// TMDB API Key (v3 auth)
const String apiKey = "6309d02da19f310bc8c331a51c5639f5";

// Local mapping of TMDB genre IDs to human-readable names
// This avoids an extra API call and keeps the app simple
final Map<int, String> genreMap = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  18: "Drama",
  10751: "Family",
  14: "Fantasy",
  27: "Horror",
  9648: "Mystery",
  878: "Sci-Fi",
  53: "Thriller",
};

// Entry point of the application
void main() {
  runApp(const MyApp());
}

// Root widget of the application
// Sets up Material theme and initial screen
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}

/* ---------------- SPLASH ---------------- */
// Splash screen shown on app launch
// Navigates automatically to HomePage after 2 seconds
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });

    return const Scaffold(
      body: Center(
        child: Text(
          "MOVIE APP",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

/* ---------------- HOME ---------------- */
// HomePage manages bottom navigation and shared app state
// Favourites and Watchlist are stored here to keep them unique per user session
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  // List to store user's favourite movies
  final List<Map<String, dynamic>> favourites = [];

  // List to store user's watchlist movies
  final List<Map<String, dynamic>> watchlist = [];

  // Adds a movie to favourites if it is not already present
  void addFav(movie) {
    if (!favourites.any((m) => m['id'] == movie['id'])) {
      setState(() => favourites.add(movie));
    }
  }

  void addWatch(movie) {
    if (!watchlist.any((m) => m['id'] == movie['id'])) {
      setState(() => watchlist.add(movie));
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      MoviesScreen(
        favourites: favourites,
        watchlist: watchlist,
        onFav: addFav,
        onWatch: addWatch,
      ),
      SimpleList(title: "Favourites", movies: favourites),
      SimpleList(title: "Watchlist", movies: watchlist),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Watchlist",
          ),
        ],
      ),
    );
  }
}

/* ---------------- MOVIES ---------------- */
// MoviesScreen fetches popular movies from TMDB API
// Provides search functionality and allows adding movies
// to favourites or watchlist
class MoviesScreen extends StatefulWidget {
  final Function onFav;
  final Function onWatch;
  final List favourites;
  final List watchlist;

  const MoviesScreen({
    super.key,
    required this.onFav,
    required this.onWatch,
    required this.favourites,
    required this.watchlist,
  });

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List movies = [];
  List filteredMovies = [];
  bool loading = true;
  bool error = false;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  // Fetches popular movies from TMDB API
  // Handles loading and error states
  Future<void> fetchMovies() async {
    try {
      final url = "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
      final res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        setState(() {
          movies = data['results'];
          filteredMovies = movies;
          loading = false;
        });
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      setState(() {
        loading = false;
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error) {
      return const Center(child: Text("Error loading movies"));
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "Search movies",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),

            // Filters movie list based on search input
            onChanged: (value) {
              setState(() {
                filteredMovies = movies
                    .where(
                      (m) => m['title'].toLowerCase().contains(
                        value.toLowerCase(),
                      ),
                    )
                    .toList();
              });
            },
          ),
        ),
        Expanded(
          child: filteredMovies.isEmpty
              ? const Center(child: Text("No movies found"))
              : ListView.builder(
                  itemCount: filteredMovies.length,
                  itemBuilder: (context, i) {
                    final m = filteredMovies[i];
                    final isFav = widget.favourites.any(
                      (x) => x['id'] == m['id'],
                    );
                    final isWatch = widget.watchlist.any(
                      (x) => x['id'] == m['id'],
                    );

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MovieDetail(movie: m),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w200${m['poster_path']}",
                                  width: 90,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      m['title'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "⭐ ${m['vote_average']}  |  ${m['release_date']}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 6),

                                    // Converts TMDB genre IDs to readable genre names
                                    Text(
                                      "Genres: ${(m['genre_ids'] as List).map((id) => genreMap[id] ?? "Other").join(', ')}",
                                      style: const TextStyle(fontSize: 12),
                                    ),

                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            color: isFav
                                                ? Colors.red
                                                : Colors.grey,
                                          ),
                                          onPressed: () => widget.onFav(m),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.bookmark,
                                            color: isWatch
                                                ? Colors.blue
                                                : Colors.grey,
                                          ),
                                          onPressed: () => widget.onWatch(m),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

/* ---------------- DETAILS ---------------- */
// MovieDetail screen displays detailed information
// about a selected movie including banner, description,
// release date and play action
class MovieDetail extends StatelessWidget {
  final Map movie;
  const MovieDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie['title'])),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${movie['backdrop_path']}",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie['title'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text("Release Date: ${movie['release_date']}"),
                  const SizedBox(height: 10),
                  Text(movie['overview']),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Movie is Playing")),
                        );
                      },
                      child: const Text("Play Now"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- LIST ---------------- */
// Reusable list screen for Favourites and Watchlist
// Displays empty state when no movies are added
class SimpleList extends StatelessWidget {
  final String title;
  final List movies;

  const SimpleList({super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return Center(child: Text("No movies added"));
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, i) {
          return ListTile(title: Text(movies[i]['title']));
        },
      ),
    );
  }
}
