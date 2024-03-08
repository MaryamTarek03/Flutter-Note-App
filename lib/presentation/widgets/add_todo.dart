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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: double.infinity),
          Text('Add a TODO'),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
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
          text: 'Add',
          onPressed: onAdd,
        ),
        AlertButton(
          text: 'Cancel',
          onPressed: onCancel,
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
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
