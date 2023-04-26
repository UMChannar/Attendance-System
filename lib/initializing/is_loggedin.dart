import 'package:attendence_management/admin/admin_home_screen.dart';
import 'package:attendence_management/auth/auth.dart';
import 'package:attendence_management/initializing/auth_screen.dart';
import 'package:attendence_management/user/user_home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IsLoggedIn extends StatefulWidget {
  static String routeName = '/isLoggedin';

  const IsLoggedIn({Key? key}) : super(key: key);

  @override
  State<IsLoggedIn> createState() => _IsLoggedInState();
}

class _IsLoggedInState extends State<IsLoggedIn> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String uid = snapshot.data!.uid;
          return FutureBuilder<DocumentSnapshot>(
            future:
                FirebaseFirestore.instance.collection('users').doc(uid).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                bool isAdmin = snapshot.data!.get('isAdmin');
                if (isAdmin) {
                  return const AdminHomeScreen();
                } else if (!isAdmin) {
                  return const UserHomeScreen();
                }
              }
              return Scaffold(
                body: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/appLogo.png',
                      ),
                    ),
                    const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                        strokeWidth: 9,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const AuthScreen();
        }
      },
    );
  }
}
