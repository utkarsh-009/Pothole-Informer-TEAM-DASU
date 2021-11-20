// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Text(
          "Stats",
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
