import 'package:flutter/material.dart';

import '../../utils/strings.dart';
import '../pages/genre_page.dart';

Widget CategoryButton(final onPrssed,lable,BuildContext context,genreId){
  return ElevatedButton(
    onPressed: (){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
              GenrePage(genreTitl: lable,genreId:genreId )
          ));
    },
    child: Text(
      '$lable',
      style: TextStyle(color: Colors.white),
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFB71C1C)), // Red background
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
         // Red border
        ),
      ),
    ),
  );
}