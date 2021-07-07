import 'package:flutter/material.dart';
import 'package:mevoicingglove/constants/cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class OutputScreen extends StatefulWidget {
  const OutputScreen({Key key}) : super(key: key);

  @override
  _OutputScreenState createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  //Cloud Firestore
  String gestToOutput = "";
  String myGesture;

  //Realtime Database
  final fb = FirebaseDatabase.instance;
  var retrievedName = "";
  String inputvalue = "";

  @override
  Widget build(BuildContext context) {
    //Call the Input node in realtime
    final ref = fb.reference().child("Input");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Output Screen'),
        ),
        body: MainCard(
          child: Column(
            children: [
              FutureBuilder(
                future: _fetch(),
                builder: (context, snapshot) {
                  // Fetch data from Firestore
                  if(snapshot.connectionState != ConnectionState.done)
                    return Text('Loading data ... Please wait');
                   return Text("$myGesture");
                  },
                // child: Container(
                //     child: Center(child: Text('Output Text will come here'))),
              ),
              RaisedButton(
                onPressed: (){
                  // Retrieve the data from Realtime (the value of inputvalue will be retrieved and stored in retrievedName variable)
                  ref.child("inputvalue").once().then((DataSnapshot data){
                    setState(() {
                      retrievedName=data.value;
                    });
                  });
                },
                child: Text("Retrieve data"),
              ),
        Text(retrievedName),
            ],
          ),
        ),
      ),
    );
  }

  //Fetch the data from Firestore
  _fetch() async {
    final User = await FirebaseAuth.instance.currentUser;
    if (User != null) {
      await FirebaseFirestore.instance
          .collection('Gestures')
          .doc(User.uid)
          .get()
          .then((value) {
            // retrievedName = "$gestToOutput";
        // Store the data from retrievedName to myGesture
        myGesture = value.data()[retrievedName];
        print(myGesture);
      }).catchError((e) {
        showError(e.message);
        print(e);
      });
    }
  }

  //Catch the error
  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }
}
