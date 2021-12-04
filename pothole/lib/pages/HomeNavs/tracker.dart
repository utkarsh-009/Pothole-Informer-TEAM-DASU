// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TrackerPage extends StatelessWidget {
  const TrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Text(
          "Tracker",
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
