import 'package:flutter/material.dart';
import 'package:taskf9/presentation/rootBottomNavigationBar.dart';
import 'models/questions.dart';


class MyHomePage extends StatelessWidget {
  final List<Question> questions;
  final bool isLargeDevice;
  const MyHomePage({super.key,required this.questions,required this.isLargeDevice});
  @override
  Widget build(BuildContext context) {
    //  home: RootBottomNavigatorBar
    return RootBottomNavigationBar(questions:questions);
  }
}
