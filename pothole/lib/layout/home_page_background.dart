// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'custom_clippers.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomWaveClipper(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.2,
        width: MediaQuery.of(context).size.width,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Color.fromRGBO(0, 0, 0, 0.55),
            BlendMode.darken,
          ),
          child: Image.network(
            "https://wallpaperaccess.com/full/3895612.jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
