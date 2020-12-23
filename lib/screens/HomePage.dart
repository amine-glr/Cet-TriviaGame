import 'package:flutter/material.dart';
import 'package:trivia/screens/QuizPage.dart';
import 'package:trivia/screens/QuizPage2.dart';


void gotoQuizPage(BuildContext context){
  Navigator.of(context).push(
    MaterialPageRoute(
        builder: (context) => QuizPage()
    ),
  );
}
void gotoQuizPage2(BuildContext context){
  Navigator.of(context).push(
    MaterialPageRoute(
        builder: (context) => QuizPage2()
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/trivia.JPG'),
            fit: BoxFit.cover,
          ),
        ),
       child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal:75),
            child:Center (
              child:Text(
            'Welcome to Trivia Game',
            style: TextStyle(
              fontSize:30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ),
          ),


          const SizedBox(height: 50),
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
              const Text('   Start-> Science Test   ', style: TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(height: 50),
          RaisedButton(
            onPressed: () {
              gotoQuizPage2(context);
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
              const Text('Start-> Geography Test', style: TextStyle(fontSize: 20)),
            ),
          ),
    ]
    ),
      ),
    );
  }
}