import 'package:flutter/material.dart';
import 'package:new_move_app/views/widgets/description_button.dart';
import 'package:new_move_app/views/widgets/movie_tralier_card.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/movie_provider.dart';
import '../pages/movie_description.dart';


class BuildDescripitionButton extends StatefulWidget {
  final int movieId;
  final Movie movie;

  BuildDescripitionButton({required this.movie, required this.movieId});

  @override
  _BuildDescripitionButtonState createState() => _BuildDescripitionButtonState();
}

class _BuildDescripitionButtonState extends State<BuildDescripitionButton> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Buttons Row
        Row(
          children: [
            DescriptionButton(
              index: 0,
              title: 'Episode',
              selectedIndex: _selectedIndex,
              onPressed: _onButtonPressed,
            ),
            DescriptionButton(
              index: 1,
              title: 'Similar',
              selectedIndex: _selectedIndex,
              onPressed: _onButtonPressed,
            ),
            DescriptionButton(
              index: 2,
              title: 'About',
              selectedIndex: _selectedIndex,
              onPressed: _onButtonPressed,
            ),
          ],
        ),

        // Content Container
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: double.infinity,
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            child: _buildContent(widget.movieId),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(int movieId) {
    final movieProvider = Provider.of<MovieProvider>(context);

    switch (_selectedIndex) {
      case 0:
      // Safely check if trailer exists
        final trailerUrl = movieProvider.movieTrailers[widget.movie.id];
        if (trailerUrl == null || trailerUrl.isEmpty) {
          return const Center(
            child: Text(
              'Trailer not available.',
              style: TextStyle(color: Colors.white),
            ),
          );
        }
        final parsedTrailerUrl = Uri.tryParse(trailerUrl);
        if (parsedTrailerUrl == null) {
          return const Center(
            child: Text(
              'Invalid trailer URL.',
              style: TextStyle(color: Colors.white),
            ),
          );
        }
        return MovieTralierCard(movie: widget.movie, url: parsedTrailerUrl);

      case 1:
      // Check for similar movies
        final similarMoviesList = movieProvider.similarMovies[movieId];
        if (similarMoviesList == null || similarMoviesList.isEmpty) {
          return const Center(
            child: Text(
              'No similar movies found.',
              style: TextStyle(color: Colors.white),
            ),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: similarMoviesList.length,
          itemBuilder: (context, index) {
            final movie = similarMoviesList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDescription(movie: movie),
                  ),
                );
              },
              child: Column(
                children: [
                  movie.posterPath != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Container(
                    height: 200,
                    color: Colors.grey,
                    child: const Icon(Icons.movie, size: 50),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        );

      case 2:
      // Check if description exists
        return Text(
          widget.movie.description?.isNotEmpty == true
              ? widget.movie.description!
              : 'No description available.',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        );

      default:
        return const Text(
          'Default Content',
          style: TextStyle(color: Colors.white, fontSize: 18),
        );
    }
  }

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
