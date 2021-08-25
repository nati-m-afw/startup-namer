import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'movies..dart';

Future main() async{
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.deepOrangeAccent.withOpacity(1), // transparent status
  ));
  // WidgetsApp.showPerformanceOverlayOverride=true;
  await dotenv.load(fileName: ".env");
  runApp(MyApp(movies: Movies().getTrending()));
}

class MyApp extends StatelessWidget {
  final Future<List<Movie>>? movies;

  MyApp({Key? key, this.movies}) : super(key: key);

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
          body: FutureBuilder<List<Movie>> (
            future: movies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 30,
                    staggeredTileBuilder: (index) {
                      return StaggeredTile.count(1, 2);
                    },
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return MovieWidget(movie: snapshot.data![index]);
                    },
                );
              }
              return CircularProgressIndicator();
            }
          )
        ),
  );
}

class MovieWidget extends StatelessWidget {
  final Movie movie;

  MovieWidget({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.network(movie.posterPath!),
          Text(movie.title!),
        ],
      ),
    );
  }
}
