import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  // debugPaintSizeEnabled = true;
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
          body: ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => Divider(height: 70, thickness: 10, color: Colors.deepOrangeAccent,),
            itemBuilder: (context, index) {
              return HomePage(index: index,);
            },
          )
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround, // Align vertically
          //   children:  [
          //       Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround, // Align horizontally
          //           children: [
          //               HomePage(),
          //               HomePage(),
          //           ]
          //       ),
          //       Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround, // Align horizontally
          //           children: [
          //               HomePage(),
          //               HomePage(),
          //           ]
          //       ),
          //     ],
          //   ),
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
