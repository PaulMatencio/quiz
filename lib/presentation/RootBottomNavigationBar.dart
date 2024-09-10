import 'package:flutter/material.dart';
import 'package:taskf9/main.dart';
import 'package:taskf9/presentation/add/addQuestionScreen.dart';
import 'package:taskf9/presentation/home/myHomeScreen.dart';
import 'package:taskf9/presentation/list/ListQuestionsScreen.dart';
import '../models/questions.dart';

// it the first  widget of home:

class RootBottomNavigationBar extends StatefulWidget {
  final List<Question> questions;
  const RootBottomNavigationBar({super.key, required this.questions});
  @override
  State<RootBottomNavigationBar> createState() =>
      _RootBottomNavigationBarState();
}

class _RootBottomNavigationBarState extends State<RootBottomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    const Icon homeIcon = Icon(Icons.home_filled, size: 26);
    const Icon listIcon = Icon(Icons.question_answer, size: 26);
    const Icon addIcon = Icon(Icons.add_card, size: 26);

    const homeLabel = 'Home';
    const listLabel = 'List questions';
    const addLabel = 'Add question';

    //   navigation bar  for  mobile
    const List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(icon: homeIcon, label: homeLabel),
      BottomNavigationBarItem(icon: listIcon, label: listLabel),
      BottomNavigationBarItem(icon: addIcon, label: addLabel),
    ];

    //  navigation bar for tablet
    const List<NavigationRailDestination> tabletItems = [
      NavigationRailDestination(icon: homeIcon, label: Text(homeLabel)),
      NavigationRailDestination(icon: listIcon, label: Text(listLabel)),
      NavigationRailDestination(icon: addIcon, label: Text(addLabel)),
    ];

    // Route
    List<Widget> getIndexedStackChildren({required List<Question> questions})
    {


      return [
        MyHomeScreen(isLargeDevice: MyApp.isLargeDevice),
        ListQuestionsScreen(questions: questions,isLargeDevice: MyApp.isLargeDevice),
        AddQuestionsScreen(questions: questions)
      ];
    }

    IndexedStack getIndexedStack(
        { required List<Question> questions}) {
      return IndexedStack(
          index: currentIndex,
          children: getIndexedStackChildren(
              questions: questions));
    }

    // home:  Scaffold()
    return Scaffold(
        bottomNavigationBar: MyApp.isLargeDevice
            ? null
            : Container(
                padding: const EdgeInsets.fromLTRB(8, 1, 8, 10),
                decoration: getBoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: BottomNavigationBar(
                    items: items,
                    currentIndex: currentIndex,
                    onTap: navBarNavigate,
                    elevation: 10,
                    backgroundColor: Colors.amber,
                    selectedItemColor: Colors.blue,
                    selectedFontSize: 18,
                    unselectedFontSize: 16,
                    unselectedItemColor: Colors.black,
                  ),
                ),
              ),
        body: MyApp.isLargeDevice
            ? Container(
                decoration: getBoxDecoration(),
                padding: const EdgeInsets.fromLTRB(8, 1, 8, 10),
                //margin: const EdgeInsets.all(10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NavigationRail(
                      leading: const SizedBox(
                        height: 100,
                      ),
                      indicatorColor: Colors.blue,
                      elevation: 10,
                      backgroundColor: Colors.amber,
                      minWidth: 100,

                      // minExtendedWidth: 70,
                      // extended: true,
                      destinations: tabletItems,
                      selectedIndex: currentIndex,
                      onDestinationSelected: navBarNavigate,
                      labelType: NavigationRailLabelType.selected,
                    ),
                  ),
                  Expanded(
                    child: IndexedStack(
                        index: currentIndex,
                        children: getIndexedStackChildren(
                            questions: widget.questions)),
                  ),
                ]),
              )

            : getIndexedStack(   //   Mobile device
                questions: widget.questions));
  }

  void navBarNavigate(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  BoxDecoration getBoxDecoration() {
    return const BoxDecoration(boxShadow: [
      BoxShadow(blurRadius: 10.0, spreadRadius: 3.0, color: Colors.black12)
    ], color: Colors.transparent);
  }
} //end  _RootBottomNavigationBarState
