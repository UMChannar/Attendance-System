import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> Attendece(String atten, BuildContext context) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return;
  }

  final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
  final userDoc = await userRef.get();

  if (userDoc.exists) {
    final currentDate = DateTime.now().toLocal().toString().substring(0, 10);
    final attendanceRef = userRef.collection('attendances');
    final attendanceQuery =
        await attendanceRef.where('date', isEqualTo: currentDate).get();
    if (attendanceQuery.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Attendance Already Marked'),
          duration: Duration(seconds: 1),
        ),
      );
      return;
    } else {
      await attendanceRef.doc().set(
        {
          'date': currentDate,
          'attendance': atten,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Attendance Marked'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }
}

Future<void> markAttendence(String atten, BuildContext context) async {
  try {
    await Attendece(atten, context);
  } on FirebaseException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(e.message!),
      ),
    );
    Navigator.pop(context);
  }
}
