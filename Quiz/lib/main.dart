import 'package:flutter/material.dart';
import 'examPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('Questions App '),
          backgroundColor: Colors.grey,
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: ExamPage(),
        ) ,
      ),
    );
  }
}

