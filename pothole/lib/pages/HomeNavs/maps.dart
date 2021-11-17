// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Text(
          "Maps",
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
