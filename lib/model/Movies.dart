// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

import 'dart:convert';

Movies moviesFromJson(String str) {
  final jsonData = json.decode(str);
  return Movies.fromJson(jsonData);
}

String moviesToJson(Movies data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Movies {
  List<Movie> movies;

  Movies({
    this.movies,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => new Movies(
        movies:
            new List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "movies": new List<dynamic>.from(movies.map((x) => x.toJson())),
      };
}

class Movie {
  String id;
  String title;
  String year;
  List<String> genres;
  List<int> ratings;
  String poster;
  String contentRating;
  String duration;
  String releaseDate;
  int averageRating;
  OriginalTitle originalTitle;
  String storyline;
  List<String> actors;
  dynamic imdbRating;
  String posterurl;

  Movie({
    this.id,
    this.title,
    this.year,
    this.genres,
    this.ratings,
    this.poster,
    this.contentRating,
    this.duration,
    this.releaseDate,
    this.averageRating,
    this.originalTitle,
    this.storyline,
    this.actors,
    this.imdbRating,
    this.posterurl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => new Movie(
        id: json["id"],
        title: json["title"],
        year: json["year"],
        genres: new List<String>.from(json["genres"].map((x) => x)),
        ratings: new List<int>.from(json["ratings"].map((x) => x)),
        poster: json["poster"],
        contentRating: json["contentRating"],
        duration: json["duration"],
        releaseDate: json["releaseDate"],
        averageRating: json["averageRating"],
        originalTitle: originalTitleValues.map[json["originalTitle"]],
        storyline: json["storyline"],
        actors: new List<String>.from(json["actors"].map((x) => x)),
        imdbRating: json["imdbRating"],
        posterurl: json["posterurl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "year": year,
        "genres": new List<dynamic>.from(genres.map((x) => x)),
        "ratings": new List<dynamic>.from(ratings.map((x) => x)),
        "poster": poster,
        "contentRating": contentRating,
        "duration": duration,
        "releaseDate": releaseDate,
        "averageRating": averageRating,
        "originalTitle": originalTitleValues.reverse[originalTitle],
        "storyline": storyline,
        "actors": new List<dynamic>.from(actors.map((x) => x)),
        "imdbRating": imdbRating,
        "posterurl": posterurl,
      };
}

enum OriginalTitle {
  EMPTY,
  ANNIHILATION,
  A_WRINKLE_IN_TIME,
  THE_LEISURE_SEEKER,
  CE_QUI_NOUS_LIE
}

final originalTitleValues = new EnumValues({
  "Annihilation": OriginalTitle.ANNIHILATION,
  "A Wrinkle in Time": OriginalTitle.A_WRINKLE_IN_TIME,
  "Ce qui nous lie": OriginalTitle.CE_QUI_NOUS_LIE,
  "": OriginalTitle.EMPTY,
  "The Leisure Seeker": OriginalTitle.THE_LEISURE_SEEKER
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
