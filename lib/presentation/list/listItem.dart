
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskf9/models/questions.dart';

import '../hints/hintsScreen.dart';
import '../response/responseScreen.dart';

class ListItem extends StatefulWidget {
  final Question question;
  final bool isLargeScreen;
  const ListItem({super.key, required this.question,required this.isLargeScreen});

  @override
  State<ListItem> createState() =>
      _ListItemState();
}

class _ListItemState extends State<ListItem> {
  // bool _isSelected = false;
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
      return Card(
        child: Container(
          height: 140,
          decoration: BoxDecoration(
              color: Colors.blueAccent, borderRadius: BorderRadius.circular(5)),
          child: ListTile(
            dense: true,
            // title: Padding(padding: const EdgeInsets.all(16.0), child: question),
            title: Center(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        widget.question.question,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.white),
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
                                          question: widget.question,
                                          state: state)));
                        },
                        child: const Icon(
                            Icons.help,
                            size: 26,
                            color: Colors.white
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResponseScreen(
                                          question: widget.question)));
                        },
                        child: const Icon(
                            Icons.get_app,
                            size: 26,
                            color: Colors.white
                        )),
                  ],
                )),
            ),
          ),
      );
    }
  }
