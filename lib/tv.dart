import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/model/tv/results.dart';
import 'package:movie_app/model/tv/tv.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/tv_detail.dart';

class TvScreen extends StatefulWidget {
  @override
  _TvScreenState createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  List <Results> popularTv;

  String baseUrl = 'https://api.themoviedb.org/3';
  String apiKey = 'd710d8beef1570a4fdd4a3df0110c4f6';
  String posterUrl = 'https://image.tmdb.org/t/p/w500';
  Future<Tv> getData() async {
    var res = await http.get(Uri.encodeFull('$baseUrl/tv/popular?api_key=$apiKey'),
      headers:{'accept': 'applications/json'} );
    var tv = Tv();
    setState(() {
      if (res.statusCode == 200) {
        tv = Tv.fromJsonMap(jsonDecode(res.body));
        popularTv = tv.results;
      } else {
        throw Exception(res.statusCode);
      }
    });
    return tv;
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: GridView.builder(
        itemCount: popularTv == null? 0 : popularTv.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7
        ),
        itemBuilder: (BuildContext context, int position) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TvDetail(results : popularTv[position]);
              }));
            },
            child: Container(
              child: Card(
                child: Container(
                  child: Image.network(
                    this.posterUrl + popularTv[position].poster_path,
                    fit: BoxFit.fill,
                  )
                )
              )
            ),
          );
        }),
    );
  }
}
