import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_streaming_app/main.dart';
import 'package:music_streaming_app/screens/login_screen.dart';
import 'package:music_streaming_app/screens/music_screen.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Miziki',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.black87,
        fontFamily: GoogleFonts.quicksand().fontFamily,
      ),
      home: const LoginScreen(),
    );
  }
}

