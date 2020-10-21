import 'package:flutter/material.dart';
import 'package:movie_app/widget.dart';
import 'model/tv/results.dart';

class TvDetail extends StatelessWidget {
  final Results results;

  TvDetail({@required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailTvScreen(results: results),
    );
  }
}

class DetailTvScreen extends StatelessWidget {
  final Results results;

  DetailTvScreen({@required this.results});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: BackdropImage(results.backdrop_path),
              ),
              Positioned(bottom: 0.0, right: 16.0, child: FavoriteButton())
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
            child: Text(
              results.name,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Text(
              results.first_air_date,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Text(
              results.overview,
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isfavorite = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(
          isfavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            isfavorite = !isfavorite;
          });
        });
  }
}
