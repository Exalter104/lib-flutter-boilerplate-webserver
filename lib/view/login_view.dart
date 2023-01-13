import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_webserver/utils/components/utils.dart';
import 'package:flutter_boilerplate_webserver/utils/routes/routes_name.dart';
import 'package:flutter_boilerplate_webserver/view_model/auth_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: const Color.fromARGB(255, 195, 195, 195),
        body: SafeArea(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/logo-red-1000.png",
                    width: 150,
                    height: 130,

                    // fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back Exalter!",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Please, Log In",
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
                            controller: emailController,
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
                              keyboardType: TextInputType.visiblePassword,
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
                        loading:
                        authViewModel.loading;
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
                            "Sign In",
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
                        "Not an Exalter?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesNames.signUp);
                        },
                        child: const Text(
                          " Sign Up",
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
    // return Scaffold(
    //   body: Container(
    //     decoration: const BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage('images/carousel-02.jpg'),
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     constraints: const BoxConstraints.expand(),
    //     child: SafeArea(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           Image.asset(
    //             "images/logo-red-1000.png",
    //             width: 150,
    //             height: 130,

    //             // fit: BoxFit.contain,
    //           ),
    //           const SizedBox(
    //             height: 20,
    //             width: 300,
    //             child: Center(
    //                 child: Text(
    //               "Wellcome Back Exalter!",
    //               style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
    //             )),
    //           ),
    //           Container(
    //             height: 60,
    //             width: 400,
    //             padding:
    //                 const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
    //             child: const Center(
    //                 child: Text(
    //               "Please, Log In.",
    //               style: TextStyle(color: AppColors.whiteColor, fontSize: 42),
    //             )),
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           Container(
    //             height: 70,
    //             width: 380,
    //             padding: const EdgeInsets.all(05),
    //             child: TextField(
    //               keyboardType: TextInputType.emailAddress,
    //               focusNode: emailFocusNode,
    //               onSubmitted: (valu) {
    //                 Utils.feildFocusChange(
    //                     context, emailFocusNode, passwordFocusNode);
    //               },
    //               controller: emailController,
    //               style: const TextStyle(
    //                 color: Colors.black,
    //               ),
    //               decoration: const InputDecoration(
    //                 filled: true,
    //                 fillColor: Colors.white,
    //                 hintText: 'Email',
    //                 prefixIcon: Icon(Icons.email_outlined),
    //                 hintStyle: TextStyle(color: Colors.grey),
    //                 border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(
    //                     Radius.circular(40.0),
    //                   ),
    //                   borderSide: BorderSide.none,
    //                 ),
    //               ),
    //             ),
    //           ),
    //           ValueListenableBuilder(
    //               valueListenable: _obsecurePassword,
    //               builder: (context, value, child) {
    //                 return Container(
    //                   height: 70,
    //                   width: 380,
    //                   padding: const EdgeInsets.all(05),
    //                   child: TextField(
    //                     controller: passwordController,
    //                     style: const TextStyle(
    //                       color: Colors.black,
    //                     ),
    //                     obscureText: _obsecurePassword.value,
    //                     obscuringCharacter: "*",
    //                     decoration: InputDecoration(
    //                       hintText: "Password",
    //                       prefixIcon: const Icon(Icons.key_rounded),
    //                       filled: true,
    //                       fillColor: Colors.white,
    //                       hintStyle: const TextStyle(color: Colors.grey),
    //                       border: const OutlineInputBorder(
    //                         borderRadius: BorderRadius.all(
    //                           Radius.circular(40.0),
    //                         ),
    //                         borderSide: BorderSide.none,
    //                       ),
    //                       suffixIcon: InkWell(
    //                           onTap: () {
    //                             _obsecurePassword.value =
    //                                 !_obsecurePassword.value;
    //                           },
    //                           child: Icon(_obsecurePassword.value
    //                               ? Icons.visibility_off_outlined
    //                               : Icons.visibility_outlined)),
    //                     ),
    //                   ),
    //                 );
    //               }),
    //           // const SizedBox(
    //           //   height: 10,
    //           // ),
    //           Container(
    //               height: 80,
    //               width: 380,
    //               padding: const EdgeInsets.all(10),
    //               child: MyButton(
    //                 title: "Log In",
    //                 fontsize: 16,
    //                 loading: authViewModel.loading,
    //                 onPress: () {
    //                   if (emailController.text.isEmpty) {
    //                     Utils.flushBarErrorMessage(
    //                         "Please Enter your Email", context);
    //                   } else if (passwordController.text.isEmpty) {
    //                     Utils.flushBarErrorMessage(
    //                         "Please Enter your Password", context);
    //                   } else if (passwordController.text.length < 6) {
    //                     Utils.flushBarErrorMessage(
    //                         "Please Enter 6 digit Password", context);
    //                   } else {
    //                     Map data = {
    //                       "email": emailController.text.toString(),
    //                       "password": passwordController.text.toString(),
    //                     };
    //                     authViewModel.loginApi(data, context);

    //                     print("Api Hit");
    //                   }
    //                 },
    //               )),
    //           const SizedBox(
    //             height: 20,
    //             width: 400,
    //             child: Center(
    //                 child: Text(
    //               "..............................or.................................",
    //               style: TextStyle(color: AppColors.whiteColor, fontSize: 22),
    //             )),
    //           ),
    //           Container(
    //             height: 80,
    //             width: 380,
    //             padding: const EdgeInsets.all(10),
    //             child: MyButton(
    //                 title: "Create an Account",
    //                 fontsize: 16,
    //                 onPress: () {
    //                   Navigator.pushNamed(context, RoutesNames.signUp);
    //                 }),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
