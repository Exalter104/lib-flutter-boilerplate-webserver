// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_webserver/utils/components/utils.dart';
import 'package:flutter_boilerplate_webserver/utils/routes/routes_name.dart';
import 'package:flutter_boilerplate_webserver/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 195, 195, 195),
        body: SafeArea(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hi Exalter!",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Lets Get Started",
                    style: TextStyle(
                      color: Color.fromARGB(255, 28, 28, 28),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: TextField(
                            onSubmitted: (valu) {
                              Utils.feildFocusChange(
                                  context, emailFocusNode, passwordFocusNode);
                            },
                            keyboardType: TextInputType.emailAddress,
                            focusNode: emailFocusNode,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                prefixIcon: Icon(Icons.email)),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: TextField(
                            onSubmitted: (valu) {
                              Utils.feildFocusChange(
                                  context, emailFocusNode, passwordFocusNode);
                            },
                            keyboardType: TextInputType.emailAddress,
                            focusNode: emailFocusNode,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone Number",
                                prefixIcon: Icon(Icons.email)),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: ValueListenableBuilder(
                      valueListenable: _obsecurePassword,
                      builder: (context, value, child) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: TextField(
                              obscureText: _obsecurePassword.value,
                              controller: passwordController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                prefixIcon: const Icon(Icons.key_rounded),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      _obsecurePassword.value =
                                          !_obsecurePassword.value;
                                    },
                                    child: Icon(_obsecurePassword.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: InkWell(
                      onTap: () {
                        if (emailController.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              "Please Enter your Email", context);
                        } else if (passwordController.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              "Please Enter your Password", context);
                        } else if (passwordController.text.length < 6) {
                          Utils.flushBarErrorMessage(
                              "Please Enter 6 digit Password", context);
                        } else {
                          Map data = {
                            "email": emailController.text.toString(),
                            "password": passwordController.text.toString(),
                          };
                          authViewModel.loginApi(data, context);

                          print("Api Hit");
                        }
                      },
                      child: Container(
                        width: 400,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Alerady an Exalter?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesNames.login);
                        },
                        child: const Text(
                          " Log In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
