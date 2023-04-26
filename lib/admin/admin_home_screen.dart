import 'package:attendence_management/auth/auth.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  static String routeName = '/adminHomeScreen';

  const AdminHomeScreen({Key? key}) : super(key: key);

  Future<void> signOut(BuildContext context) async {
    await Auth().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Works'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          signOut(context);
        },
        child: Text('SignOut'),
      )),
    );
  }
}
