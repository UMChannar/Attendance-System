import 'package:attendence_management/common/registration_screen.dart';
import 'package:attendence_management/initializing/auth_screen.dart';
import 'package:attendence_management/user/user_home_screen.dart';
import 'package:flutter/material.dart';

var customRoutes = <String, WidgetBuilder>{
  AuthScreen.routeName: (context) => const AuthScreen(),
  RegistrationScreen.routeName: (context) => const RegistrationScreen(),
  UserHomeScreen.routeName: (context) => const UserHomeScreen(),
};
