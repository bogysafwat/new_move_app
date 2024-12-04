import 'package:flutter/material.dart';
import 'package:new_move_app/views/widgets/movie_card.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/downloaded_provider.dart';

class SeeMorePage extends StatelessWidget {
  SeeMorePage({super.key, required this.Catmovies});
  final  List<Movie> Catmovies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070420),
      appBar: AppBar(backgroundColor:Color(0xFF070420) ,
      iconTheme: IconThemeData(
      color: Colors.white,),),
      body: ListView.builder(
        itemCount: Catmovies.length,
          itemBuilder: (context,index){
          return MovieCard(movie:Catmovies[index]);

          }),

    );
  }
}
