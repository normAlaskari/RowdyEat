import './questions.dart';
import './answer.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatefulWidget {
  @override
      State <StatefulWidget>createState(){
        return _AppWidgetState();
      }
}
class _AppWidgetState extends State{
 var _index =0;
 void _answered() {
   setState(() {
     _index = _index+1;
     if(_index > 2){
        _index = 0;
     }
   });
   print(_index);
 }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questions': ' What type of Meat you feel like eating ?', 'answers':
        ['Chicken', 'Beef', 'Pork' , 'Vegan']
      },

      {
        'questions': ' Do you feel like driving ?', 'answers':
      ['Yes', 'No']
      },
      {
        'questions': ' Do you feel like wating Healthy ?', 'answers':
      ['Yes', 'No']
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rowdy Eat'),
          backgroundColor: (Colors.deepOrange),
        ),
        body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images.png"),
                fit: BoxFit.cover,
              ),
            ),
              constraints: new BoxConstraints.expand(height: 200),
              ),
           Question(
               questions[_index]['questions'],
           ),
            ...(questions[_index]['answers'] as List<String>).map((answers) {
              return Answer(_answered, answers);
            }).toList(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('Map to most Harted'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Fav foodies'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepOrange,
          onTap: _onItemTapped,
        ) ,
      ),
    );
  }
}

