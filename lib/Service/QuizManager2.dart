import 'package:trivia/Service/Question.dart';
import 'Option.dart';

class QuizManager2 {
  QuizManager2(){
    _questions.add(
      Question('Which continent is the largest?',
          [
        Option('Asia', 10),
        Option('Africa', 5),
        Option('Europe', 0),
        Option('England', -10),
      ])
    );
    _questions.add(
        Question('Which American state is the largest (by area)?',
            [
              Option('Alaska', 10),
              Option('Ohio', 5),
              Option('New York', 0),
              Option('Canada', -10),
            ])
    );
    _questions.add(
        Question('What is the smallest country in the world?',
            [
              Option('Vatican City', 10),
              Option('Greece', 5),
              Option('Germany', 0),
              Option('Africa', -10),
            ])
    );
    _questions.add(
        Question('What is the name of the world’s longest river?',
            [
              Option('The Nile', 10),
              Option('Mississippi', 5),
              Option('Ganges', 0),

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
