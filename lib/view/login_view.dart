import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_webserver/res/buttons/round_buttons.dart';
import 'package:flutter_boilerplate_webserver/utils/components/utils.dart';
import 'package:flutter_boilerplate_webserver/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            onFieldSubmitted: (valu) {
              Utils.feildFocusChange(
                  context, emailFocusNode, passwordFocusNode);
            },
            decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Email",
                prefixIcon: Icon(Icons.email_outlined)),
          ),
          ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                    controller: passwordController,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: "*",
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        labelText: "password",
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined))));
              }),
          const SizedBox(
            height: 20,
          ),
          MyButton(
              title: "Login",
              fontsize: 19,
              loading: true,
              onPress: () {
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
              })
        ],
      ),
    );
  }
}
