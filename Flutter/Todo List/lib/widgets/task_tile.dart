import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkBoxCallBack,
      this.onLongPressCallBack});

  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallBack;
  final Function onLongPressCallBack;
  @override
  Widget build(BuildContext context) {
    // bool isChecked = false;
    return ListTile(
        onLongPress: onLongPressCallBack,
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          activeColor: Colors.blue,
          onChanged: checkBoxCallBack,
        ));
  }
}
