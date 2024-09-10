
import 'package:flutter/material.dart';
import '../../functions/functions.dart';
import '../../models/questions.dart';

class HintsScreen extends StatelessWidget {
  final Question question;
  final String state;
  const HintsScreen({super.key, required this.question, required this.state});

  String getText() => switch (state) {
    'hint1' => question.hints[0],
    'hint2' => question.hints[1],
    _ => question.response
  };
  String getTitle() => switch (state) {
    'hint1' => 'Hint #1',
    'hint2' => 'Hint #2',
    _ => 'Response'
  };
  @override
  Widget build(BuildContext context) {
    String title = getTitle();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(title,style: const TextStyle(fontSize: 30))),
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: getBoxHigh(size),
              ),
              Container(
                  width: getWidth(size),
                  height: getHigh(size),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(question.question,
                            style: const TextStyle(
                                fontSize: 26, color: Colors.black45)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(title,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(getText(),
                            style: const TextStyle(
                                fontSize: 26, color: Colors.white)),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.blue),
                        child: const Icon(Icons.arrow_back, size: 60),
                      )),
                  TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(context,'/root'),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.green),
                        child: const Icon(Icons.home_filled, size: 60),
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}