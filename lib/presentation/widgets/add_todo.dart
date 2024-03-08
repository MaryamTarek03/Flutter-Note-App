import 'package:flutter/material.dart';
import 'package:my_notes/presentation/theme/colors.dart';

class TodoAddAlert extends StatelessWidget {
  const TodoAddAlert({
    super.key,
    required this.controller,
    required this.onAdd,
    required this.onCancel,
  });

  final controller;
  final void Function() onAdd;
  final void Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: double.infinity),
          const Text('Add a TODO'),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: controller,
              cursorColor: MyColors.darkPink,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                enabled: true,
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.lightPink),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.darkPink),
                  borderRadius: BorderRadius.circular(25),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: MyColors.lightPink,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        AlertButton(
          text: 'Cancel',
          onPressed: onCancel,
        ),
        AlertButton(
          text: 'Add',
          onPressed: onAdd,
        ),
      ],
    );
  }
}

class AlertButton extends StatelessWidget {
  const AlertButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(MyColors.darkPink),
          foregroundColor: const MaterialStatePropertyAll(Colors.white)),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
