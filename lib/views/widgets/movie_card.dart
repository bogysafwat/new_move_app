import 'package:flutter/material.dart';
import 'package:new_move_app/models/movie.dart';
import 'package:new_move_app/views/pages/movie_description.dart';
import 'package:provider/provider.dart';

import '../../providers/downloaded_provider.dart';

class MovieCard extends StatelessWidget {
 MovieCard({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final dp=Provider.of<DownloadedProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                         MovieDescription(movie: movie)
                  ));
            },
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
                       ElevatedButton(
                         onPressed: (){
                           dp.add(movie);
                           ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(
                                 content: Text('Movie downloaded !'),
                               ));
                         },
                           child: Text(
                            'Download',
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
                      )

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
