import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/models/models.dart';
import 'package:spotify_clone/provider/current_song_provider.dart';
import 'package:spotify_clone/screens/screens.dart';
import 'package:spotify_clone/widgets/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS) && (Platform.isLinux) && (Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  }
  runApp(ChangeNotifierProvider(
    create: (context) => CurrentSongModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Spotify UI',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
            scaffoldBackgroundColor: const Color(0xFF121212),
            backgroundColor: const Color(0xFF121212),
            primaryColor: Colors.black,
            accentColor: const Color(0xFF1DB954),
            iconTheme: const IconThemeData().copyWith(color: Colors.white),
            fontFamily: 'Montserrat',
            textTheme: TextTheme(
                headline2: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold),
                headline4: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                ),
                bodyText1: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
                bodyText2:
                    TextStyle(color: Colors.grey[300], letterSpacing: 1.0))),
        home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if(MediaQuery.of(context).size.width > 800) SideMenu(),
                Expanded(
                  child: PlayListScreen(
                    playlist: lofihiphopPlaylist,
                  ),
                ),
              ],
            ),
          ),
          CurrentTrack(),
        ],
      ),
    );
  }
}
