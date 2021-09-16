import 'package:Practice_app/models/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Dismissible(
                direction: taskData.taskList[index].isDone
                    ? DismissDirection.endToStart
                    : null,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 28),
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Task is deleted'),
                    duration: Duration(seconds: 1),
                  ));
                  return taskData.deleteTask(index);
                },
                key: UniqueKey(),
                child: ListTile(
                  title: Text(
                    taskData.taskList[index].name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  trailing: Checkbox(
                    value: taskData.taskList[index].isDone,
                    onChanged: (bool value) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: taskData.taskList[index].isDone == true
                            ? Text('Task undone')
                            : Text('Task done'),
                        duration: Duration(milliseconds: 300),
                      ));
                      taskData.toggleCheckBox(index);
                    },
                  ),
                ),
              );
            },
            itemCount: taskData.taskCount,
          );
        },
      ),
    );
  }
}
