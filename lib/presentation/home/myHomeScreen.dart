import 'package:flutter/material.dart';

class MyHomeScreen extends StatelessWidget {
  final bool isLargeDevice;
  const MyHomeScreen({super.key, required this.isLargeDevice});

  @override
  Widget build(BuildContext context) {
    const String pictureUrl = "https://i.postimg.cc/FsYpJYTr/quizTime.jpg";

    return Scaffold(
        appBar: AppBar(
          title:
              const Center(child: Text('Quiz', style: TextStyle(fontSize: 30))),
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                    width: 300,
                    height: 600,
                    child: buildQuizContainer(pictureUrl)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Are you ready?', style: TextStyle(fontSize: 20)),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Press the', style: TextStyle(fontSize: 20)),
                    Icon(
                      Icons.question_answer,
                      size: 26,
                    ),
                    Text(' to start', style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Use the ', style: TextStyle(fontSize: 20)),
                    Icon(
                      Icons.help,
                      size: 26,
                    ),
                    Text(' to get some hints', style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Use the ', style: TextStyle(fontSize: 20)),
                    Icon(
                      Icons.get_app,
                      size: 26,
                    ),
                    Text(' to get the response', style: TextStyle(fontSize: 20))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Container buildQuizContainer(String pictureUrl) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            image: DecorationImage(
                image: NetworkImage(pictureUrl), fit: BoxFit.cover)));
  }

  double getWidth() => isLargeDevice ? 600 : 300;
  double getHeight() => isLargeDevice ? 1000 : 500;
}
