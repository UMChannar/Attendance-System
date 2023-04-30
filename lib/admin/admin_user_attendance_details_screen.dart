import 'package:attendence_management/storage/attendance_record_admin.dart';
import 'package:flutter/material.dart';

class AdminUserAttenDetailsScreen extends StatefulWidget {
  static String routeName = '/adminUserDetailsScreen';

  const AdminUserAttenDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AdminUserAttenDetailsScreen> createState() =>
      _AdminUserAttenDetailsScreenState();
}

class _AdminUserAttenDetailsScreenState
    extends State<AdminUserAttenDetailsScreen> {
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
    final args = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'User Details Screen',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 30,
                ),
          ),
        ),
      ),
      body: viewAttendanceRecord(args),
    );
  }
}
