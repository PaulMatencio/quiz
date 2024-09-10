


import 'package:flutter/material.dart';

import '../../models/questions.dart';
import '../hints/hintsScreen.dart';
import '../response/ResponseScreen.dart';

class ListItemHorizontal extends StatefulWidget {
  final List<Question>questions;
  const ListItemHorizontal({super.key,required this.questions });
  @override
  State<ListItemHorizontal> createState() => _ListItemHorizontalState();
}

class _ListItemHorizontalState extends State<ListItemHorizontal> {

  bool _isSelected = false;

  String state = '';
  setIndex() {
    setState(() {
      state = nextState(state);
    });
  }

  String nextState(state) =>
      switch (state) {
        'hint1' => 'hint2',
      //  'hint2' => 'question',
        _ => 'hint1'
      };
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.questions.length,
      itemBuilder: (context, index) {
        Question question = widget.questions[index];
        return Card(
          child: Container(
              color: Colors.blue,
              height: 100,
              width: 600,
              child: Row(

                children: [
                Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    question.question,
                    style: const TextStyle(
                        fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            TextButton(
                onPressed: () {
                  setIndex();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HintsScreen(
                                  question: question,
                                  state: state)));
                },
                child: const Icon(
                    Icons.help,
                    size: 30,
                    color: Colors.white
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ResponseScreen(
                                  question: question)));
                },
                child: const Icon(
                    Icons.get_app,
                    size: 30,
                    color: Colors.white
                )),
                ],
              )
          ),
        );
      },
    );;
  }
}

