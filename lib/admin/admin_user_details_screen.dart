import 'package:attendence_management/admin/admin_user_atten_screen.dart';
import 'package:attendence_management/storage/attendance_record_admin.dart';
import 'package:flutter/material.dart';

class AdminUserDetailsScreen extends StatefulWidget {
  static String routeName = '/adminUserDetailsScreen';

  const AdminUserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AdminUserDetailsScreen> createState() => _AdminUserDetailsScreenState();
}

class _AdminUserDetailsScreenState extends State<AdminUserDetailsScreen> {
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
    String args = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'User Details',
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
              Navigator.pushNamed(
                context,
                AdminViewAttendanceUser.routeName,
                arguments: args,
              );
            }, 'Attendance record', context),
            button(() {}, 'Leave Status', context),
            button(() {}, 'Delete User', context),
          ],
        ),
      ),
    );
  }
}
