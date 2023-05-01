import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> leaveDecision(
    String leave, BuildContext context, String uid) async {
  final userRef = FirebaseFirestore.instance.collection('users').doc(uid);
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
    final leaveRejectedQuery = await leaveRef
        .where('date', isEqualTo: currentDate)
        .where('Leave', isEqualTo: 'Rejected')
        .get();

    if (leaveQuery.docs.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Leave Request Accepted'),
          content: const Text(
            'Leave Request has already been accepted',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else if (leaveNotQuery.docs.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Leave Request Received'),
          content: const Text(
            'Leave request received',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Accept',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              onPressed: () async {
                var aceeptQuery =
                    await leaveRef.where('date', isEqualTo: currentDate).get();
                if (aceeptQuery.docs.isNotEmpty) {
                  for (final doc in aceeptQuery.docs) {
                    try {
                      await doc.reference.set(
                        {'Leave': 'Accepted'},
                        SetOptions(
                          merge: true,
                        ),
                      );
                    } on FirebaseException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          content: Text(e.message!),
                        ),
                      );
                    }
                  }
                }
                Navigator.pop(context);
              },
            ),
            //  ------------------------------------------------------------------
            TextButton(
              child: const Text(
                'Reject',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () async {
                var aceeptQuery =
                    await leaveRef.where('date', isEqualTo: currentDate).get();
                if (aceeptQuery.docs.isNotEmpty) {
                  for (final doc in aceeptQuery.docs) {
                    try {
                      await doc.reference.set(
                        {'Leave': 'Rejected'},
                        SetOptions(
                          merge: true,
                        ),
                      );
                    } on FirebaseException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          content: Text(e.message!),
                        ),
                      );
                    }
                  }
                }
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    } else if (leaveRejectedQuery.docs.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Leave Request Rejected'),
          content: const Text(
            'Leave Request has already been rejected',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('No Leave Request'),
          content: const Text(
            'No leave request form student',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('User not found'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

Future<void> decisionForLeave(
    String leave, BuildContext context, String uid) async {
  try {
    await leaveDecision(leave, context, uid);
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
