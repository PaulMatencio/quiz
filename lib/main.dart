import 'package:flutter/material.dart';
import 'package:taskf9/presentation/RootBottomNavigationBar.dart';
import 'package:taskf9/presentation/add/addQuestionScreen.dart';
import 'package:taskf9/presentation/list/ListQuestionsScreen.dart';
import 'models/questions.dart';
import 'myHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static bool isLargeDevice = false;
  static bool isLargeScreen =false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Question> questions = createQuestionsList();
    return LayoutBuilder(
        builder: (context, constraints) {
      checkDeviceSize(constraints.maxWidth, constraints.maxHeight);
      return MaterialApp(
        title: 'Flutter Task F9',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(questions:questions,isLargeDevice: isLargeDevice,),
          routes: <String, WidgetBuilder>{
            '/root': (BuildContext context)=> RootBottomNavigationBar(questions:questions,),
            '/list': (BuildContext context) => ListQuestionsScreen(questions:questions,isLargeDevice: isLargeDevice,),
            '/add': (BuildContext context) => AddQuestionsScreen(questions:questions),
          }
      );
  });

  }
}

void checkDeviceSize(double width, double height){
  debugPrint("Width = $width | Height = $height");
  MyApp.isLargeDevice = width >= 800.0 && height >= 1000.0;
  MyApp.isLargeScreen= width>= 600 ;
}

