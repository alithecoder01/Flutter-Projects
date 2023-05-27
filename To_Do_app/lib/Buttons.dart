import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String Name;
  VoidCallback theProcess;

  MyButton({Key? key, required this.Name, required this.theProcess})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: theProcess,
        child: Text(Name),
      ),
    );
  }
}
