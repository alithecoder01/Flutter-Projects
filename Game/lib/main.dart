import 'package:flutter/material.dart';
import 'package:game/ImagePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      // to hide the debug on the top of the application, that will be better.
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("Same Pic Win !"),
          backgroundColor: Colors.white38,
        ),
        body: const ImagePage() ,
      ),
    );
  }
}

