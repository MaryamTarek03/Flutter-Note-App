import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_notes/presentation/theme/colors.dart';

class ToDoTile extends StatefulWidget {
  ToDoTile({
    super.key,
    required this.todo,
    required this.deleteFunction,
    required this.isChecked,
    required this.onChanged,
  });

  bool isChecked;
  final String todo;
  Function(BuildContext)? deleteFunction;
  Function(bool?)? onChanged;
  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        right: 15,
        left: 15,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteFunction,
              icon: Icons.delete,
              foregroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(15),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.isChecked ? MyColors.lightPink : MyColors.darkPink,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: widget.isChecked
                      ? MyColors.lightPink
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: widget.isChecked ? MyColors.lightPink : Colors.white,
                    width: 1,
                  ),
                ),
                child: Checkbox(
                  value: widget.isChecked,
                  activeColor: MyColors.lightPink,
                  overlayColor: MaterialStatePropertyAll(MyColors.lightPink),
                  side: const BorderSide(color: Colors.transparent),
                  focusColor: MyColors.lightPink,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: MyColors.lightPink),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // checkColor: MyColors.darkPink,
                  onChanged: widget.onChanged,
                ),
              ),
              title: Text(
                widget.todo,
                style: TextStyle(
                  color: Colors.white,
                  decoration: widget.isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
