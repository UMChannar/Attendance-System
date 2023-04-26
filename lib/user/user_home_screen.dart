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
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(
              //   context,
              //   UserProfileScreen.routeName,
              // );
            },
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'User',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 30,
                ),
          ),
        ),
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
