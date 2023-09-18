import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/pages/add_task_page.dart';
import 'package:todo_list/resources/task.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  void _refreshTaskList() {
    setState(() {});
  }

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
        backgroundColor: primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0, top: 80.0, left: 40.0),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.list,
                  size: 50,
                  color: primaryColor,
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
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                '${tasks.length} Tasks',
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white70,
                ),
              ),
            ),
            Container(
              height: 40,
              color: primaryColor,
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
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    DateTime currentDate = DateTime.now();
                    String day = DateFormat('EEEE').format(currentDate);
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                day,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: textSubsColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                tasks[index].title,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: tasks[index].isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          tasks[index].description,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        trailing: Checkbox(
                          value: tasks[index].isDone,
                          onChanged: (value) {
                            setState(() {
                              tasks[index].isDone = value!;
                            });
                          },
                          activeColor: primaryColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Navigasi ke halaman AddTaskPage jika tombol "+" ditekan
            final result = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddTaskPage(),
            ));
            if (result == true) {
              _refreshTaskList();
            }
          },
          backgroundColor: primaryColor,
          child: const Icon(Icons.add),
        ));
  }
}
