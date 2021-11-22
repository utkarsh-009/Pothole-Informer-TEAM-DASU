// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pothole_informer/widgets/Home/navigation_bar.dart';

class InformPage extends StatelessWidget {
  const InformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text(
          "Inform page",
          textScaleFactor: 2,
        ),
        bottomNavigationBar: NavigationBar(
          currentIndex: 1,
        ),
      ),
    );
  }
}
