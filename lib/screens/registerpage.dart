import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mevoicingglove/constants/cards.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mevoicingglove/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mevoicingglove/authentication/database.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Code
  final _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name;
  String email;
  String password;
  String uid;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signup() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //Call the class to create a new user with the customization fields
        createUserData('null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null');

        if (user != null) {
          await _auth.currentUser.updateProfile(displayName: name);
          Navigator.pushReplacementNamed(context, '/main');
          final snackBar = SnackBar(content: Text("Registered"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Register Here!'),
      ),
      body: SingleChildScrollView(
        child: MainCard(
          //Code
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //mail text box
                Container(
                  width: width - 20,
                  margin: EdgeInsets.only(
                      left: width * .1, right: width * .1, top: height * .05),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                      //Code
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) {
                        if (input.isEmpty ||
                            !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(input)) return 'Entera valid Email';
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid mail id as abc@gmail.com'),
                      onSaved: (input) => email = input),
                ),
                //password text
                Container(
                  width: width - 20,
                  margin: EdgeInsets.only(left: width * .1, right: width * .1),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    //Code
                    validator: (input) {
                      if (input.length < 6)
                        return 'Provide Minimum 6 Character';
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter your secure password'),
                      onSaved: (input) => password = input),
                  ),
                GestureDetector(
                  onTap: () {
                    //Code
                    setState(() {
                      signup();
                    });
                    // final snackBar = SnackBar(content: Text("Register"));
                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: height * .02),
                    width: width * .35,
                    height: height * .05,
                    child: Center(
                        child: AutoSizeText(
                      'Register',
                      style: iconTag,
                      maxLines: 1,
                    )),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 3)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
