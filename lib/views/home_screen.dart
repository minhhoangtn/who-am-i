import 'package:Practice_app/models/task_provider.dart';
import 'package:Practice_app/views/add_task_screen.dart';
import 'package:Practice_app/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Todo List',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: 20),
              Expanded(
                child: TaskList(),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0))),
                      context: context,
                      builder: (BuildContext context) => AddTaskScreen());
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'New Reminder',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
