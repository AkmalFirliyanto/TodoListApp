import 'package:flutter/material.dart';
import 'package:todo_list/pages/task_page.dart';
import 'package:todo_list/resources/task.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.black,
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
                      color: Colors.black)),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Jumlah kolom dalam GridView
                mainAxisSpacing: 10.0, // Jarak vertikal antara item
                crossAxisSpacing: 10.0, // Jarak horizontal antara item
              ),
              itemCount:
                  8, // Ganti dengan jumlah item yang ingin Anda tampilkan
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    if (index == 0) {
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
                                  color: Colors.grey,
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
          onPressed: () {},
          backgroundColor: const Color.fromARGB(255, 108, 142, 253),
          child: const Icon(Icons.add),
        ));
  }
}
