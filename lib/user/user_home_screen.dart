import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  static String routeName = '/userHomeScreen';

  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('It Works'),
      ),
    );
  }
}
