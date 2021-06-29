import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.deepOrangeAccent, // transparent status bar
  ));
  // WidgetsApp.showPerformanceOverlayOverride=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlutterApp',
        theme: ThemeData(
            primaryColor: Colors.deepOrangeAccent,
            textTheme: TextTheme(
              bodyText2: TextStyle(fontSize: 20, color: Colors.white70),
            )),
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text('Still runnin....'),
          ),
          body: Column(
            // alignment: Alignment.center,
            // padding: EdgeInsets.fromLTRB(0,30,0,0),
            mainAxisAlignment: MainAxisAlignment.center, // Align vertically
            children:  [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Align horizontally
                    // padding: EdgeInsets.all(10.0),
                    children: [
                        HomePage(),
                        SizedBox(height: 40, width: 40),
                        HomePage(),
                    ]
                ),
                SizedBox(height: 40, width: 40,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Align horizontally
                    children: [
                        HomePage(),
                        SizedBox(height: 40, width: 40,),
                        HomePage(),
                    ]
                ),
              ],
            ),
          ),
        );
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<HomePage> {
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
