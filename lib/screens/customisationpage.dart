import 'package:flutter/material.dart';
import 'package:mevoicingglove/constants/constants.dart';
import 'package:mevoicingglove/constants/cards.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:collection';
import 'package:mevoicingglove/authentication/database.dart';

class CustomisationPage extends StatefulWidget {
  @override
  _CustomisationPageState createState() => _CustomisationPageState();
}

class _CustomisationPageState extends State<CustomisationPage> {
  // Code to customize
  final fb = FirebaseDatabase.instance.reference();
  String userID = "";
  TextEditingController gest01controller = TextEditingController();
  TextEditingController gest02controller = TextEditingController();
  TextEditingController gest03controller = TextEditingController();

  // Call the customization class
  updateData(String gest01, String gest02, String gest03, String userID) async {
    await updateUserData(gest01, gest02, gest03);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Customisation'),
      ),
      body: MainCard(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * .06,
              margin: EdgeInsets.only(top: height * .02),
              child: AutoSizeText(
                'All the Customizable combinations: ',
                style: customTag,
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Index and Middle Finger bend',

              onPressed: () {
                // createDialog(context).then((value) {
                //   if (value != null) {
                //     Map<String, Object> createDoc = new HashMap();
                //     createDoc['Gest12'] = value;
                //     fb.child("Gesture").update(createDoc);
                //     final snackBar = SnackBar(content: Text('Gesture Updated'));
                //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //   }
                // });

                // Call the customization class
                openDialogueBox(context);
              },
            ), //gest12

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Index, Middle and Pinky Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest13'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest13

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Index,Middle and Ring Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest14'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest14

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Index,Middle,Ring and Pinky Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest15'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest15

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Only Thumb bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest16'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest16

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb and Pinky Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest17'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest17

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb and Ring Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest18'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest18

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb,Ring and Pinky Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest19'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest19

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb and Middle Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest20'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest20

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb,Middle and Pinky Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest21'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest21

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb,Middle and Ring Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest22'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest22

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb,Middle,Ring and Pinky Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest23'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest23

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb and Index Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest24'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest24

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb,Index and Pinky Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest25'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest25

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb,Index and Ring Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest26'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest26

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb,Index,Ring and Pinky Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest27'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest27

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb,Index and Middle Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest28'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest28

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb,Index,Middle and Pinky Finger bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest29'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest29

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'Thumb,Index,Middle and Ring bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest30'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest30

            SizedBox(
              height: 1,
              child: Container(
                color: Colors.white54,
              ),
            ),
            ComboCard(
              height: height,
              width: width,
              comboText: 'All Fingers Bend',
              onPressed: () {
                createDialog(context).then((value) {
                  if (value != null) {
                    Map<String, Object> createDoc = new HashMap();
                    createDoc['Gest31'] = value;
                    fb.child("Gesture").update(createDoc);
                    final snackBar = SnackBar(content: Text('Gesture Updated'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ), //gest31
          ],
        ),
      )),
    ));
  }

  // Code to Customize
  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit Gesture Details'),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  TextField(
                    controller: gest01controller,
                    decoration: InputDecoration(hintText: 'gest01'),
                  ),
                  TextField(
                    controller: gest02controller,
                    decoration: InputDecoration(hintText: 'gest02'),
                  ),
                  TextField(
                    controller: gest03controller,
                    decoration: InputDecoration(hintText: 'gest03'),
                  ),
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  submitAction(context);
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

  // Submit Action
  submitAction(BuildContext context) {
    updateData(gest01controller.text, gest02controller.text,
        gest03controller.text, userID);
  }
}

// Old Code
class ComboCard extends StatelessWidget {
  ComboCard(
      {@required this.height,
      @required this.width,
      this.comboText,
      this.onPressed});

  final double height;
  final double width;
  final String comboText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: height*.1,

      margin: EdgeInsets.only(top: height * .02),
      child: Column(
        children: [
          AutoSizeText(
            comboText,
            style: comboTag,
          ),
          Row(
            children: [
              // Container(
              //   width: width*.8,
              //   margin: EdgeInsets.only(left: width*.05,top: height*.004),
              //   padding: EdgeInsets.all(10),
              //   child: TextField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: comboText,
              //         hintText: ''
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: onPressed,
                child: Container(
                  margin: EdgeInsets.only(top: height * .02),
                  width: width * .08,
                  child: FittedBox(
                    child: Icon(Icons.add_circle),
                    fit: BoxFit.contain,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Old Code
Future<String> createDialog(BuildContext context) {
  TextEditingController ed = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Data'),
          content: TextField(
            decoration: InputDecoration(
              hintText: 'Confirm your text',
            ),
            controller: ed,
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop(ed.text.toString());
              },
              child: Text('Confirm Update'),
            ),
          ],
        );
      });
}


