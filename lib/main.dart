import 'package:flutter/material.dart';
import 'package:movie_app/home.dart';
import 'package:movie_app/tv.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Movie'),
          backgroundColor: Colors.amber,
        ),
        body: TvScreen(),
      ),
    );
  }
}

