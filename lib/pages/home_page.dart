import 'package:flutter/material.dart';
import 'package:todo_list/pages/add_task_page.dart';
import 'package:todo_list/pages/task_page.dart';
import 'package:todo_list/resources/task.dart';
import 'package:todo_list/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: textTitleColor,
            iconSize: 40,
            onPressed: () {},
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 80,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Lists",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: textTitleColor)),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Jumlah kolom dalam GridView
                mainAxisSpacing: 10.0, // Jarak vertikal antara item
                crossAxisSpacing: 10.0, // Jarak horizontal antara item
              ),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    if (index == 0) {
                      setState(() {});
                      // Navigasi ke halaman TaskPage jika "All" ditekan
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TaskPage(),
                      ));
                    }
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Data().icons[index],
                              size: 60.0,
                              color: Data().colors[index],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 80.0),
                              child: Text(
                                Data().titles[index],
                                style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                Data().subtitles[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: textSubsColor,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigasi ke halaman AddTaskPage jika tombol "+" ditekan
            setState(() {});
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddTaskPage(),
            ));
          },
          backgroundColor: primaryColor,
          child: const Icon(Icons.add),
        ));
  }
}
