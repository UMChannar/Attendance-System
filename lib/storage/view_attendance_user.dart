import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

late Stream<QuerySnapshot<Map<String, dynamic>>> attendanceStream;

StreamBuilder<QuerySnapshot<Map<String, dynamic>>> viewAttendance() {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    attendanceStream = userRef
        .collection('attendances')
        .orderBy('date', descending: false)
        .snapshots();
  } else {
    attendanceStream = const Stream.empty();
  }
  return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    stream: attendanceStream,
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(child: CircularProgressIndicator());
      }
      final docs = snapshot.data!.docs;
      if (docs.isEmpty) {
        return const Center(child: Text('No attendance records found'));
      }
      return newMethod1(docs);
    },
  );
}

Center newMethod1(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
  return Center(
    child: DataTable(
      columns: const [
        DataColumn(
          label: Text(
            'Date',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Attendance',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: docs
          .map((doc) => DataRow(
                cells: <DataCell>[
                  DataCell(Text(doc['date'])),
                  DataCell(Text(doc['attendance'])),
                ],
              ))
          .toList(),
    ),
  );
}
