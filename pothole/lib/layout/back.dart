// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeBack extends StatelessWidget {
  const HomeBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomWaveClipper(),
      child: Container(
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

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var height = size.height - 20;
    path.lineTo(0.0, height - 20);

    var firstControlPoint = Offset(size.width / 4, height);
    var firstEndPoint = Offset(size.width / 2.25, height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), height - 65);
    var secondEndPoint = Offset(size.width, height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
