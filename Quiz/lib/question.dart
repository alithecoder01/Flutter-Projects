

class Question{
  var questionsText;
  var imgQ;
  var questionAnswer;

  Question({required String text, required String img, required bool qAnswer}){
    this.questionsText= text;
    this.imgQ= img;
    this.questionAnswer= qAnswer;
  }

}