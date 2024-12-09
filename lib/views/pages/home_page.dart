
import 'package:flutter/material.dart';
import 'package:new_move_app/views/widgets/category_Button.dart';
import 'package:provider/provider.dart';
import '../../providers/movie_provider.dart';
import '../../utils/strings.dart';
import '../widgets/custom_carousel.dart';
import '../widgets/custom_category.dart';


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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Catagories',  style: TextStyle(color:Colors.white ,fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              SizedBox(width: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryButton((){}, 'Acton',context,Strings.actionGenreId),
                      SizedBox(width: 5,),
                      CategoryButton((){}, 'Drama',context,Strings.dramaGenreId),
                      SizedBox(width: 5,),
                      CategoryButton((){}, 'Comedy',context,Strings.comedyGenreId),
                      SizedBox(width: 5,),
                      CategoryButton((){}, 'Romance',context,Strings.romanceGenreId),
                      SizedBox(width: 5,),
                      CategoryButton((){}, 'Animation',context,Strings.animationGenreId),
                      SizedBox(width: 5,),
                      CategoryButton((){}, 'Crime',context,Strings.crimeGenreId),
                      SizedBox(width: 5,),
                    ]
                  ),
                ),
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