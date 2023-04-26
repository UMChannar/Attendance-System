import 'package:attendence_management/auth/auth.dart';
import 'package:attendence_management/user/user_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> register(
  GlobalKey<FormState> formKey,
  BuildContext context,
  TextEditingController user,
  TextEditingController pass,
  TextEditingController name,
  TextEditingController classs,
  TextEditingController regNo,
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
    await Auth().registerWithEmailAndPassword(
      user.text,
      pass.text,
      false,
      name.text,
      classs.text,
      int.parse(regNo.text),
    );
    Navigator.pushNamedAndRemoveUntil(
      context,
      UserHomeScreen.routeName,
      (route) => false,
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
