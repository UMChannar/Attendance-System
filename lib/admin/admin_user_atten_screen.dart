import 'package:attendence_management/storage/attendance_record_admin.dart';
import 'package:flutter/material.dart';

class AdminViewAttendanceUser extends StatefulWidget {
  static String routeName = '/adminViewAttendance';

  const AdminViewAttendanceUser({Key? key}) : super(key: key);

  @override
  State<AdminViewAttendanceUser> createState() =>
      _AdminViewAttendanceUserState();
}

class _AdminViewAttendanceUserState extends State<AdminViewAttendanceUser> {
  @override
  Widget build(BuildContext context) {
    String args = ModalRoute.of(context)!.settings.arguments.toString();
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
      // body: Center(
      //   child: Text(args),
      // ),
      body: viewAttendanceRecord(args),
    );
  }
}
