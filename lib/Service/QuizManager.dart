import 'package:trivia/Service/Question.dart';
import 'Option.dart';

class QuizManager {
  QuizManager(){
    _questions.add(
      Question('Who discovered penicillin?',
          [
        Option('Alexander Fleming', 10),
        Option('Louis Pasteur', 5),
        Option('Marie Curie', 0),
        Option('Newton', -10),
      ])
    );
    _questions.add(
        Question('Which planet has the most gravity?',
            [
              Option('Jupiter', 10),
              Option('Mars', 5),
              Option('Sun', 0),
              Option('Moon', -10),
            ])
    );
    _questions.add(
        Question('How many molecules of oxygen does ozone have?',
            [
              Option('3', 10),
              Option('5', 5),
              Option('4', 0),
              Option('0', -10),
            ])
    );
    _questions.add(
        Question('Which planet is the hottest in the solar system?',
            [
              Option('Venus', 10),
              Option('Mars', 5),
              Option('Pluto', 0),

            ])
    );



    for (var question in _questions){
      question.options.shuffle();
    }

  }


  List<Question> _questions=[];
  int _score=0;
  int currentQuestionId=0;
  void nextQuestion(score){
    if(currentQuestionId < _questions.length){
      _score += score;
      currentQuestionId++ ;
    }
    print(currentQuestionId);
  }

  int getTotalScore() => _score;
  int getCurrentId() => currentQuestionId +1;
  int totalQuestionNumber() => _questions.length;
  bool isFinished(){
    return currentQuestionId >= _questions.length;
}
  Question getCurrentQuestion(){
    if(currentQuestionId < _questions.length){
    return _questions[currentQuestionId];
    }
    else{
      return Question('', []);
    }
  }

  }
