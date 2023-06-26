import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/service/auth_services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String message = "";
  Color containerColor = Colors.white;

  checkAuth() async {
    AuthServices.auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "main");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'signUp',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ).tr()),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'fullName'.tr(),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'email'.tr(),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'password'.tr(),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      obscureText: true,
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'confirmPassword'.tr(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    padding: const EdgeInsets.only(
                        right: 5, left: 5, top: 3, bottom: 3),
                    color: containerColor,
                    width: 500,
                    alignment: Alignment.centerLeft,
                    child: Text(message,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: 50,
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text(
                          'signUp',
                          style: TextStyle(fontSize: 18),
                        ).tr(),
                        onPressed: () async {
                          if (fullNameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty &&
                              confirmPasswordController.text.isNotEmpty) {
                            if (EmailValidator.validate(emailController.text)) {
                              if (passwordController.text.length > 8) {
                                if (passwordController.text ==
                                    confirmPasswordController.text) {
                                  User? user = await AuthServices.signUp(
                                      fullNameController.text,
                                      emailController.text,
                                      passwordController.text);
                                  if (user != null) {
                                    setState(() {
                                      message = "";
                                      containerColor = Colors.white;
                                    });
                                  } else {
                                    setState(() {
                                      message = "useralreadyexists".tr();
                                      containerColor = Colors.red[100]!;
                                    });
                                  }
                                } else {
                                  setState(() {
                                    message = "passwordmustbesame".tr();
                                    containerColor = Colors.red[100]!;
                                  });
                                }
                              } else {
                                setState(() {
                                  message =
                                      "passwordmustbeatleast8characters".tr();
                                  containerColor = Colors.red[100]!;
                                });
                              }
                            } else {
                              setState(() {
                                message = "emailnotvalid".tr();
                                containerColor = Colors.red[100]!;
                              });
                            }
                          } else {
                            setState(() {
                              message = "pleasecompleteallrequiredfields".tr();
                              containerColor = Colors.red[100]!;
                            });
                          }
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('alreadyhaveaccount').tr(),
                      TextButton(
                        child: const Text(
                          'signIn',
                          style: TextStyle(fontSize: 20),
                        ).tr(),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "login");
                        },
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
