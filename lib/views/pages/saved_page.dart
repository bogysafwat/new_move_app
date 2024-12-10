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
    final sp=Provider.of<SavedProvider>(context);

    return Scaffold(
        backgroundColor: const Color(0xFF070420),
        appBar: AppBar(backgroundColor:Color(0xFF070420) ,
          title: Text('Saved',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          actions: [
            ElevatedButton(
              onPressed: (){
              sp.savedMovie.clear();
              },
              child: Text(
                "Delete",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                elevation: MaterialStateProperty.all<double>(0),
              ),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: sp.savedMovie.length,
            itemBuilder: (context,index){
              return SavedMovieCard(movie: sp.savedMovie[index]);

            }));

    }
}