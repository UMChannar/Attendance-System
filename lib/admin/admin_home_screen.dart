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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          signOut(context);
        },
        label: Text(
          'SignOut',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        icon: const Icon(Icons.logout),
      ),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Admin',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 30,
                ),
          ),
        ),
      ),
    );
  }
}
