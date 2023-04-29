import 'package:attendence_management/auth/auth.dart';
import 'package:attendence_management/storage/apply_for_leave_user.dart';
import 'package:attendence_management/storage/mark_attendance_user.dart';
import 'package:attendence_management/user/user_attendance_view_screen.dart';
import 'package:attendence_management/user/user_profile_screen.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  static String routeName = '/userHomeScreen';

  const UserHomeScreen({Key? key}) : super(key: key);

  Widget button(VoidCallback func, String text, BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: func,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                ProfileScreen.routeName,
              );
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            button(() {
              markAttendence(
                'Present',
                context,
              );
            }, 'Mark Attendance', context),
            const SizedBox(
              height: 10,
            ),
            button(() {
              Navigator.pushNamed(
                context,
                ViewAttendanceUser.routeName,
              );
            }, 'View Your Attendance', context),
            const SizedBox(
              height: 10,
            ),
            button(() {
              applyForLeave(
                'leave',
                context,
              );
            }, 'Apply for Leave', context),
          ],
        ),
      ),
    );
  }
}
