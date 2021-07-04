import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'screens/loginpage.dart';
import 'screens/settingspage.dart';
import 'screens/forgotpasspage.dart';
import 'screens/registerpage.dart';
import 'screens/outputscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication/authentication_services.dart';
import 'package:mevoicingglove/screens/customisationpage.dart';

//Code
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //Code
    return MultiProvider(providers: [
      Provider<AuthenticationService>(
        create: (_) => AuthenticationService(FirebaseAuth.instance),
      ),
      StreamProvider(
        create: (context) => context.read<AuthenticationService>().authStateChanges,
      ),
    ],
      child: MaterialApp(
        routes: {
          '/main':(context)=>MainScreen(),
           '/loginpage':(context)=>LoginPage(),
           '/settingspage':(context)=>SettingsPage(),
           '/forgotpasspage':(context)=>ForgotPasswordPage(),
           '/registerpage':(context)=>RegisterPage(),
           '/outputscreen':(context)=>OutputScreen(),
          '/customisationpage':(context)=>CustomisationPage(),
        },
        initialRoute: '/main',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

//Code
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if(firebaseUser != null) {
      return MainScreen();
    }
    return RegisterPage();
  }
}
