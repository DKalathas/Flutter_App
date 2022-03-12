import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/page1.dart';
import 'package:flutter_application_1/page2.dart';
import 'package:flutter_application_1/page3.dart';
import 'package:flutter_application_1/page4.dart';
import 'package:flutter_application_1/map.dart';
import 'package:flutter_application_1/scanpage.dart';

class Selectscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Selectscreenstate();
}

class _Selectscreenstate extends State<Selectscreen> {
  bool isDisable1 = false;
  bool isDisable2 = false;
  bool isDisable3 = false;
  bool isDisable4 = false;

  /*late CameraController controller;

  @override
  void opencamera() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: const Text('Open Camera?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CameraPreview(controller))),
                  child: const Text('Yes'),
                ),
              ],
            ));
  }

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }*/

  @override
  void buttoncheck() {
    if (isDisable1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page1()),
      );
    }
    if (isDisable2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page2()),
      );
    }
    if (isDisable3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page3()),
      );
    }
    if (isDisable4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page4()),
      );
    }
  }
/*
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 108, 48, 119),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 146, 245),
        title: RichText(
          text: TextSpan(
            text: 'Select',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' Your ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              TextSpan(
                text: 'Preference',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 40,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Home',
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 203, 114, 219),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.document_scanner_sharp),
                tooltip: 'camera',
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanPage()),
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Map search',
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Map()),
                  );
                },
              ),
            ),
            Expanded(
              child: RaisedButton(
                padding: EdgeInsets.all(23),
                textColor: Color.fromARGB(255, 0, 0, 0),
                color: Color.fromARGB(255, 246, 207, 253),
                onPressed:
                    (isDisable1 || isDisable2 || isDisable3 || isDisable4)
                        ? () => buttoncheck()
                        : null,
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: text1(),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: images1(),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: chekbox1(),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: text2(),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: images2(),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: chekbox2(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget text1() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'Nightlife',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          Text(
            'To Eat',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ],
      );

  @override
  Widget text2() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'To Walk',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          Text(
            'Entertaiment',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ],
      );

  Widget images1() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/image/image 8.png'),
                    ))),
          ),
          Expanded(
            child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/image/image 9.png'),
                    ))),
          ),
        ],
      );

  @override
  Widget images2() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/image/image 10.png'),
                    ))),
          ),
          Expanded(
            child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/image/image 11.png'),
                    ))),
          ),
        ],
      );

  @override
  Widget chekbox1() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Checkbox(
              checkColor: Colors.greenAccent,
              activeColor: Colors.red,
              value: isDisable1,
              onChanged: (value) {
                isDisable4 = false;
                isDisable2 = false;
                isDisable3 = false;
                setState(() {
                  isDisable1 = value!;
                });
              },
            ),
          ),
          Checkbox(
            checkColor: Colors.greenAccent,
            activeColor: Colors.red,
            value: isDisable2,
            onChanged: (value) {
              isDisable1 = false;
              isDisable4 = false;
              isDisable3 = false;
              setState(() {
                isDisable2 = value!;
              });
            },
          ),
        ],
      );
  @override
  Widget chekbox2() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Checkbox(
              checkColor: Colors.greenAccent,
              activeColor: Colors.red,
              value: isDisable3,
              onChanged: (value) {
                isDisable1 = false;
                isDisable2 = false;
                isDisable4 = false;
                setState(() {
                  isDisable3 = value!;
                });
              },
            ),
          ),
          Checkbox(
            checkColor: Colors.greenAccent,
            activeColor: Colors.red,
            value: isDisable4,
            onChanged: (value) {
              isDisable1 = false;
              isDisable2 = false;
              isDisable3 = false;
              setState(() {
                isDisable4 = value!;
              });
            },
          ),
        ],
      );
}
