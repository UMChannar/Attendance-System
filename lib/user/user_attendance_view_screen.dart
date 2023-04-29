import 'package:attendence_management/storage/view_attendance_user.dart';
import 'package:flutter/material.dart';

class ViewAttendanceUser extends StatefulWidget {
  static String routeName = '/viewAttendance';

  const ViewAttendanceUser({Key? key}) : super(key: key);

  @override
  State<ViewAttendanceUser> createState() => _ViewAttendanceUserState();
}

class _ViewAttendanceUserState extends State<ViewAttendanceUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Attendence Record',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 30,
                ),
          ),
        ),
      ),
      body: viewAttendance(),
    );
  }
}
