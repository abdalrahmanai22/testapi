import 'package:flutter/material.dart';

class Request extends StatelessWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Request",
        style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
      )),
    );
  }
}
