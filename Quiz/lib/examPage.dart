import 'package:flutter/material.dart';
import 'checkAnswers.dart';
import 'qLists.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {

  QList qList = QList();
  CheckAnswer chk = CheckAnswer();

  void checkAnswer(bool userInput){
    setState((){
      chk.checkAnswers(userInput,context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: chk.answerResult,
        ),
        Expanded(
          flex: 4,
          child:  Column(
            children: [
              Image.asset(chk.getQimg()),
              const SizedBox(
                height: 15,
              ),
              Text(chk.getQText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child:
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[800],
                onPrimary: Colors.white,
                // onPrimary is the text color, primary is the button color
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text("True",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
                // onPrimary is the text color, primary is the button color
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text("False",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),),
            ),
          ),
        ),
      ],);
  }
}
