import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../models/movie.dart';
import '../../providers/downloaded_provider.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final dp=Provider.of<DownloadedProvider>(context);
    return Scaffold(
        backgroundColor: const Color(0xFF070420),
        extendBodyBehindAppBar: true,
          appBar:AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Navigate back when tapped
              },
              child: Container(
                margin: const EdgeInsets.all(8), // Adds padding around the circle
                decoration: BoxDecoration(
                  color: Colors.grey.shade800, // Background color of the circle
                  shape: BoxShape.circle, // Makes it circular
                ),
                child: const Icon(
                  Icons.arrow_back, // Back arrow icon
                  color: Colors.white, // Icon color
                ),
              ),
            ),
          ),
            actions: [
              GestureDetector(
                onTap: () {

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    child: Image.asset(
                      'lib/assets/bookmark.png', // Path to your image
                      height: 24, // Adjust the height of the image
                      width: 24,  // Adjust the width of the image
                    ),
                    margin: const EdgeInsets.all(8), // Adds padding around the circle
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800, // Background color of the circle
                      shape: BoxShape.circle,)
                  ),
                ),
              )
            ],
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [

              Container(

                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black, // Shadow color
                      blurRadius: 20, // How much the shadow blurs
                      spreadRadius: -5, // Negative value for inner shadow
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                child: Stack(
                  children: [
                    // Movie Poster
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        height: 500,
                        width: double.infinity,
                        fit: BoxFit.cover,

                      ),
                    ),
                    // Inner Shadow Overlay
                    Container(
                      height: 500,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.6), // Top shadow color
                            Colors.transparent,           // Transparent center
                            Colors.black.withOpacity(0.6), // Bottom shadow color
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Center(child: Text(movie.title,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)),
              SizedBox(height: 5,),
              Center(child: Text(movie.releaseDate.substring(0,4),style: TextStyle(fontSize: 18,color: Colors.white),)),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReadMoreText(
                  '${movie.description}',
                  style:TextStyle(color: Colors.white,fontSize: 12) ,
                  trimMode: TrimMode.Line,
                  trimLines:1 ,
                  colorClickableText: Colors.white,
                  trimCollapsedText: 'Read More',
                  trimExpandedText: 'Read less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
                  lessStyle:TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white) ,
                ),
              ),
              SizedBox(height: 7,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Add your action here
                      },
                      icon: const Icon(
                        Icons.play_arrow, // Replace with your desired icon
                        color: Colors.white, // Icon color
                      ),
                      label: const Text(
                        'Watch Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFB71C1C)), // Transparent background
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0), // Rounded corners
                          ),
                        ),

                      ),
                    ),

                  ),
                  SizedBox(width: 10,),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        dp.add(movie);
                      },
                      icon: const Icon(
                        Icons.download_rounded, // Replace with your desired icon
                        color: Colors.white, // Icon color
                      ),
                      label: const Text(
                        'Download',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Transparent background
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0), // Rounded corners
                          ),
                        ),

                      ),
                    ),
                  )
                ],),
              ),


            ],
          ),
        ) ,
    );
  }
}



