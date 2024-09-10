import 'package:flutter/material.dart';
import 'package:taskf9/models/questions.dart';

import '../../functions/functions.dart';


class ResponseScreen extends StatelessWidget {
  final Question question;
  const ResponseScreen({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    String title = 'Response screen';

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(title,style: const TextStyle(fontSize: 30))),
          backgroundColor: Colors.amber,
        ),
        body: ScreenResponseBody(question: question));
  }
}

class ScreenResponseBody extends StatelessWidget {
  const ScreenResponseBody({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                    const Text('Response',
                        style: TextStyle(color: Colors.red, fontSize: 20)),
                    Text(question.getResponse(),
                        style:
                        const TextStyle(fontSize: 26, color: Colors.white)),
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
                    onPressed:() => Navigator.pushReplacementNamed(context, '/root'),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.green),
                      child: const Icon(Icons.home_filled, size: 60),
                    )),
              ],
            ),
          ],
        ),
      );
    });
  }
}
