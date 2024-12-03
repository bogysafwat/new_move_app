import 'package:flutter/material.dart';
import 'package:new_move_app/providers/movie_provider.dart';
import 'package:new_move_app/views/pages/home_holder.dart';
import 'package:new_move_app/views/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies app ',
      home: HomeHolder(),

    );
  }
}
