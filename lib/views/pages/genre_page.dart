import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/movie_provider.dart';
import '../widgets/build_genre_section.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({super.key,  required this.genreId, this.genreTitl});

    final int genreId;
    final genreTitl;
   // final int comedyGenreId = 35; // Comedy
  //  final int romanceGenreId = 10749; // Romance

    @override
    Widget build(BuildContext context) {
      final movieProvider = Provider.of<MovieProvider>(context);

      return Scaffold(
        backgroundColor: const Color(0xFF070420),
        appBar: AppBar(
          title: Text('${genreTitl}',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor:const Color(0xFF070420) ,
          iconTheme: IconThemeData(
            color: Colors.white,),
        ),
        body: movieProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildGenreSection(
                context,
                "",
                genreId ,
              ),
            ],
          ),
        ),
      );
    }
  }

