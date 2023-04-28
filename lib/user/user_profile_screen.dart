import 'package:attendence_management/storage/profile_info_user.dart';
import 'package:flutter/material.dart';

import '../auth/auth.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profileScreen';

  const ProfileScreen({Key? key}) : super(key: key);

  Future<void> signOut(BuildContext context) async {
    await Auth().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'User Profile',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 30,
                ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              profileInfo(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  signOut(context);
                },
                child: Text(
                  'SignOut',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
