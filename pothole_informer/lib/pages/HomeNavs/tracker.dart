import 'package:flutter/material.dart';

class Tracker extends StatelessWidget {
  const Tracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Tracker",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
