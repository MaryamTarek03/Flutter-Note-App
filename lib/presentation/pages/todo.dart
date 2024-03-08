import 'package:flutter/material.dart';
import 'package:my_notes/logic/data/todos.dart';
import 'package:my_notes/presentation/theme/colors.dart';
import 'package:my_notes/presentation/widgets/add_todo.dart';
import 'package:my_notes/presentation/widgets/to_do_tile.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    void onAdd() {
      if (_controller.text.isNotEmpty) {
        setState(() {
          todoItems.add([_controller.text, false]);
          print(todoItems);
        });
        Navigator.pop(context);
      }
    }

    void onCancel() {
      Navigator.pop(context);
    }

    void deleteTodo(int index) {
      setState(() {
        todoItems.removeAt(index);
      });
    }

    void checkBoxChanged(bool? value, int index) {
      setState(() {
        todoItems[index][1] = !todoItems[index][1];
      });
    }

    return Scaffold(
      backgroundColor: MyColors.veryLightPink,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: MyColors.darkPink,
        title: Text(
          'TO DO',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ToDoTile(
          todo: todoItems[index][0],
          isChecked: todoItems[index][1],
          onChanged: (value) => checkBoxChanged(value, index),
          deleteFunction: (context) => deleteTodo(index),
        ),
        itemCount: todoItems.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => TodoAddAlert(
              controller: _controller,
              onAdd: onAdd,
              onCancel: onCancel,
            ),
          );
        },
        backgroundColor: MyColors.lightPink,
        foregroundColor: Colors.white,
        elevation: 3,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
