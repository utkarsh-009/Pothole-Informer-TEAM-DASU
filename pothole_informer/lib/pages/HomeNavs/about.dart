import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("About",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
