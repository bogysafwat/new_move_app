import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/movie_provider.dart';
import '../widgets/custom_category.dart';

class SearchPage extends StatelessWidget {
  final searchController=TextEditingController();
   SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF070420),
      body: Column(
      children: [
        SizedBox(height:30 ,),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextField(
            style: TextStyle(color: Colors.white,fontSize: 18),
            controller: searchController,
            decoration: InputDecoration(

              filled: true,
              fillColor: const Color(0xFF25233D),
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(width: 0.8, color: Color(0xFF17212C)),
              ),
              hintText: 'Search by title , genre, actor ',
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon:  Icon(Icons.search, size: 30, color: Colors.white ),
            ),


        ),

      ),
        SizedBox(height:50,),
        
        
          Column(
            children: [
              buildCategory('Popular',movieProvider.popularMovies,context),
              SingleChildScrollView(child: buildCategory('recommended',movieProvider.popularMovies,context)),
            ],
          ),
        
       
  ]
      ));
  }
}