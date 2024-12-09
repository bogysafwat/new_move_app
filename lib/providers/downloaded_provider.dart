import 'package:flutter/material.dart';
import 'package:new_move_app/models/movie.dart';

class DownloadedProvider extends ChangeNotifier {
  List<Movie> downloadedMovie=[];

  void add(Movie movie){
    if(downloadedMovie.contains(movie)){

    }else{downloadedMovie.add(movie);}
    notifyListeners();
  }

  void remove(Movie movie){
    downloadedMovie.remove(movie);
    notifyListeners();
  }

  int get count{
    return downloadedMovie.length;
  }

}