import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  String _currentState = "Starter";
  List<String> list = <String>[
    "Starter",
    "Asian",
    "Placha & Roasts & Grills",
    "Classic",
    "Indian",
    "Italian"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Jayant Kumar"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
            color: Colors.white,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
              color: Colors.white,
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < list.length; i++)
                    customChip(
                        list[i] == _currentState,
                        list[i],
                        (p0) => {
                              setState(() {
                                _currentState = p0;
                              })
                            })
                ],
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
                children: [
                  showPizzaRow(),
                  showPizzaRow(),
                  showPizzaRow(),
                  showPizzaRow(),
                  showPizzaRow(),
                  showPizzaRow(),
                  showPizzaRow(),
                  showPizzaRow(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget customChip(bool selected, String title, Function(String) onValueChange) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: TextButton(
      onPressed: () {
        onValueChange(title);
      },
      style: TextButton.styleFrom(
          foregroundColor: selected ? Colors.white : Colors.black,
          backgroundColor: selected ? Colors.red : Colors.transparent,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)))),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}

Widget showPizzaRow() {
  return SizedBox(
    width: 175,
    child: Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/pizza.png",
            width: 109,
            height: 109,
          ),
          spacerHeight(5),
          const Text(
            "£14.25",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
          spacerHeight(5),
          const Text(
            "Fresh Farm House",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          spacerHeight(5),
          const Text(
            "crisp capsicum, succulent mushrooms and fresh tomatoes",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w300,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

Widget spacerHeight(double height) {
  return SizedBox(height: height);
}
