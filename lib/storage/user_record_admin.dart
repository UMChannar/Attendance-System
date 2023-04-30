import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FutureBuilder<QuerySnapshot<Map<String, dynamic>>> userRecord() {
  return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
    future: FirebaseFirestore.instance
        .collection('users')
        .where('isAdmin', isEqualTo: false)
        .get(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Center(
          child: Text(
            'Error: ${snapshot.error}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        );
      }
      final docs = snapshot.data!.docs;
      return dataTable(docs, context);
    },
  );
}

Widget dataTable(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs,
    BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey),
        columnSpacing: MediaQuery.of(context).size.width * .1,
        columns: [
          DataColumn(
            label: Text(
              'Name',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          DataColumn(
            label: Text(
              'Class',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          DataColumn(
            label: Text(
              'Roll Number',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
        rows: List.generate(docs.length, (index) {
          final data = docs[index].data();
          final uid = docs[index].reference.id.toString();
          final name = data['name'] as String? ?? '';
          final classs = data['class'] as String? ?? '';
          final regNo = data['rollno'] ?? '';
          return DataRow(cells: [
            DataCell(
              GestureDetector(
                onTap: () {},
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            DataCell(
              Text(
                classs,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            DataCell(
              Text(
                regNo.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ]);
        }),
      ),
    ),
  );
}
