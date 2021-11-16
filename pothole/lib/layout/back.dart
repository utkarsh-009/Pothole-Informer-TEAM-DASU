// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'custom_clippers.dart';

class HomeBack extends StatelessWidget {
  const HomeBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomWaveClipper(),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 1.4,
        width: MediaQuery.of(context).size.width,
        //color: Color.fromRGBO(32, 24, 11, 1),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Color.fromRGBO(0, 0, 0, 0.55),
            BlendMode.darken,
          ),
          child: Image.asset(
            "assets/images/BackGround.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
