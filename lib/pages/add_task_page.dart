import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/resources/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

void createTask(String title, String description) {
  Task newTask = Task(title: title, description: description);
  tasks.add(newTask);
}

TextEditingController _titleController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();

DateTime currentDate = DateTime.now();
String day = DateFormat('EEEE').format(currentDate);

final description = '$day, ${DateFormat('d MMMM').format(currentDate)}';

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Align(
          alignment: Alignment.center,
          child: Text("New Task", style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Menghilangkan tombol "Back"
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
            iconSize: 30,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0, left: 40.0),
                child: Text(
                  "What are you planning?",
                  style: TextStyle(
                    fontSize: 20,
                    color: textSubsColor,
                  ),
                ),
              ),
              const SizedBox(
                  height: 1.0), // Jarak antara hint text dan kotak input
              Padding(
                padding: const EdgeInsets.only(left: 40.0, bottom: 100.0),
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.notifications),
                            onPressed: () {},
                            color: textSubsColor,
                            iconSize: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                                description, // Tampilkan tanggal dan hari
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.note),
                            onPressed: () {},
                            color: textSubsColor,
                            iconSize: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('Add Note',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.tag),
                            onPressed: () {},
                            color: textSubsColor,
                            iconSize: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('Category',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Material(
        color: primaryColor,
        child: InkWell(
          onTap: () {
            createTask(_titleController.text, description);
            Navigator.pop(context);
          },
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                'Create',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
