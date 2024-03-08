import 'package:flutter/material.dart';
import 'package:my_notes/logic/data/notes.dart';
import 'package:my_notes/presentation/pages/a_note.dart';
import 'package:my_notes/presentation/theme/colors.dart';

class MyNotes extends StatelessWidget {
  const MyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: MyColors.darkPink,
        title: const Text(
          'My Notes',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) => ANote(
            note: myNotes[index],
          ),
          itemCount: myNotes.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text(
                'Sorry this Function is not available at the moment',
              ),
            ),
          );
        },
        heroTag: null,
        backgroundColor: MyColors.lightPink,
        foregroundColor: Colors.white,
        elevation: 3,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
