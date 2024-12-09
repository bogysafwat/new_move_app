import 'package:flutter/material.dart';

import '../models/movie.dart';

class  SavedProvider extends ChangeNotifier{

  List<Movie> savedMovie=[];

  void add(Movie movie){
    if(savedMovie.contains(movie)){

    }else{savedMovie.add(movie);}
  notifyListeners();
  }

  void remove(Movie movie){
    savedMovie.remove(movie);
  notifyListeners();
  }

  int get count{
  return savedMovie.length;
  }

  }

