import 'package:flutter/material.dart';

class Assets extends StatelessWidget {
  const Assets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Assets",
        style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
      )),
    );
  }
}
