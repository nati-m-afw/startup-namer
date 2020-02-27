import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Welcome my peeps',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to flutter my peeps'),
        ),
        body: Center(
          child: Text('this is awsome'),
        ),
      ),
    );
  }
}