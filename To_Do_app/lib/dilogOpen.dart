import 'package:flutter/material.dart';
import 'package:to_to_app/Buttons.dart';

class MyDilog extends StatelessWidget {
  MyDilog(
      {Key? key,
      required this.myController,
      required this.onSaved,
      required this.onCanceled})
      : super(key: key);

  final myController;
  VoidCallback onSaved;
  VoidCallback onCanceled;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add New Task"),
      content: TextField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: "Enter the task Name"),
        controller: myController,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // need to give the buttons a function !!

            MyButton(Name: "Add", theProcess: onSaved),
            MyButton(Name: "Cancel", theProcess: onCanceled),
          ],
        )
      ],
    );
  }
}
