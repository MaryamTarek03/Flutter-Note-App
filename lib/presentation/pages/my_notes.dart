import 'package:flutter/material.dart';

class MyNotes extends StatelessWidget {
  const MyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 237, 131, 166),
        title: Text(
          'My Notes',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(child: Text('Notes')),
    );
  }
}
