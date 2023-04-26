import 'package:attendence_management/initializing/auth_screen.dart';
import 'package:flutter/material.dart';

var customRoutes = <String,WidgetBuilder>{
  AuthScreen.routeName: (context) => const AuthScreen(),
};