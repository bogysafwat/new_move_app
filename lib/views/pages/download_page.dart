import 'package:flutter/material.dart';
import 'package:new_move_app/views/widgets/downloded_movie_card.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/downloaded_provider.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key, });

  @override
  Widget build(BuildContext context) {
    final dp=Provider.of<DownloadedProvider>(context);
    return Scaffold(
        backgroundColor: const Color(0xFF070420),
    appBar: AppBar(backgroundColor:Color(0xFF070420) ,
      title: Text('Download',style: TextStyle(color: Colors.white),),
      centerTitle: true,
    ),
    body: ListView.builder(
    itemCount: dp.downloadedMovie.length,
    itemBuilder: (context,index){
    return DownlodedMovieCard(movie: dp.downloadedMovie[index]);

    }));
  }
}
