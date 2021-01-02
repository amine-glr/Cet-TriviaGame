import 'package:flutter/material.dart';
import 'package:trivia/screens/QuizPage.dart';
import 'package:select_form_field/select_form_field.dart';



class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String dropdownValue = ' ';
  String dropdownValue2 = ' ';
  String dropdownValue3 = ' ';
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
  final List<Map<String, dynamic>> _categories = [
    {
      'value': 'Science',
      'label': 'Science',
      'category' : '18',
    },
    {
      'value': 'Movies',
      'label': 'Movies',
      'category' : '12',
      'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'Music',
      'label': 'Music',
      'category' : '11',
    },
  ];
  final List<Map<String, dynamic>> _numberOfQuestions = [
    {
      'value': '5',
      'label': '5',
    },
    {
      'value': '10',
      'label': '10',

    },
    {
      'value': '15',
      'label': '15',
    },
  ];
  final List<Map<String, dynamic>> _level = [
    {
      'value': 'Easy',
      'label': 'Easy',
    },
    {
      'value': 'Medium',
      'label': 'Medium',

    },
    {
      'value': 'Hard',
      'label': 'Hard',
    },
  ];


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

          Container(
            child: SelectFormField(
                 type: SelectFormFieldType.dropdown, // or can be dialog
                 initialValue: ' ',
                  labelText: 'Category',
                 items: _categories,
                 onChanged: (val) => print(val),
                 onSaved: (val) {
                   setState(() => dropdownValue = val);
                      if(dropdownValue=='Music'){

                            category=12;
                      }
                      else if(dropdownValue=='Science'){

                          category= 18;
                      }
                      else if(dropdownValue=='Movies')

                        category=13;
                 },

            ),
          ),
          Container(
            child: SelectFormField(
              type: SelectFormFieldType.dropdown, // or can be dialog
              initialValue: ' ',
              labelText: 'Number Of Questions',
              items: _numberOfQuestions,
              onChanged: (val) => print(val),
              onSaved: (val) {
                setState(() => dropdownValue2 = val);
                if(dropdownValue2=='5'){
                   number=5;
                }
                else if(dropdownValue2=='10'){

                  number= 10;
                }
                else if(dropdownValue2=='15')

                  number=15;
              },

            ),
          ),
          Container(
            child: SelectFormField(

              type: SelectFormFieldType.dropdown, // or can be dialog
              initialValue: ' ',
              labelText: 'Level',
              items: _level,
              onChanged: (val) => print(val),
              onSaved: (val) {
                setState(() => dropdownValue3 = val);
                if(dropdownValue3=='Easy'){

                    difficulty='easy';
                }
                else if(dropdownValue3=='Medium'){

                  difficulty='medium';
                }
                else if(dropdownValue3=='Hard')

                  difficulty='hard';
              },
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
              const Text('     Start     ', style: TextStyle(fontSize: 25)),
            ),
          ),
        ]
    ),
      ),
    );
  }
}