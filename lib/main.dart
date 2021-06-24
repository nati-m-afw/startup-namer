import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled=true;
  // WidgetsApp.showPerformanceOverlayOverride=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'FlutterApp',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        textTheme: TextTheme(
          bodyText2: TextStyle(
              fontSize: 20,
              color: Colors.white70),
        )
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Still runnin....'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(0,30,0,0),
          child: Column(
            children: [
              Row(
                children: [
                  HomePage(),
                  HomePage(),
              ]
              ),
              Row(
                  children: [
                    HomePage(),
                    HomePage(),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
}

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }

}

class _CounterState extends State<HomePage>{
  int _counter = 0;

  void _increment() {
    setState(() {
      this._counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('$_counter'),
          ElevatedButton(onPressed: _increment, child: Icon(Icons.add))
        ],
      ),
    );
  }
  
}