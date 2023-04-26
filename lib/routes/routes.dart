import 'package:attendence_management/admin/admin_home_screen.dart';
import 'package:attendence_management/common/login_screen.dart';
import 'package:attendence_management/common/registration_screen.dart';
import 'package:attendence_management/initializing/auth_screen.dart';
import 'package:attendence_management/initializing/is_loggedin.dart';
import 'package:attendence_management/user/user_home_screen.dart';
import 'package:attendence_management/user/user_profile_screen.dart';
import 'package:flutter/material.dart';

var customRoutes = <String, WidgetBuilder>{
  AuthScreen.routeName: (context) => const AuthScreen(),
  RegistrationScreen.routeName: (context) => const RegistrationScreen(),
  UserHomeScreen.routeName: (context) => const UserHomeScreen(),
  AdminHomeScreen.routeName: (context) => const AdminHomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  IsLoggedIn.routeName: (context) => const IsLoggedIn(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};
