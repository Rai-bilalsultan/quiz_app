import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> _questions = [
    {'question': 'Flutter is developed by Google.', 'answer': true},
    {'question': 'Dart is the programming language used in Flutter.', 'answer': true},
    {'question': 'Flutter can only be used for mobile applications.', 'answer': false},
  ];
  int _currentQuestionIndex = 0;

  void _answerQuestion(bool userAnswer) {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Quiz Completed!'),
          content: Text('You have answered all the questions.'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _currentQuestionIndex = 0;
                });
                Navigator.of(ctx).pop();
              },
              child: Text('Restart'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Quiz')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _questions[_currentQuestionIndex]['question'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _answerQuestion(true),
                child: Text('True', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _answerQuestion(false),
                child: Text('False', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
