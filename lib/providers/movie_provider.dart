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

  bool isLoading = true;
  String? errorMessage;

  MovieProvider() {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final popular = await _movieService.fetchPopularMovies();
      final topRated = await _movieService.fetchTopRatedMovies();
      final trending = await _movieService.fetchTrendingMovies();
      final fetchedGenres = await _movieService.fetchGenres();

      popularMovies = popular;
      topRatedMovies = topRated;
      trendingMovies = trending;
      genres = fetchedGenres;
    } catch (e) {
      errorMessage = 'Failed to load movies or genres. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMoviesForGenre(int genreId) async {
    if (genreMovies.containsKey(genreId)) return; // Avoid duplicate fetches

    try {
      final movies = await _movieService.fetchMoviesByGenre(genreId);
      genreMovies[genreId] = movies;
      notifyListeners();
    } catch (e) {
      print('Error fetching movies for genre $genreId: $e');
    }
  }
}
