import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:new_move_app/providers/saved_provider.dart';
import 'package:new_move_app/views/widgets/saved_movie_card.dart';
import 'package:provider/provider.dart';

import '../../providers/movie_provider.dart';

// Assuming MovieProvider is already imported

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dp=Provider.of<SavedProvider>(context);

    return Scaffold(
        backgroundColor: const Color(0xFF070420),
        appBar: AppBar(backgroundColor:Color(0xFF070420) ,
          title: Text('Saved',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: dp.savedMovie.length,
            itemBuilder: (context,index){
              return SavedMovieCard(movie: dp.savedMovie[index]);

            }));

    }
}