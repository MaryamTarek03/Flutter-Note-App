import 'package:flutter/material.dart';
import 'package:my_notes/logic/models/note_model.dart';
import 'package:my_notes/presentation/theme/colors.dart';

class NotePage extends StatelessWidget {
  NotePage({super.key, required this.note});

  Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.veryLightPink,
      appBar: AppBar(
        backgroundColor: MyColors.darkPink,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: IconButton(
              icon: const Icon(Icons.done),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 25,
                right: 25,
                left: 25,
              ),
              child: Text(
                note.title,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 2,
              indent: 25,
              endIndent: 25,
              color: MyColors.lightPink,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 30,
                  right: 30,
                  left: 30,
                ),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: MyColors.darkPink,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  note.content,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
