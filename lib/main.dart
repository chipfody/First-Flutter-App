import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    //or you can make it static const questions
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Rat', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your favorite genre?',
      'answers': [{'text': 'Science Fiction', 'score': 1},
        {'text': 'History', 'score': 5},
        {'text': 'Humor', 'score': 3},
        {'text': 'Romance', 'score': 10}],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
//
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We  have more questions!');
    } else {
      print('No more questions');
    }
  }

  @override //shows we are deliberately overriding the StatelessWidget build with out own build method
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Basic Questions'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions)
              : Result(_totalScore, _resetQuiz)
      ),
    );
  }
}
