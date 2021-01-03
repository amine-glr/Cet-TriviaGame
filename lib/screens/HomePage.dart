import 'package:flutter/material.dart';
import 'package:trivia/screens/QuizPage.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int category;
  String difficulty;
  int number;
  void gotoQuizPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => QuizPage(
              number: number,
              difficulty: difficulty,
              category: category)),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.blueGrey,

                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child:Center (
                          child:Text(
                            'Welcome to Trivia Game',
                            style: TextStyle(
                              fontSize:30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      Text("Select Category",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          runSpacing: 16.0,
                          spacing: 16.0,
                          children: <Widget>[
                            SizedBox(width: 0.0),
                            ActionChip(
                              label: Text("Science",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                              labelStyle: TextStyle(color: Colors.white),
                              onPressed: (){
                                _selectCategory(18);
                              },
                              backgroundColor: category == 18 ? Colors.indigo : Colors.grey.shade600,

                            ),
                            ActionChip(
                              label: Text("Music",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                              labelStyle: TextStyle(color: Colors.white),
                              onPressed: (){
                                _selectCategory(12);
                              },
                              backgroundColor: category == 12 ? Colors.indigo : Colors.grey.shade600,

                            ),
                            ActionChip(
                              label: Text("Cinema",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                              labelStyle: TextStyle(color: Colors.white),
                              onPressed: () {
                                _selectCategory(13);
                              },
                              backgroundColor: category == 13 ? Colors.indigo : Colors.grey.shade600,

                            ),
                          ],
                        ),
                      ),

                      Text("Select Number of Questions",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          runSpacing: 16.0,
                          spacing: 16.0,
                          children: <Widget>[
                            SizedBox(width: 0.0),
                            ActionChip(
                              label: Text("5",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                              labelStyle: TextStyle(color: Colors.white),
                              onPressed: (){
                                _selectNumberOfQuestions(5);
                              },
                              backgroundColor: number == 5 ? Colors.indigo : Colors.grey.shade600,

                            ),
                            ActionChip(
                              label: Text("10",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                              labelStyle: TextStyle(color: Colors.white),
                              onPressed: (){
                                _selectNumberOfQuestions(10);
                              },
                              backgroundColor: number == 10 ? Colors.indigo : Colors.grey.shade600,

                            ),
                            ActionChip(
                              label: Text("15",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                              labelStyle: TextStyle(color: Colors.white),
                              onPressed: () {
                                _selectNumberOfQuestions(15);
                              },
                              backgroundColor: number == 15 ? Colors.indigo : Colors.grey.shade600,

                            ),
                          ],
                        ),
                      ),

                      Text("Select Difficulty",

                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          runSpacing: 16.0,
                          spacing: 16.0,
                          children: <Widget>[
                            SizedBox(width: 0.0),

                            ActionChip(
                              label: Text("Easy",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                              labelStyle: TextStyle(color: Colors.white),
                                onPressed: () {
                                  _selectDifficulty('easy');
                                },
                              backgroundColor: difficulty == 'easy' ? Colors.indigo : Colors.grey.shade600,

                            ),
                            ActionChip(
                              label: Text("Medium",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                              labelStyle: TextStyle(color: Colors.white),
                              onPressed: (){
                                _selectDifficulty('medium');
                              },
                              backgroundColor: difficulty == "medium" ? Colors.indigo : Colors.grey.shade600,

                            ),
                            ActionChip(
                              label: Text("Hard",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                              labelStyle: TextStyle(color: Colors.white),
                              onPressed: (){
                                _selectDifficulty('hard');
                              },
                              backgroundColor: difficulty == "hard" ? Colors.indigo : Colors.grey.shade600,

                            ),

                          ],
                        ),
                      ),

                      RaisedButton(
                        onPressed: () {
                          gotoQuizPage(context);
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF1976D2),
                                Color(0xFF42A5F5),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child:
                          const Text('     Start     ', style: TextStyle(fontSize: 25)),
                        ),
                      ),
                    ]
                ),


      ),
    );
  }
  _selectNumberOfQuestions(int i) {
    setState(() {
      number = i;
    });
  }

  _selectDifficulty(String s) {
    setState(() {
      difficulty=s;
    });
  }
  _selectCategory(int c){
    setState(() {
      category= c;
    });
  }

}