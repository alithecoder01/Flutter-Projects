import 'package:flutter/material.dart';
import 'qLists.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CheckAnswer extends QList {
  List<Widget> answerResult = [];
  QList qList = QList();
  int countCorrect = 0;

  void checkAnswers(bool userInput, BuildContext context) {
    
    bool correctAnswer = qList.getQcorrectA();
    if (correctAnswer == userInput) {
      answerResult.add(
        const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.greenAccent,
          ),
        ),
      );
      countCorrect += 1;
    } else {
      answerResult.add(const Padding(
        padding: EdgeInsets.all(3.0),
        child: Icon(
          Icons.thumb_down,
          color: Colors.red,
        ),
      ));
    }

    if (qList.isFinished()) {
      Alert(
        context: context,
        //type: AlertType.error,
        title: "End of Questions",
        desc: "Score is $countCorrect /7",
        buttons: [
          DialogButton(
            color: Colors.grey,
            onPressed: () => Navigator.pop(context),
            width: 120,
            child: const Text(
              "Try Again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
      qList.finished();
      answerResult = [];
      countCorrect = 0;
    } else {
      qList.nextQ();
    }
  }

  @override
  String getQimg() {
    return qList.getQimg();
  }

  @override
  String getQText() {
    return qList.getQText();
  }
}
