import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_tts/flutter_tts.dart';

class page4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _page4();
}

class _page4 extends State<page4> {
  FlutterTts flutterTts = FlutterTts();

  @override
  Future _speak() async {
    await flutterTts.setPitch(1);
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(
        "the choices are cinema at the mall athnes  and mastermind escape room");
  }

  String url1 = 'https://goo.gl/maps/8wJsk8roCfi1wf1E7';
  @override
  void _launchURL1() async {
    if (!await launch(url1)) throw 'Could not launch $url1';
  }

  String url2 = 'https://g.page/Mastermind-Athens?share';

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
                'Village Cinemas at The Mall Athens',
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
                'assets/image/image 17.png',
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                'Ανδρέα Παπανδρέου 35, Μαρούσι 151 22',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Text(
                'Phone: 21 0610 4100',
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
                'Mastermind Escape Rooms',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Image.asset(
                'assets/image/image 22.png',
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                'Καρόρη 6, Αθήνα 105 51',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Text(
                'Phone: 21 3034 4996',
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
                    _launchPhoneURL('2106104100');
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
                    _launchPhoneURL('2130344996');
                  },
                  child: const Text('Yes'),
                ),
              ],
            ));
  }
}
