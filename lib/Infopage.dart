import 'package:flutter/material.dart';

class Infopage extends StatelessWidget {
  const Infopage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 108, 48, 119),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 146, 245),
        title: const Text(
          'About',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 40,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 203, 114, 219),
        child: IconButton(
          icon: const Icon(Icons.home),
          tooltip: 'Home',
          iconSize: 40,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'This app is going to be your guide in Athens, in those times when you want to take a break from your school! Here you can find every time the best place for you to go, since you can choose the category which suits your mood the most and select the best option for your budget.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
