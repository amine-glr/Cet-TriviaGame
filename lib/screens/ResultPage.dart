import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  int score;
  ResultPage({Key key, this.score}): super (key: key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
   if(widget.score>25) {
     return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Column(

        children: [

          Expanded(
            flex: 4,
            child:Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                shape: BoxShape.circle ,
                image: DecorationImage(
                  image: AssetImage('assets/success.jpg'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Congratulations!',
                        style: TextStyle(
                            fontSize: 30),
                      ),

                Text(
                    'Your Score: ${widget.score}',
                        style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,)
                    ),
              ],
            ),
          ),
        ],
      ),


    );
   }
   else {
     return Scaffold(
       backgroundColor: Colors.blueAccent,
       appBar: AppBar(
         title: Text('Results'),
       ),

         body: Column(

           children: [

             Expanded(
               flex: 4,
               child:Container(
                 padding: EdgeInsets.symmetric(horizontal: 50),
                 decoration: BoxDecoration(
                   shape: BoxShape.circle ,
                   image: DecorationImage(
                     image: AssetImage('assets/fail.jpg'),
                   ),
                 ),
               ),
             ),
             Expanded(
               flex: 5,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text('Try Again Later!',
                     style:
                     TextStyle(
                         fontSize: 30),
                   ),
                   Text(
                       'Your Score: ${widget.score}',
                       style:
                       TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.w900,
                       )),
                 ],
               ),
             ),
           ],
         ),


     );
   }
  }
}
