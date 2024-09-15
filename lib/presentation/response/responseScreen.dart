import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskf9/models/questions.dart';

import '../../application/showResponse.dart';
import '../../functions/functions.dart';

class ResponseScreen extends StatelessWidget {
  final Question question;
  const ResponseScreen({super.key, required this.question});
  @override
  Widget build(BuildContext context) {
    String title = 'Response screen';
    return Scaffold(
        appBar: AppBar(
          title:
              Center(child: Text(title, style: const TextStyle(fontSize: 30))),
          backgroundColor: Colors.amber,
        ),
        body: ChangeNotifierProvider(
            create: (context) => ShowResponse(),
            child: ScreenResponseBody(question: question)));
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
                  color: Colors.amber, borderRadius: BorderRadius.circular(16)),
              child: ResponseWidget(question: question),
            ),
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
                      child: const Icon(Icons.arrow_back, size: 36),
                    )),
                TextButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/root'),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.green),
                      child: const Icon(Icons.home_filled, size: 36),
                    )),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class ResponseWidget extends StatefulWidget {
  final Question question;
  const ResponseWidget({super.key, required this.question});
  @override
  State<ResponseWidget> createState() => _ResponseWidgetState();
}

class _ResponseWidgetState extends State<ResponseWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ShowResponse>(builder: (context, responseService, child) {
      return Stack(alignment: Alignment.topCenter, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.question.question,
              style: const TextStyle(fontSize: 26, color: Colors.black45)),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1000),
          top: responseService.getResponseState() ? size.height * 0.15 : 0,
          left: responseService.getResponseState() ? size.width * 0.25 : -200,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 2000),
            opacity: responseService.getResponseState() ? 1 : 0,
            child: Column(children: [
              Text(widget.question.getResponse(),
                  style: const TextStyle(fontSize: 26, color: Colors.white)),
            ]),
          ),
        ),
        Positioned(
            bottom: 10,
            left: size.width > 600 ? size.width * 0.28 : size.width * .32,
            child: Row(
              children: [
                Switch(
                    value: responseService.getResponseState(),
                    activeColor: Colors.deepPurple,
                    thumbIcon:
                        const WidgetStatePropertyAll(Icon(Icons.play_arrow)),
                    inactiveThumbColor: Colors.blue,
                    onChanged: responseService.toggleResponseState),
                const Text('Show response', style: TextStyle(fontSize: 16))
              ],
            ))
      ]);
    });
  }
}
