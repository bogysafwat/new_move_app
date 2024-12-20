import 'package:flutter/material.dart';
import 'package:new_move_app/views/pages/movie_description.dart';
import 'package:new_move_app/views/pages/see_more_page.dart';

import '../../models/movie.dart';

Widget buildCategory(String title, List<Movie> movies, BuildContext context,) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(color:Colors.white ,fontSize: 18, fontWeight: FontWeight.bold),
              ),
                 Expanded(child: SizedBox()),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                        context,
                         MaterialPageRoute(
                           builder: (context) =>
                              SeeMorePage(Catmovies: movies,)
                         ));
                   },
                   child: Text(
                     'See More',
                      style: TextStyle(color:Colors.white ,fontSize: 15, fontWeight: FontWeight.bold),),
                 ),
            ],
          ),

        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Column(
                    children: [
                      movie.posterPath != null
                          ? GestureDetector(
                            child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                    child: Image.network(
                            'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                            height: 200,
                            fit: BoxFit.cover,
                                                    ),
                                                  ),

                           onTap:(){
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) =>
                                        MovieDescription(movie: movie,)
                                 ));

                           } ,
                          )
                          : Container(
                        width: 100,
                        height: 150,
                        color: Colors.grey,
                        child: Icon(Icons.movie),
                      ),
                      // SizedBox(height:3 ),
                      Text(
                        movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14,color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}