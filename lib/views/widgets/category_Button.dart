import 'package:flutter/material.dart';

Widget CategoryButton(final onPrssed,lable){
  return ElevatedButton(
    onPressed: onPrssed,
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