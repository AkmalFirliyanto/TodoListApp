import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      Icons.list,
      Icons.work,
      Icons.headphones,
      Icons.airplanemode_active,
      Icons.book,
      Icons.home,
      Icons.palette,
      Icons.shopping_cart,
    ];

    final List<Color> colors = [
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.green,
      Colors.blue,
      Colors.red,
      Colors.purple,
      const Color.fromARGB(255, 44, 173, 124),
    ];

    final List<String> titles = [
      'All',
      'Work',
      'Music',
      'Travel',
      'Study',
      'Home',
      'Art',
      'Shopping',
    ];

    final List<String> subtitles = [
      '23 Tasks',
      '14 Tasks',
      '4 Tasks',
      '1 Tasks',
      '2 Tasks',
      '14 Tasks',
      '5 Tasks',
      '8 Tasks',
    ];

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
                // Membuat item GridView di sini
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            icons[index],
                            size: 60.0,
                            color: colors[index],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0),
                            child: Text(
                              titles[index],
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              subtitles[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ]),
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
