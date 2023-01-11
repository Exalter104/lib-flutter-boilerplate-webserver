// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final bool loading;
  final double fontsize;
  final VoidCallback onPress;

  const MyButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.fontsize,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 55,
        width: 200,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 68, 154, 115),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(31, 255, 255, 255),
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0), fontSize: fontsize),
        )),
      ),
    );
  }
}
