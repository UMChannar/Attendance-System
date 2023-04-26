import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileInfo {
  final String name;
  final String className;
  final String rollNo;

  ProfileInfo({
    required this.name,
    required this.className,
    required this.rollNo,
  });
}

FutureBuilder<DocumentSnapshot<Map<String, dynamic>>> profileInfo() {
  final user = FirebaseAuth.instance.currentUser;

  return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
    future: FirebaseFirestore.instance.collection('users').doc(user?.uid).get(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (snapshot.hasError) {
        return Center(
          child: Text('Error: ${snapshot.error}'),
        );
      }

      final data = snapshot.data!.data();

      final name = data!['name'] as String?;
      final className = data['class'] as String?;
      final rollNo = data['rollno'].toString();

      return FutureBuilder<ProfileInfo>(
        future: Future.value(ProfileInfo(
          name: name ?? '',
          className: className ?? '',
          rollNo: rollNo ?? '',
        )),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return snapshot.hasData
              ? newMethod(snapshot.data!)
              : const Center(
                  child: Text('Error: Could not load profile.'),
                );
        },
      );
    },
  );
}

Widget newMethod(ProfileInfo profileInfo) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Name: ${profileInfo.name}',
        style: const TextStyle(fontSize: 20),
      ),
      const SizedBox(height: 10),
      Text(
        'Class: ${profileInfo.className}',
        style: const TextStyle(fontSize: 20),
      ),
      const SizedBox(height: 10),
      Text(
        'Roll No: ${profileInfo.rollNo}',
        style: const TextStyle(fontSize: 20),
      ),
    ],
  );
}
