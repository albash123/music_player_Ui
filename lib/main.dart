import 'package:flutter/material.dart';
import 'package:music_player/others/my_home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Reading',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.cyan
      ),
      home: const MyHomePage(),
    );
  }
}
