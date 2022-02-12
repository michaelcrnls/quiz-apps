import 'package:flutter/material.dart';

void main() {
  runApp(const QuizzApp());
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  _QuizzAppState createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("the avava bites industry was founded in 2020", true),
    Question.name("the avava bites industry was located in lagos", true),
    Question.name("Avava bites CEO is from Nsukka", true),
    Question.name(
        "the company has 30 trillion deposit in the reserve bank", false),
    Question.name("the new manager is also a millionare", true),
    Question.name("the headquarter is in akwa ibom", false),
    Question.name("honesty and satisfaction is there watchword", true),
    Question.name("the company is believed to have 25 mentors ", true),
    Question.name(
        "the group of industris are benefiting from the company", false),
    Question.name("there staff is always the best", true),
    Question.name("the industry does not have a male staff", true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Center(
              child: Image.asset(
                "images/without.png",
                height: 300,
                width: 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(18.0),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid)),
                height: 200,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        style: TextStyle(fontSize: 22.0, color: Colors.white)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _prevQuestion(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade800,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(true, context),
                  child: Text("TRUE"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade800,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(false, context),
                  child: Text("FALSE"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade800,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _nextQuestion(),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade800,
                  ),
                )
              ],
            ),
            Spacer()
          ])),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      //it is correct
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Correct"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      _updateQuestion();
      debugPrint("yes correct");
    } else {
      debugPrint("inCorrect");
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text("inCorrect"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
      //this will help the list iterate to the last element and start from 0 again
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
      debugPrint("index: $_currentQuestionIndex");
      //this will help the list iterate to the previous element and start again
    });
  }
}


class Question {  //this class can be created in another file //
  late String questionText;
  bool isCorrect;

  Question.name(this.questionText, this.isCorrect);
}
