import 'question.dart';


class QList{
  int _qNumber =0;

  void nextQ(){
    if (_qNumber< _questionGroup.length -1){
      _qNumber+=1;
    }
  }


  final List<Question> _questionGroup = [
    Question(text: 'The number of them are 7', img: 'assets/image-1.jpg', qAnswer: false),
    Question(text: 'Is that a cat ?', img: 'assets/image-2.jpg', qAnswer: true),
    Question(text: 'Is this country china ?', img: 'assets/image-3.jpg', qAnswer: true),
    Question(text: 'The earth is flat', img: 'assets/image-4.jpg', qAnswer: false),
    Question(text: 'Nice food ?', img: 'assets/image-5.jpg', qAnswer: true),
    Question(text: 'Sun is bigger than earth', img: 'assets/image-6.jpg', qAnswer: true),
    Question(text: 'Is that a chicken? ', img: 'assets/image-7.jpg', qAnswer: true),
  ];


  String getQText(){
    return _questionGroup[_qNumber].questionsText;
  }
  String getQimg(){
    return _questionGroup[_qNumber].imgQ;
  }

  bool getQcorrectA(){
    return _questionGroup[_qNumber].questionAnswer;
  }

  bool isFinished(){
    if(_qNumber>=_questionGroup.length-1){
      return true;
    }else{
      return false;
    }
  }

  void finished(){
    _qNumber=0;
  }

}