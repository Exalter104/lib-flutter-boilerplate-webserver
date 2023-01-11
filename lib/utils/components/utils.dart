import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate_webserver/res/colors/colors.dart';
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

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          icon: const Icon(
            Icons.error_outline,
            color: AppColors.redColor,
            size: 34,
          ),
          title: "Exarth Login",
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.all(16),
          borderRadius: BorderRadius.circular(22),
          positionOffset: 20,
          reverseAnimationCurve: Curves.easeInOut,
          backgroundColor: const Color(0xff000000),
          titleColor: const Color(0xffffffff),
          messageColor: const Color(0xffffffff),
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }

  // static snackbar(String message, BuildContext context){
  //   return ScaffoldMessenger.of(context showsna)
  // }
}
