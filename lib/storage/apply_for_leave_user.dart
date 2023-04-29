import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> applyLeave(String leave, BuildContext context) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return;
  }

  final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
  final userDoc = await userRef.get();

  if (userDoc.exists) {
    final currentDate = DateTime.now().toLocal().toString().substring(0, 10);
    final leaveRef = userRef.collection('leave');
    final leaveQuery = await leaveRef
        .where('date', isEqualTo: currentDate)
        .where('Leave', isEqualTo: 'Accepted')
        .get();
    final leaveNotQuery = await leaveRef
        .where('date', isEqualTo: currentDate)
        .where('Leave', isEqualTo: 'leave')
        .get();
    if (leaveQuery.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Leave Accepted'),
          duration: Duration(seconds: 1),
        ),
      );
      return;
    } else if (leaveNotQuery.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Already Applied for leave'),
          duration: Duration(seconds: 1),
        ),
      );
      return;
    } else {
      await leaveRef.doc().set(
        {
          'date': currentDate,
          'Leave': leave,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Applied For Leave'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }
}

Future<void> applyForLeave(String leave, BuildContext context) async {
  try {
    await applyLeave(leave, context);
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
