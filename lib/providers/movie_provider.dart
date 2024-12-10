import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../services/movie_service.dart';

class MovieProvider with ChangeNotifier {
  final MovieService _movieService = MovieService();

  List<Movie> popularMovies = [];
  List<Movie> topRatedMovies = [];
  List<Movie> trendingMovies = [];
  Map<int, String> genres = {}; // Genre ID to Name mapping
  Map<int, List<Movie>> genreMovies = {}; // Genre ID to Movies mapping

  // Add lists for trailers and similar movies
  Map<int, String?> movieTrailers = {}; // Movie ID to trailer URL mapping
  Map<int, List<Movie>> similarMovies = {}; // Movie ID to similar movies mapping

  bool isLoading = true;
  String? errorMessage;

  MovieProvider() {
    fetchInitialData();
  }

  /// Fetches popular, top-rated, trending movies, genres, and trailers
  Future<void> fetchInitialData() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      popularMovies = await _movieService.fetchPopularMovies();
      topRatedMovies = await _movieService.fetchTopRatedMovies();
      trendingMovies = await _movieService.fetchTrendingMovies();
      genres = await _movieService.fetchGenres();
      // Fetch trailer for popular movies (or other movies if needed)
      for (var movie in popularMovies) {
        await fetchTrailerForMovie(movie.id);
      }
    } catch (e) {
      errorMessage = 'Failed to load movies or genres. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Fetches movies for a specific genre and stores them in `genreMovies`
  Future<void> fetchMoviesForGenre(int genreId) async {
    if (genreMovies.containsKey(genreId)) return; // Avoid duplicate fetches

    try {
      final movies = await _movieService.fetchMoviesByGenre(genreId: genreId);
      genreMovies[genreId] = movies;
      notifyListeners();
    } catch (e) {
      print('Error fetching movies for genre $genreId: $e');
    }
  }

  /// Refresh a specific genre if needed
  Future<void> refreshMoviesForGenre(int genreId) async {
    try {
      final movies = await _movieService.fetchMoviesByGenre(genreId: genreId);
      genreMovies[genreId] = movies;
      notifyListeners();
    } catch (e) {
      print('Error refreshing movies for genre $genreId: $e');
    }
  }

  /// Fetch trailer for a specific movie
  Future<void> fetchTrailerForMovie(int movieId) async {
    try {
      final trailerUrl = await _movieService.fetchMovieTrailer(movieId);
      movieTrailers[movieId] = trailerUrl;
      notifyListeners();
    } catch (e) {
      print('Error fetching trailer for movie $movieId: $e');
    }
  }

  /// Fetch similar movies for a specific movie
  Future<void> fetchSimilarMovies(int movieId) async {
    if (similarMovies.containsKey(movieId)) return; // Avoid duplicate fetches

    try {
      final movies = await _movieService.fetchSimilarMovies(movieId);
      similarMovies[movieId] = movies;
      notifyListeners();
    } catch (e) {
      print('Error fetching similar movies for movie $movieId: $e');
    }
  }

  List<Movie> searchResults = [];
  bool isSearching = false;
  String? searchError;

  // Search for movies
  Future<void> searchMovies(String query) async {
    isSearching = true;
    searchError = null;
    notifyListeners();

    try {
      searchResults = await _movieService.searchMovies(query);
    } catch (e) {
      searchError = 'Failed to search for movies. Please try again.';
    } finally {
      isSearching = false;
      notifyListeners();
    }
  }
}
