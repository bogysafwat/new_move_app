import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_move_app/views/pages/download_page.dart';
import 'package:new_move_app/views/pages/me_page.dart';
import 'package:new_move_app/views/pages/saved_page.dart';
import 'package:new_move_app/views/widgets/category_Button.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/movie_provider.dart';
import '../widgets/custom_carousel.dart';
import '../widgets/custom_category.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    if (movieProvider.isLoading) {
      return SafeArea(
        child: Scaffold(
        backgroundColor: const Color(0xFF070420),
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (movieProvider.errorMessage != null) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF070420),
        
          body: Center(child: Text(movieProvider.errorMessage!)),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF070420),
       
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTrendingCarousel(movieProvider.trendingMovies),
              SizedBox(height: 7,),
              Text('Catagories',  style: TextStyle(color:Colors.white ,fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(width: 5,),
              Row(
                children: [
                  CategoryButton((){}, 'Acton'),
                  SizedBox(width: 5,),
                  CategoryButton((){}, 'Drama'),
                  SizedBox(width: 5,),
                  CategoryButton((){}, 'Comedy'),
                  SizedBox(width: 5,),
                  CategoryButton((){}, 'Romance')
                ]
              ),
              buildCategory('Popular Movies', movieProvider.popularMovies,context),
              buildCategory('Top Rated Movies', movieProvider.topRatedMovies,context),
              buildCategory('Trending Movies', movieProvider.trendingMovies,context),

            ],
          ),
        ),

      ),
    );
  }


}