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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/mobile-bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/logo-red-1000.png",
                width: 150,
                height: 200,

                // fit: BoxFit.contain,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  onSubmitted: (valu) {
                    Utils.feildFocusChange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                  controller: emailController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'login',
                    prefixIcon: Icon(Icons.email_outlined),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextField(
                  controller: passwordController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  // obscuringCharacter: "*",
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: Icon(_obsecurePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined)),
                  ),
                ),
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
        ),
      ),
    );
    // return Scaffold(
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       TextFormField(
    //         validator: (value) {
    //           if (value!.isEmpty) {
    //             return 'Email is required';
    //           }
    //           return null;
    //         },
    //         controller: emailController,
    //         keyboardType: TextInputType.emailAddress,
    //         focusNode: emailFocusNode,
    //         onFieldSubmitted: (valu) {
    //           Utils.feildFocusChange(
    //               context, emailFocusNode, passwordFocusNode);
    //         },
    //         decoration: const InputDecoration(
    //             labelText: "Email",
    //             hintText: "Email",
    //             prefixIcon: Icon(Icons.email_outlined)),
    //       ),
    //       ValueListenableBuilder(
    //           valueListenable: _obsecurePassword,
    //           builder: (context, value, child) {
    //             return TextFormField(
    //                 controller: passwordController,
    //                 obscureText: _obsecurePassword.value,
    //                 obscuringCharacter: "*",
    //                 focusNode: passwordFocusNode,
    //                 decoration: InputDecoration(
    //                     hintText: "Password",
    //                     prefixIcon: const Icon(Icons.lock_outline),
    //                     labelText: "password",
    //                     suffixIcon: InkWell(
    //                         onTap: () {
    //                           _obsecurePassword.value =
    //                               !_obsecurePassword.value;
    //                         },
    //                         child: Icon(_obsecurePassword.value
    //                             ? Icons.visibility_off_outlined
    //                             : Icons.visibility_outlined))));
    //           }),
    //       const SizedBox(
    //         height: 20,
    //       ),
    // MyButton(
    //     title: "Login",
    //     fontsize: 19,
    //     loading: true,
    //     onPress: () {
    //       if (emailController.text.isEmpty) {
    //         Utils.flushBarErrorMessage(
    //             "Please Enter your Email", context);
    //       } else if (passwordController.text.isEmpty) {
    //         Utils.flushBarErrorMessage(
    //             "Please Enter your Password", context);
    //       } else if (passwordController.text.length < 6) {
    //         Utils.flushBarErrorMessage(
    //             "Please Enter 6 digit Password", context);
    //       } else {
    //         Map data = {
    //           "email": emailController.text.toString(),
    //           "password": passwordController.text.toString(),
    //         };
    //         authViewModel.loginApi(data, context);

    //         print("Api Hit");
    //       }
    //     })
    //     ],
    //   ),
    // );
  }
}
