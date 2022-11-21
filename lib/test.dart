import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _index = 0;

  List<String> _list = [
    'Home',
    'camera',
    'JS',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(_list[_index])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index){
          setState(() {
            _index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.camera),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.javascript),label: 'Home'),
        ],
      ),
    );
  }
}
