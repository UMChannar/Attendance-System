import 'package:attendence_management/auth/auth.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  static String routeName = '/userHomeScreen';

  const UserHomeScreen({Key? key}) : super(key: key);

  Future<void> signOut(BuildContext context) async {
    await Auth().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Works'),
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
