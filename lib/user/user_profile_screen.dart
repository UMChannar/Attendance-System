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
      body: profileInfo(),
    );
  }
}
