import 'package:flutter/material.dart';
import 'package:todo_list/resources/task.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 108, 142, 253),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                iconSize: 35,
                color: Colors.white,
                onPressed: () {},
              ),
            ]),
        backgroundColor: const Color.fromARGB(255, 108, 142, 253),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0, top: 100.0, left: 40.0),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.list,
                  size: 50,
                  color: Color.fromARGB(255, 108, 142, 253),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 45.0),
              child: Text(
                "All",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Text(
                "23 Tasks",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white70,
                ),
              ),
            ),
            Container(
              height: 80,
              color: const Color.fromARGB(255, 108, 142, 253),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
