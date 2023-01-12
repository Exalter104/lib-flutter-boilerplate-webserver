import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void feildFocusChange(
      BuildContext context, FocusNode current, FocusNode nextfocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static toastMessage(
    String message,
  ) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: const Color(0xff0000000),
        textColor: const Color(0xffffffff));
  }

  static Text(
    String text,
    FontWeight fontWeight,
  ) {
    Text(text, fontWeight);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          // icon: const Icon(
          //   Icons.error_outline,
          //   color: Color.fromARGB(255, 0, 129, 24),
          //   size: 34,
          // ),
          title: "Exarth Login",
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.all(16),
          borderRadius: BorderRadius.circular(22),
          positionOffset: 20,
          reverseAnimationCurve: Curves.easeInOut,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          titleColor: const Color.fromARGB(255, 0, 0, 0),
          messageColor: const Color.fromARGB(255, 0, 0, 0),
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }

  // static snackbar(String message, BuildContext context){
  //   return ScaffoldMessenger.of(context showsna)
  // }

}
