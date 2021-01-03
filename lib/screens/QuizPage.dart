import 'package:flutter/material.dart';
import 'package:trivia/Service/Question.dart';
import 'package:trivia/Service/QuizManager.dart';
import 'package:trivia/screens/ResultPage.dart';
import 'package:html_unescape/html_unescape.dart';


var unescape = HtmlUnescape();

class QuizPage extends StatefulWidget {
  int category;
  String difficulty;
  int number;
  QuizPage({Key key, this.number,  this.category, this.difficulty})
      : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizManager _manager=QuizManager();
  Future<void> quizLoader;
  List<Widget> getOptions(Question question){
    List<Widget> optionButtons=[];
    for(int i=0; i<question.options.length; i++) {
      optionButtons.add(
        FlatButton(
          onPressed: () {
            _manager.nextQuestion(_manager
                .getCurrentQuestion()
                .options[i].score);
            if (_manager.isFinished()) {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          ResultPage(score: _manager.getTotalScore(),
                          )));
            }
            setState(() {

            });
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${_manager
                  .getCurrentQuestion()
                  .options[i].text}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      );

    }
    return optionButtons;
  }
  @override
  void initState(){
    super.initState();
    quizLoader = _manager.loadQuestions(widget.number,widget.category,widget.difficulty);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Questions ${_manager.getCurrentId()}/${widget.number}'),

      ),
      body: FutureBuilder<void>(
          future: quizLoader,
          builder: (BuildContext context, AsyncSnapshot<void> snapshot){
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Expanded(
                          flex:2,
                          child: Container(
                            height: 30,
                            padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                            child: Text(
                              '${unescape.convert(_manager.getCurrentQuestion(). text)}',
                              style: TextStyle(
                                fontSize:20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex:4,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: getOptions(_manager.getCurrentQuestion())
                            ),

                          ),
                        ),
                      ],
                    ),
                );
              }
             else {
                return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}
