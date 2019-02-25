import 'package:dio_library_example/screens/get_movies_page.dart';
import 'package:dio_library_example/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dio Example'),
        backgroundColor: primaryDarkColor,
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new GetMoviesPage()));
              },
              child: new Text('GET API CALL'),
            )
          ],
        ),
      ),
    );
  }
}
