import 'package:flutter/material.dart';
//import 'package:swipe_up/swipe_up.dart';
import 'package:flutter_application_1/Infopage.dart';
import 'package:flutter_application_1/Selectscreen.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  /* WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();*/

  runApp(A4S());
}

class A4S extends StatelessWidget {
  const A4S({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Athens4Studets',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: homescreen(),
    );
  }
}

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 235, 169, 247),
          title: Center(
            child: RichText(
              text: TextSpan(
                text: '    Athens',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '4',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    text: 'Students',
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
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.info),
              tooltip: 'Info',
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Infopage()),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 235, 169, 247),
          child: GestureDetector(
            child: Icon(
              Icons.swipe_up,
              color: Colors.black,
              size: 40,
              semanticLabel: 'swipe up',
            ),
            onVerticalDragUpdate: (DragStartDetails) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Selectscreen()),
              );
            },
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/image 7.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: const <Widget>[
                Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      width: 100,
                      height: 100,
                      image: AssetImage('assets/image/1.png'),
                    )),
                Padding(padding: EdgeInsets.only(top: 60)),
              ],
            )));
  }
}
