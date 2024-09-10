import 'package:flutter/material.dart';
import '../../models/questions.dart';

class AddQuestionsScreen extends StatefulWidget {
  final List<Question> questions;
  const AddQuestionsScreen({super.key,required this.questions});

  @override
  State<AddQuestionsScreen> createState() => _AddQuestionsScreenState();
}

class _AddQuestionsScreenState extends State<AddQuestionsScreen> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  // Clean up the controller when the widget is disposed.
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Question question =
        Question(question: '', category: '', response: '', hints: []);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add a question',style: TextStyle(
          fontSize: 30
        ),)),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //color: Colors.white38,
              width: size.width,
              color:Colors.white38,
              child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Center(child: Text('Please fill the form and hit the submit button',
                          style:TextStyle(fontSize: 26))),
                        ),
                        TextFormField(
                          // The validator receives the text that the user has entered.
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.amber,
                            )),
                            labelText: 'Enter a category',
                            // labelText: 'Question'
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please a category';
                            }
                            question.category = value;
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // The validator receives the text that the user has entered.
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            border: OutlineInputBorder(),
                            labelText: 'Enter a question',
                            // labelText: 'Question'
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a question';
                            }
                            question.question = value;
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // The validator receives the text that the user has entered.
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white54,
                              border: OutlineInputBorder(),
                              labelText: 'Enter the response'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the response';
                            }
                            question.response = value;
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // The validator receives the text that the user has entered.
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white54,
                              border: OutlineInputBorder(),
                              labelText: 'Enter hint #1'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the first hint';
                            }
                            question.hints.add(value);
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // The validator receives the text that the user has entered.
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white54,
                              border: OutlineInputBorder(),
                              labelText: 'Enter hint #2'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the second hints';
                            }
                            question.hints.add(value);
        
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child:   ElevatedButton(
                            style: ButtonStyle(
                              textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 20)),
                              backgroundColor: WidgetStateProperty.all(Colors.amber)
                            ),
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                               //  widget.questions.add(question);
        
                                  widget.questions.add(question);
        
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Processing Data')),
                                );
                              }
                            },
                            child:  const SizedBox(
                              width: 100,
                               child: Center(child: Text('submit'))),
                            ),
                        ),
                        // Add TextFormFields and ElevatedButton here.
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
        /*
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              onPressed: () => Navigator.pushNamed(context, '/list'),
              label: const Text('list questions'),
              icon: const Icon(Icons.question_answer),
            ),
          ],
        )
        */
    );
  }
}
