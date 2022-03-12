import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'dart:async';
import 'package:flutter_application_1/page5.dart';
import 'package:flutter_application_1/Selectscreen.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPage();
}

class _ScanPage extends State<ScanPage> {
  late String result;
  File? _image;
  InputImage? inputImage;
  final picker = ImagePicker();
  bool isdisable = false;
  Future pickImageFromGallery() async {
    isdisable = true;
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        inputImage = InputImage.fromFilePath(pickedFile.path);
        imageToText(inputImage);
      } else {
        print('No image selected.');
      }
    });
  }

  Future captureImageFromCamera() async {
    isdisable = true;
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        inputImage = InputImage.fromFilePath(pickedFile.path);
        imageToText(inputImage);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 108, 48, 119),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 146, 245),
        title: Center(
          child: Text(
            'Scan Text',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 40,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
          color: Colors.black,
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Selectscreen()));
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 203, 114, 219),
        child: SizedBox(
          width: 50,
          child: RaisedButton(
            onPressed: (isdisable)
                ? () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page5()),
                    )
                : null,
            child: Text(
              "Find your place",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Press button for image',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            FloatingActionButton(
              onPressed: pickImageFromGallery,
              backgroundColor: Colors.purple,
              child: Icon(
                Icons.image,
              ),
              heroTag: "bnt3",
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Press button for Camera',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            FloatingActionButton(
              onPressed: captureImageFromCamera,
              backgroundColor: Colors.purple,
              child: Icon(
                Icons.camera_alt,
              ),
              heroTag: "bnt4",
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future imageToText(inputImage) async {
    result = '';

    final textDetector = GoogleMlKit.vision.textDetector();
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);
    if (!mounted) {
      return;
    } else
      setState(() {
        String text = recognisedText.text;
        for (TextBlock block in recognisedText.blocks) {
          //each block of text/section of text
          final String text = block.text;
          print("block of text: ");
          print(text);
          for (TextLine line in block.lines) {
            //each line within a text block
            for (TextElement element in line.elements) {
              //each word within a line
              result += element.text + " ";
            }
          }
        }
        result += "\n\n";
      });
  }
}
