import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Class to create a new user
Future createUserData(String gest12,String gest13, String gest14, String gest15, String gest16, String gest17, String gest18, String gest19, String gest20, String gest21, String gest22, String gest23, String gest24, String gest25, String gest26, String gest27, String gest28, String gest29, String gest30, String gest31) async {
  final CollectionReference gesture = FirebaseFirestore.instance.collection('Gestures');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
    gesture.doc(uid).set({
      'gest12': gest12,
      'gest13': gest13,
      'gest14': gest14,
      'gest15': gest15,
      'gest16': gest16,
      'gest17': gest17,
      'gest18': gest18,
      'gest19': gest19,
      'gest20': gest20,
      'gest21': gest21,
      'gest22': gest22,
      'gest23': gest23,
      'gest24': gest24,
      'gest25': gest25,
      'gest26': gest26,
      'gest27': gest27,
      'gest28': gest29,
      'gest29': gest29,
      'gest30': gest31,
      'gest31': gest31,
    });
    return;
}

//Class to customize. I added only 3 fields for now
Future updateUserData (String gest01, String gest02, String gest03) async {
  final CollectionReference gesture = FirebaseFirestore.instance.collection('Gestures');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  await gesture.doc(uid).update({
    'gest01': gest01,
    'gest02': gest02,
    'gest03': gest03,
  });
  return;
}
