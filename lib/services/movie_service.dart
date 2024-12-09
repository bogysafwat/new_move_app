import 'package:dio/dio.dart';

import '../models/movie.dart';


class MovieService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final String _apiKey = '8314ab4778c81eee6b550660698d3809'; // Replace with your TMDb API key
  final String _language = 'en-US';

  // Fetch popular movies
  Future<List<Movie>> fetchPopularMovies({int page = 1}) async {
    return _fetchMovies(endpoint: '/movie/popular', page: page);
  }

  // Fetch top-rated movies
  Future<List<Movie>> fetchTopRatedMovies({int page = 1}) async {
    return _fetchMovies(endpoint: '/movie/top_rated', page: page);
  }

  // Fetch trending movies
  Future<List<Movie>> fetchTrendingMovies({int page = 1}) async {
    return _fetchMovies(endpoint: '/trending/movie/day', page: page);
  }

  // General method to fetch movies
  Future<List<Movie>> _fetchMovies({required String endpoint, int page = 1}) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: {
          'api_key': _apiKey,
          'language': _language,
          'page': page,
        },
      );

      final List<dynamic>? results = response.data['results'];
      if (results == null) {
        throw Exception('No movies found');
      }

      return results.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } catch (e) {
      print('Error fetching movies from $endpoint: $e');
      throw Exception('Failed to fetch movies');
    }
  }

  // Fetch genres
  Future<Map<int, String>> fetchGenres() async {
    try {
      final response = await _dio.get(
        '/genre/movie/list',
        queryParameters: {
          'api_key': _apiKey,
          'language': _language,
        },
      );

      final List<dynamic>? genresList = response.data['genres'];
      if (genresList == null) {
        throw Exception('No genres found');
      }

      return {
        for (var genre in genresList) genre['id'] as int: genre['name'] as String,
      };
    } catch (e) {
      print('Error fetching genres: $e');
      throw Exception('Failed to fetch genres');
    }
  }

  // Fetch movies by genre
  Future<List<Movie>> fetchMoviesByGenre({required int genreId, int page = 1}) async {
    try {
      final response = await _dio.get(
        '/discover/movie',
        queryParameters: {
          'api_key': _apiKey,
          'language': _language,
          'sort_by': 'popularity.desc',
          'page': page,
          'with_genres': genreId.toString(),
        },
      );

      final List<dynamic>? results = response.data['results'];
      if (results == null) {
        throw Exception('No movies found for genre ID: $genreId');
      }

      return results.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } catch (e) {
      print('Error fetching movies by genre: $e');
      throw Exception('Failed to fetch movies by genre');
    }
  }

  // Fetch trailer for a movie
  Future<String?> fetchMovieTrailer(int movieId) async {
    try {
      final response = await _dio.get(
        '/movie/$movieId/videos',
        queryParameters: {
          'api_key': _apiKey,
          'language': _language,
        },
      );

      final List<dynamic>? results = response.data['results'];
      if (results == null || results.isEmpty) {
        return null;
      }

      // Filter for a YouTube trailer
      final trailer = results.firstWhere(
            (video) => video['type'] == 'Trailer' && video['site'] == 'YouTube',
        orElse: () => null,
      );

      return trailer != null ? 'https://www.youtube.com/watch?v=${trailer['key']}' : null;
    } catch (e) {
      print('Error fetching trailer for movie $movieId: $e');
      return null;
    }
  }

  // Fetch similar movies for a movie
  Future<List<Movie>> fetchSimilarMovies(int movieId, {int page = 1}) async {
    try {
      final response = await _dio.get(
        '/movie/$movieId/similar',
        queryParameters: {
          'api_key': _apiKey,
          'language': _language,
          'page': page,

        },
      );
      print(response);
      final List<dynamic>? results = response.data['results'];
      if (results == null) {
        throw Exception('No similar movies found for movie ID: $movieId');
      }

      return results.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } catch (e) {
      print('Error fetching similar movies for movie $movieId: $e');
      throw Exception('Failed to fetch similar movies');
    }
  }
}
