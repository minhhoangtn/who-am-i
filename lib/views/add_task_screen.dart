import 'package:Practice_app/models/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskName = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Column(
        children: [
          Text(
            'Add new task',
            style: TextStyle(
                fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Enter task name',
                errorText: taskName == '' ? 'Value can\'t be empty ' : null),
            autofocus: true,
            onChanged: (value) {
              setState(() {
                taskName = value;
              });
            },
          ),
          SizedBox(height: 20),
          OutlinedButton(
            child: Text(
              'Add',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              if (taskName.length == 0) return;
              Provider.of<TaskData>(context, listen: false).addTask(taskName);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
