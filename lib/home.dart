import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http; //sebagai http port
import 'package:movie_app/detail.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/results.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <Results> popularMovie;

  String baseUrl = 'https://api.themoviedb.org/3';
  String apiKey = 'd710d8beef1570a4fdd4a3df0110c4f6';
  String posterUrl = 'https://image.tmdb.org/t/p/w500';
  Future<Movie> getData() async {
    var res = await http.get(Uri.encodeFull('$baseUrl/movie/popular?api_key=$apiKey'),
        headers:{'accept': 'applications/json'} );
    var movies = Movie();
    setState(() {
      if(res.statusCode == 200) {
        movies = Movie.fromJsonMap(jsonDecode(res.body));
        popularMovie = movies.results;
      } else {
        throw Exception(res.statusCode);
      }
    });
    return movies; //sumber data
  }

  //inisialisasi state agar bisa dipake di context atau komponen yg lainnya
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
        itemCount: popularMovie == null ? 0 : popularMovie.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7
      ),
          itemBuilder: (BuildContext context, int position) {
            return GestureDetector( //karna kita butuh onTap dan yg bisa munculin ya gesture detector
              //ketika item di klik mau kemana dan dimana
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PageDetail(results : popularMovie[position]); // di intent ke halaman detail
                }));
              },
              child: Container(
                child: Card(
                  child: Container(
                    child: Image.network(
                      this.posterUrl + popularMovie[position].poster_path,
                      fit: BoxFit.fill,),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
