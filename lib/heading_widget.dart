import 'package:flutter/material.dart';

class HeadingContainer extends StatelessWidget {
  final String title;

  const HeadingContainer(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(235, 192, 128, 1),
            width: 2.5,
          ),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
