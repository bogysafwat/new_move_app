import 'package:flutter/material.dart';
import 'package:new_move_app/providers/downloaded_provider.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';

class DownlodedMovieCard extends StatelessWidget {
  const DownlodedMovieCard({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color:Color(0xFF25233D),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.all(25.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'
                    ,height: 150,

                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                    padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text('${movie.title}',
                          style: TextStyle(
                              fontSize: 18,
                              color:Colors.white

                          ),
                        ),
                        SizedBox(height: 7,),
                        Text('Rating: ${movie.rating}',
                          style: TextStyle(
                              fontSize: 14,
                              color:Colors.white

                          ),
                        ), SizedBox(height: 7,),
                        Text('Release Date: ${movie.releaseDate.substring(0,4)}',
                          style: TextStyle(
                              fontSize: 14,
                              color:Colors.white

                          ),
                        ),

                        SizedBox(height: 15,),
                       /* ElevatedButton(
                          onPressed: (){
                            dp.remove(movie);
                          },
                          child: Text(
                            'Remove',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFB71C1C)), // Red background
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                // Red border
                              ),
                            ),
                          ),
                        )*/


                      ],
                    ),

                  ))

            ],
          )
        ],
      ),
    );
  }
}

