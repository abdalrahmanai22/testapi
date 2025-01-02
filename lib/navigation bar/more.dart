import 'package:flutter/material.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "More",
        style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
      )),
    );
  }
}
