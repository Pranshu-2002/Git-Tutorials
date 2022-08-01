import 'package:flutter/material.dart';
import './questions.dart';
import './answers.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favourite color?',
        'answers': ['Purple', 'Red', 'Pink', 'Black']
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': ['Tortoise', 'Dog', 'Tiger', 'Cat']
      },
      {
        'questionText': 'Who\'s your favourite faculty?',
        'answers': ['SKG Sir', 'GS Sir', 'Alakh Sir', 'Jayesh Sir']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: Column(children: [
          Question(
            questions[_questionIndex]['questionText'] as String,
          ),
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ]),
      ),
    );
  }
}
