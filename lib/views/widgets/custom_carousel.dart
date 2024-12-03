import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/movie.dart';


Widget buildTrendingCarousel(List<Movie> trendingMovies) {
  return SizedBox(
    height: 400,
    child: CarouselSlider.builder(
      itemCount: trendingMovies.length,
      itemBuilder: (context, index, realIndex) {
        final movie = trendingMovies[index];

        return GestureDetector(
          onTap: () {
            // Handle movie tap here (e.g., navigate to movie details)
            print('Tapped on: ${movie.title}');
          },
          child: Stack(
            children: [
              Container(
                height:400,
                width: double.infinity,
                child: movie.posterPath != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                       height: 500,
                                    ),
                    )
                    : Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey,
                  child: Icon(Icons.movie, size: 50),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 10,
                child: Text(
                  movie.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: 500,
        autoPlay: true, // Enable auto play
        autoPlayInterval: Duration(seconds: 3), // Auto play interval
        autoPlayAnimationDuration: Duration(milliseconds: 800), // Animation duration
        enlargeCenterPage: true, // Enlarges the current item
        aspectRatio: 16 / 9, // Aspect ratio of the carousel
        viewportFraction: 0.8, // Adjust the width of each item
      ),
    ),
  );
}
