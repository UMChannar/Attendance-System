import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static String routeName = '/authScreen';

  const AuthScreen({Key? key}) : super(key: key);

  Widget button(
    BuildContext context,
    VoidCallback func,
    String text,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: func,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/appLogo.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            button(
              context,
              () {},
              'Login',
            ),
            const SizedBox(
              height: 10,
            ),
            button(
              context,
              () {},
              'SignUp',
            ),
          ],
        ),
      ),
    );
  }
}
