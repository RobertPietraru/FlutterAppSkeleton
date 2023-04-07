import 'package:flutter/material.dart';

class NotFound404Screen extends StatelessWidget {
  const NotFound404Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        Text(
          "¯\\_(ツ)_/¯",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text("Not found - 404")
      ]),
    );
  }
}
