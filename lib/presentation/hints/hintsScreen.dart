import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/showHints.dart';
import '../../functions/functions.dart';
import '../../models/questions.dart';

class HintsScreen extends StatelessWidget {
  final Question question;
  final String state;
  const HintsScreen({super.key, required this.question, required this.state});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('Hints', style: TextStyle(fontSize: 30))),
          backgroundColor: Colors.amber,
        ),
        body: ChangeNotifierProvider(
            create: (context) => ShowHints(),
            child:
                ScreenHintsBody(size: size, question: question, state: state)));
  }
}

class ScreenHintsBody extends StatelessWidget {
  const ScreenHintsBody({
    super.key,
    required this.size,
    required this.question,
    required this.state,
  });

  final Size size;
  final Question question;
  final String state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  color: Colors.amber, borderRadius: BorderRadius.circular(16)),
              child: HintsWidget(question: question, state: state)),
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
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/root'),
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
    );
  }
}

class HintsWidget extends StatefulWidget {
  final Question question;
  final String state;
  const HintsWidget({super.key, required this.question, required this.state});
  @override
  State<HintsWidget> createState() => _HintsWidgetState();
}

class _HintsWidgetState extends State<HintsWidget> {
  String getText() => switch (widget.state) {
        'hint1' => widget.question.hints[0],
        'hint2' => widget.question.hints[1],
        _ => widget.question.response
      };
  String getTitle() => switch (widget.state) {
        'hint1' => 'Hint #1',
        'hint2' => 'Hint #2',
        _ => 'Response'
      };
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Consumer<ShowHints>(builder: (context, hintService, child) {
      return Stack(alignment: Alignment.topCenter, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.question.question,
              style: const TextStyle(fontSize: 26, color: Colors.black45)),
        ),
        const SizedBox(
          height: 10,
        ),
        Positioned(
          top: size.height*0.10,
          left:  size.width*0.27,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(getTitle(),
                style: const TextStyle(color: Colors.red, fontSize: 20)),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          top: hintService.showHints ? size.height*0.15: 0,
          left: hintService.showHints ? size.width*0.15: -200,
          child: SizedBox(
            width: 200,
            height:100 ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(getText(),
                      style: const TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ),
          ),

        ),Positioned(
            bottom: 10,
            left: size.width > 600 ? size.width * 0.28 : size.width * .32,
            child: Row(
              children: [
                Switch(
                    value: hintService.showHints,
                    activeColor: Colors.deepPurple,
                    thumbIcon:
                    const WidgetStatePropertyAll(Icon(Icons.play_arrow)),
                    inactiveThumbColor: Colors.blue,
                    onChanged: hintService.toggleHintsState),
                const Text('Show hints', style: TextStyle(fontSize: 16))
              ],
            ))
      ]);
    });
  }
}
