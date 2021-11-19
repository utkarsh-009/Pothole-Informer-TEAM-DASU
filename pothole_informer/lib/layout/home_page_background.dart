// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Color.fromRGBO(0, 0, 0, 0.6),
          BlendMode.darken,
        ),
        child: Image.network(
          //"https://media.gettyimages.com/photos/pot-hole-picture-id172668923?s=612x612",
          "https://wallpaperaccess.com/full/3895612.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
