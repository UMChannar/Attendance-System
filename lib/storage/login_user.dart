import 'package:attendence_management/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> login(
  GlobalKey<FormState> formKey,
  BuildContext context,
  TextEditingController user,
  TextEditingController pass,
) async {
  if (!formKey.currentState!.validate()) {
    return;
  }
  try {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    await Auth().signInWithEmailAndPassword(
      user.text,
      pass.text,
      context,
    );
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(e.message!),
      ),
    );
    Navigator.pop(context);
  }
}
