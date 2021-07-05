import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'movies..dart';

void main() {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.deepOrangeAccent, // transparent status
  ));
  // WidgetsApp.showPerformanceOverlayOverride=true;
  Movies();
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
          body: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: List.generate(20, (index) {
              return HomePage(index: index);
            }),
          ),
        ),
  );
}

class HomePage extends StatefulWidget {
  int index;

  HomePage({required this.index});

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
          Text('Build Number: ${widget.index}'),
          Text('$_counter'),
          ElevatedButton(onPressed: _increment, child: Icon(Icons.add))
        ],
      ),
    );
  }
}
