
import 'package:flutter/material.dart';
import 'package:taskf9/functions/functions.dart';
import 'package:taskf9/presentation/list/listItemHorizontal.dart';
import '../../models/questions.dart';
import 'listItem.dart';

class ListQuestionsScreen extends StatelessWidget {
  final List<Question> questions;
  final bool isLargeDevice;
  const ListQuestionsScreen({super.key, required this.questions,required this.isLargeDevice});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isHorizontal = isLargeScreen(size.width);

    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('Questions', style: TextStyle(fontSize: 26))),
          backgroundColor: Colors.amber,
        ),
        body: BuildListView(
            questions: questions,
            isLargeScreen: isHorizontal,
            isLargeDevice: isLargeDevice
        ));
  }
}

class BuildListView extends StatelessWidget {
  const BuildListView(
      {super.key, required this.questions,
        required this.isLargeScreen,
        required this.isLargeDevice});

  final List<Question> questions;
  final bool isLargeScreen;
  final bool isLargeDevice;

  @override
  Widget build(BuildContext context) {
    if (!isLargeScreen  || isLargeDevice) {
      return Flex(
        direction: Axis.vertical,
        children: [
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
              shrinkWrap: true,
              itemCount: questions.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemBuilder: (context, index) {
                Question question = questions[index];
                return ListItem(
                  question: question,
                  isLargeScreen: isLargeScreen,
                  //index: index,
                );
              }),
        ],
      );
    }
    else {
      return ListItemHorizontal(questions: questions);
    }
  }
}