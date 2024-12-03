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

  final String _apiKey = '955c75fec5a0938324d78976e1d9bb7c'; // Replace with your TMDb API key
  final String _language = 'en-US';

  // Fetch popular movies
  Future<List<Movie>> fetchPopularMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        '/movie/popular',
        queryParameters: {
          'api_key': _apiKey,
          'language': _language,
          'page': page,
        },
      );

      final List<dynamic> results = response.data['results'];
      return results.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } catch (e) {
      print('Error fetching popular movies: $e');
      throw Exception('Failed to fetch popular movies');
    }
  }

  // Fetch top-rated movies
  Future<List<Movie>> fetchTopRatedMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        '/movie/top_rated',
        queryParameters: {
          'api_key': _apiKey,
          'language': _language,
          'page': page,
        },
      );

      final List<dynamic> results = response.data['results'];
      return results.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } catch (e) {
      print('Error fetching top-rated movies: $e');
      throw Exception('Failed to fetch top-rated movies');
    }
  }

  // Fetch trending movies
  Future<List<Movie>> fetchTrendingMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        '/trending/movie/day',
        queryParameters: {
          'api_key': _apiKey,
          'language': _language,
          'page': page,
        },
      );

      final List<dynamic> results = response.data['results'];
      return results.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } catch (e) {
      print('Error fetching trending movies: $e');
      throw Exception('Failed to fetch trending movies');
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

      final List<dynamic> genresList = response.data['genres'];
      return {
        for (var genre in genresList) genre['id'] as int: genre['name'] as String,
      };
    } catch (e) {
      print('Error fetching genres: $e');
      throw Exception('Failed to fetch genres');
    }
  }

  // Fetch movies by genre ID
  Future<List<Movie>> fetchMoviesByGenre(int genreId, {int page = 1}) async {
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

      final List<dynamic> results = response.data['results'];
      return results.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } catch (e) {
      print('Error fetching movies by genre: $e');
      throw Exception('Failed to fetch movies by genre');
    }
  }
}
