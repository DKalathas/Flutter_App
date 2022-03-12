import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_tts/flutter_tts.dart';

class page3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _page3();
}

class _page3 extends State<page3> {
  FlutterTts flutterTts = FlutterTts();

  @override
  Future _speak() async {
    await flutterTts.setPitch(1);
    await flutterTts.setLanguage("en-US");
    await flutterTts
        .speak("the choices are park of Beikou and park of philadelthia");
  }

  String url1 = 'https://goo.gl/maps/6hkgot9ZkGdp5bCh6';
  @override
  void _launchURL1() async {
    if (!await launch(url1)) throw 'Could not launch $url1';
  }

  String url2 = 'https://goo.gl/maps/r7k4gxYLJAGHFdEz7';

  @override
  void _launchURL2() async {
    if (!await launch(url2)) throw 'Could not launch $url2';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 108, 48, 119),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 146, 245),
        title: Center(
          child: RichText(
            text: TextSpan(
              text: 'You',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Might ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                TextSpan(
                  text: 'Like',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 40,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.volume_up),
            tooltip: 'Text To Speech',
            color: Colors.black,
            onPressed: _speak,
          ),
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Home',
            color: Colors.black,
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => A4S()));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 203, 114, 219),
        child: IconButton(
          icon: const Icon(Icons.home),
          iconSize: 30,
          tooltip: 'Home',
          color: Colors.black,
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => A4S()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                'Άλσος Βεΐκου',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Image.asset(
                'assets/image/image 15.png',
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                'Λόφος Φιλοθέης, Γαλάτσι 111 47',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Text(
                'Phone: 21 0291 9111',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: button1(),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                'Άλσος Νέας Φιλαδέλφειας',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Image.asset(
                'assets/image/image 14.png',
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                'Νέα Φιλαδέλφεια Αττικής 143 42',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Text(
                'Phone: 21 0251 5603',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: button2(),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget button1() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              icon: const Icon(Icons.map),
              iconSize: 30,
              tooltip: 'Address',
              color: Colors.black,
              onPressed: open1),
          IconButton(
            icon: const Icon(Icons.phone),
            iconSize: 30,
            tooltip: 'phone',
            color: Colors.black,
            onPressed: open3,
          ),
        ],
      );

  @override
  Widget button2() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              icon: const Icon(Icons.map),
              iconSize: 30,
              tooltip: 'Address',
              color: Colors.black,
              onPressed: open2),
          IconButton(
            icon: const Icon(Icons.phone),
            iconSize: 30,
            tooltip: 'phone',
            color: Colors.black,
            onPressed: open4,
          ),
        ],
      );
  @override
  void open1() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: const Text('Open Maps?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: _launchURL1,
                  child: const Text('Yes'),
                ),
              ],
            ));
  }

  @override
  void open2() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: const Text('Open Maps?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: _launchURL2,
                  child: const Text('Yes'),
                ),
              ],
            ));
  }

  @override
  void open3() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: const Text('Open Phone?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    _launchPhoneURL('2102919111');
                  },
                  child: const Text('Yes'),
                ),
              ],
            ));
  }

  void open4() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: const Text('Open Phone?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    _launchPhoneURL('2102515603');
                  },
                  child: const Text('Yes'),
                ),
              ],
            ));
  }
}
