

class Results {
  double popularity;
  int vote_count;
  bool video;
  String poster_path;
  int id;
  bool adult;
  String backdrop_path;
  String original_language;
  String original_title;
  List<int> genre_ids;
  String title;
  double vote_average;
  String overview;
  String release_date;

  Results(
      {this.popularity,
      this.vote_count,
      this.video,
      this.poster_path,
      this.id,
      this.adult,
      this.backdrop_path,
      this.original_language,
      this.original_title,
      this.genre_ids,
      this.title,
      this.vote_average,
      this.overview,
      this.release_date});

  Results.fromJsonMap(Map<String, dynamic> map)
      : popularity = map["popularity"],
        vote_count = map["vote_count"],
        video = map["video"],
        poster_path = map["poster_path"],
        id = map["id"],
        adult = map["adult"],
        backdrop_path = map["backdrop_path"],
        original_language = map["original_language"],
        original_title = map["original_title"],
        genre_ids = List<int>.from(map["genre_ids"]),
        title = map["title"],
        vote_average = map["vote_average"],
        overview = map["overview"],
        release_date = map["release_date"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = popularity;
    data['vote_count'] = vote_count;
    data['video'] = video;
    data['poster_path'] = poster_path;
    data['id'] = id;
    data['adult'] = adult;
    data['backdrop_path'] = backdrop_path;
    data['original_language'] = original_language;
    data['original_title'] = original_title;
    data['genre_ids'] = genre_ids;
    data['title'] = title;
    data['vote_average'] = vote_average;
    data['overview'] = overview;
    data['release_date'] = release_date;
    return data;
  }
}
