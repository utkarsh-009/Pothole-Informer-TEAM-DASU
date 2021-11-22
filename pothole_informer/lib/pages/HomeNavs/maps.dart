// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pothole_informer/widgets/Home/navigation_bar.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text(
          "Maps",
          textScaleFactor: 2,
        ),
        bottomNavigationBar: NavigationBar(
          currentIndex: 2,
        ),
      ),
    );
  }
}
