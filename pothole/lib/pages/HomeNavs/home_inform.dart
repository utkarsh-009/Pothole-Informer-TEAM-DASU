// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InformPage extends StatelessWidget {
  const InformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Text(
          "Inform page",
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
