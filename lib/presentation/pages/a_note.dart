import 'package:flutter/material.dart';
import 'package:my_notes/logic/models/note_model.dart';
import 'package:my_notes/presentation/pages/note_page.dart';
import 'package:my_notes/presentation/theme/colors.dart';

class ANote extends StatelessWidget {
  ANote({super.key, required this.note});

  Note note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NotePage(note: note),
        ),
      ),
      child: Container(
        height: 150,
        width: 250,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: MyColors.lightPink,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              note.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              note.content,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
