import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mevoicingglove/constants/cards.dart';
import 'package:mevoicingglove/constants/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Predefined_OutputScreen extends StatefulWidget {
  @override
  _Predefined_OutputScreenState createState() =>
      _Predefined_OutputScreenState();
}

class _Predefined_OutputScreenState extends State<Predefined_OutputScreen> {
  //Flutter TTS package
  final FlutterTts flutterTts = FlutterTts();
  //Realtime Databasse
  final fb = FirebaseDatabase.instance;
  var retrievedName = "";
  String inputvalue = "";

  @override
  Widget build(BuildContext context) {
    Future _speak() async {
      await flutterTts.setLanguage("en-IN");
      flutterTts.setPitch(1);
      await flutterTts.speak(retrievedName);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'OutputScreen',
          ),
        ),
        body: MainCard(
          child: Center(
            child: Row(
              children: [
                RaisedButton(
                  onPressed: _fetchGesture,
                  // Retrieve the data from Realtime (the value of inputvalue will be retrieved and stored in retrievedName variable)
                  child: Text("Retrieve data"),
                ),
                Text(
                  retrievedName,
                  style: comboTag,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.speaker_phone,
                    color: Colors.white,
                  ),
                  onTap: _speak,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _fetchGesture() async {
    final ref = await fb.reference().child("Input");
    setState(() {
      ref.child("inputvalue").once().then((DataSnapshot data) {
        setState(() {
          retrievedName = data.value;
        });
      });
    });
  }
}
