import 'package:attendence_management/admin/admin_home_screen.dart';
import 'package:attendence_management/initializing/auth_screen.dart';
import 'package:attendence_management/user/user_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
    bool isAdmin,
    String name,
    String classs,
    int rollno,
  ) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set(
      {
        'isAdmin': isAdmin,
        'name': name,
        'class': classs,
        'rollno': rollno,
      },
    );
  }

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .get();

    bool isAdmin = userSnapshot.get('isAdmin');
    if (isAdmin) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AdminHomeScreen.routeName,
        (route) => false,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserHomeScreen.routeName,
        (route) => false,
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    firebaseAuth.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      AuthScreen.routeName,
      (route) => false,
    );
  }
}
