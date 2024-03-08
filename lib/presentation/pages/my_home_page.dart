import 'package:flutter/material.dart';
import 'package:my_notes/presentation/pages/my_notes.dart';
import 'package:my_notes/presentation/pages/todo.dart';
import 'package:my_notes/presentation/theme/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.veryLightPink,
      body: Stack(
        children: [
          Offstage(
            offstage: selectedIndex != 0,
            child: const MyNotes(),
          ),
          Offstage(
            offstage: selectedIndex != 1,
            child: const ToDo(),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 15,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        child: Container(
          height: screenSize.height * 0.1,
          width: screenSize.width * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: Center(
            child: BottomNavigationBar(
              iconSize: 30,
              elevation: 0,
              selectedFontSize: 10.0,
              unselectedFontSize: 8.0,
              showSelectedLabels: true,
              selectedItemColor: const Color.fromARGB(255, 237, 131, 166),
              unselectedItemColor: Colors.pink[100],
              backgroundColor: Colors.white,
              currentIndex: selectedIndex,
              onTap: (val) {
                setState(() {
                  selectedIndex = val;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.sticky_note_2),
                  label: 'NOTES',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_box),
                  label: 'TODO',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
