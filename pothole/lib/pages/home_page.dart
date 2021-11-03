// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pothole/widgets/GridWidgets/custom_grid.dart';

import '../widgets/home_header.dart';
import '../widgets/welcome_widget.dart';
import '../layout/home_page_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 241, 240, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            HomeBackground(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Homeheader(),
                WelcomeHome(),
                CustomGrid(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
