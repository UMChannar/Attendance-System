import 'package:attendence_management/storage/register_user.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String routeName = '/regScreen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController regNController = TextEditingController();
  bool obsecurePass = true;
  final formKey = GlobalKey<FormState>();

  Widget visibiltyIcon() {
    return obsecurePass
        ? const Icon(
            Icons.visibility,
          )
        : const Icon(
            Icons.visibility_off,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/appLogo.png',
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: usernameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 6,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                          hintText: 'Email',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: const Color.fromRGBO(
                                      0,
                                      0,
                                      0,
                                      0.6,
                                    ),
                                  ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 6,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                          hintText: 'Your Name',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: const Color.fromRGBO(
                                      0,
                                      0,
                                      0,
                                      0.6,
                                    ),
                                  ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: classController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 6,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                          hintText: 'Your Class',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: const Color.fromRGBO(
                                      0,
                                      0,
                                      0,
                                      0.6,
                                    ),
                                  ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your class';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: regNController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 6,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                          hintText: 'Your Registration',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: const Color.fromRGBO(
                                      0,
                                      0,
                                      0,
                                      0.6,
                                    ),
                                  ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your registration';
                          } else {
                            final validPattern = RegExp(r'^[1-9]|10$');
                            if (!validPattern.hasMatch(value)) {
                              return 'Please enter a valid class number from 1 to 10';
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: obsecurePass,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  obsecurePass = !obsecurePass;
                                },
                              );
                            },
                            icon: visibiltyIcon(),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 6,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                          hintText: 'Password',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: const Color.fromRGBO(
                                      0,
                                      0,
                                      0,
                                      0.6,
                                    ),
                                  ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          register(
                            formKey,
                            context,
                            usernameController,
                            passwordController,
                            nameController,
                            classController,
                            regNController,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'SignUp',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigator.pushNamedAndRemoveUntil(
                          //   context,
                          //   LoginScreen.routeName,
                          //   (route) => false,
                          // );
                        },
                        child: Text(
                          'Login',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
