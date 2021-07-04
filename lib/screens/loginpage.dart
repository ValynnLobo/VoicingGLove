import 'package:flutter/material.dart';
import 'package:mevoicingglove/constants/cards.dart';
import 'package:mevoicingglove/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'registerpage.dart';
import 'forgotpasspage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Code
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
  String password;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.pushReplacementNamed(context, '/');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        Navigator.pushReplacementNamed(context, '/main');
        final snackBar = SnackBar(content: Text("Logged In"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext) {
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

  navigateToSignUp() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: MainCard(
          //Code
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: width - 20,
                  margin: EdgeInsets.only(
                      left: width * .1, right: width * .1, top: height * .05),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    //Code
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) {
                        if (input.isEmpty) return 'Enter Email';
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email ID',
                          hintText: 'Enter valid mail id as abc@gmail.com'),
                      onSaved: (input) => email = input),
                ),
                Container(
                  width: width - 20,
                  margin: EdgeInsets.only(left: width * .1, right: width * .1),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                      obscureText: true,
                      //Code
                      validator: (input) {
                        if (input.length < 6)
                          return 'Provide Minimum 6 Character';
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter your secure password'),
                      onSaved: (input) => password = input),
                ),
                GestureDetector(
                  //Code
                  onTap: () {
                    setState(() {
                      login();
                    });
                    // final snackBar = SnackBar(content: Text("Login"));
                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: height * .02),
                    width: width * .35,
                    height: height * .05,
                    child: Center(
                        child: AutoSizeText(
                      'Log In',
                      style: iconTag,
                      maxLines: 1,
                    )),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 3)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * .02),
                  width: width * .5,
                  height: height * .05,
                  child: Center(
                    child: GestureDetector(
                      // onTap: () {
                      //   print('Forgot pass');
                      //   Navigator.pushNamed(context, '/forgotpasspage');
                      // },
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()),
                      ),
                      child: AutoSizeText(
                        'Forgot Password!',
                        style: forgotPassText,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * .01),
                  width: width * .5,
                  height: height * .05,
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      print('register');
                      setState(() {
                        Navigator.pushReplacementNamed(context, '/registerpage');
                      });
                    },
                    child: AutoSizeText(
                      'Not Registered yet? Register here!',
                      style: registerText,
                      maxLines: 1,
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
