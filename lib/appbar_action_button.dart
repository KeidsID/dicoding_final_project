import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

class AppBarActionButton extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final VoidCallback onPressed;
  final String text;

  const AppBarActionButton(
      {Key? key,
      required this.margin,
      required this.onPressed,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // margin
      padding: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(30, 30, 30, 1),
          shadowColor: Colors.white,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
