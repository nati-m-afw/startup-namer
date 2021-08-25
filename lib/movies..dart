import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Movies {
  String _baseURL = "https://api.themoviedb.org/3";
  String? _apiKey = dotenv.env["API_KEY"];
  List<Movie> _currentList = [];
  int _page = 1;
  static final Movies _instance = Movies._internal(); // Class Data

  factory Movies ()=> _instance;

  // _internal() is a private constructor
  Movies._internal() {
    getTrending();
  }

  Future<List<Movie>> getTrending() async{
    Uri url = Uri.parse(_baseURL + "/trending/all/week?api_key=" + _apiKey! + "&page=" + _page.toString());
    final response = await http.get(url);

    if (response.statusCode == 200){
      _page += 1;
      for (var movie in json.decode(response.body)['results']) {
        _currentList.add(Movie.fromJson(movie));
      }
      return _currentList;
    } else {
      throw Exception("Failed to load movies");
    }
  }
}

class Movie {
  final int id;
  final String? title;
  final String? posterPath;
  final double? rating;
  final String? overview;
  final String? releaseDate;

  Movie({required this.id, this.title, this.posterPath, this.rating, this.overview, this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['original_title'],
      posterPath: "https://image.tmdb.org/t/p/original" + json['poster_path'],
      rating: json['vote_average'],
      overview: json['overview'],
      releaseDate: json['release_date']
    );
  }

}