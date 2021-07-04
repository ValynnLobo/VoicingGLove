import 'dart:ui';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:mevoicingglove/constants/cards.dart';
import 'package:mevoicingglove/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'customisationpage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //Code
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("/loginpage");
      }
    });
  }

  getUser() async {
    User firebaseUSer = _auth.currentUser;
    await firebaseUSer?.reload();
    firebaseUSer = _auth.currentUser;

    if (firebaseUSer != null) {
      setState(() {
        this.user = firebaseUSer;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  //TODO write code to retrieve username here.
  String getUserName() {
    String username;
    username = "username";
    return username;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      body: SingleChildScrollView(
        child: MainCard(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: height * .02, left: width * .02),
                            height: height * .14,
                            width: width * .26,
                            child: CircularProfileAvatar('',
                                radius: width * .2,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 45,
                                ) //Image.asset(,width: width*.4,height: height*.2,)

                                )),
                        SizedBox(
                          width: width * .04,
                        ),
                        Center(
                            child: Text(
                              getUserName(),
                              style: profileName,
                            ),
                            ),
                      ],
                    ),
                    SizedBox(height: height * .01),
                    SizedBox(height: height * .02),
                    SizedBox(
                      width: width,
                      height: 1,
                      child: Container(
                        color: Colors.blueGrey,
                      ),
                    ),
                    SettingsCard(
                      height: height,
                      width: width,
                      name: 'Customization',
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, '/customisationpage');
                        });
                      }
                    ),
                    SettingsCard(
                      height: height,
                      width: width,
                      name: 'User Manual',
                    ),
                    SettingsCard(
                      height: height,
                      width: width,
                      name: 'Log Out',
                      onPressed: signOut,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class SettingsCard extends StatelessWidget {
  SettingsCard(
      {@required this.height,
      @required this.width,
      @required this.name,
      this.color,
      this.onPressed});

  final double height;
  final double width;
  final String name;
  final Color color;
  //Code
  final Function onPressed;

  Color getColor() {
    if (color == null) {
      return mainColor;
    } else {
      return color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: height * .1,
            width: width * .98,
            margin: EdgeInsets.only(top: height * .02),
            decoration: BoxDecoration(
              color: mainColor,
              border: Border.all(color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(5, 3), // changes position of shadow
                )
              ],
            ),
            child: Center(
                child: Text(
              name,
              style: settingsTag,
            )),
          ),
        )
      ],
    );
  }
}