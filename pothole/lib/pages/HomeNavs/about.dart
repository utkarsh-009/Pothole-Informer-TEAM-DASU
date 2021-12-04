// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Text(
          "About",
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
