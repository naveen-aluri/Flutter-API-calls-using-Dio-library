import 'package:dio/dio.dart';
import 'package:dio_library_example/model/Movies.dart';
import 'package:dio_library_example/utils/colors.dart';
import 'package:flutter/material.dart';

class GetMoviesPage extends StatefulWidget {
  @override
  _GetMoviesPageState createState() => _GetMoviesPageState();
}

class _GetMoviesPageState extends State<GetMoviesPage> {
  List<Movie> moviesList = new List();
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;

    getMoviesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies List'),
        backgroundColor: primaryDarkColor,
      ),
      body: Center(
        child: isLoading
            ? new CircularProgressIndicator()
            : new ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: moviesList.length,
                itemBuilder: (context, index) {
                  return buildMoviesUI(moviesList[index]);
                }),
      ),
    );
  }

  getMoviesData() async {
    setState(() {
      isLoading = true;
    });
    Response response;
    Dio dio = new Dio();
    try {
      response = await dio.get("https://api.myjson.com/bins/17mylc");
      print(response.data.toString());
      /*
      Parse JSON data from response to [Movies] by using Movies.fromJson method.
       */
      Movies movies = Movies.fromJson(response.data);
      moviesList = movies.movies;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      return print('Error : $e');
    }
  }

  Widget buildMoviesUI(Movie movie) {
    return new Card(
      child: new ListTile(
        contentPadding: EdgeInsets.all(10),
        title: new Text(movie.title),
        subtitle: new Text(
          movie.storyline,
        overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          maxLines: 4,
        ),
        isThreeLine: true,
        leading: new Image.network(
          movie.posterurl,
          height: 100,
          width: 70,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
