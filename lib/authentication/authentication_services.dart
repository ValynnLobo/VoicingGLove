import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuth;

  AuthenticationService(this.firebaseAuth);

  Stream<User> get authStateChanges => firebaseAuth.idTokenChanges();
}