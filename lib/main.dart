import 'package:attendence_management/initializing/is_loggedin.dart';
import 'package:attendence_management/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendence App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey[100],
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue).copyWith(
          secondary: Colors.lightBlueAccent,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontFamily: 'Squada',
                fontSize: 25,
                color: Colors.black,
              ),
              labelMedium: const TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: 13,
                color: Colors.black,
              ),
              bodyLarge: const TextStyle(
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
              bodyMedium: const TextStyle(
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
      ),
      initialRoute: IsLoggedIn.routeName,
      routes: customRoutes,
    );
  }
}
