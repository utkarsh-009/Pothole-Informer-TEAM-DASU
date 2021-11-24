// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pothole_informer/pages/HomeNavs/Inform/form.dart';
import 'package:pothole_informer/widgets/Home/navigation_bar.dart';

class InformPage extends StatelessWidget {
  const InformPage({Key? key}) : super(key: key);
  double width(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                color: Colors.white,
                height: width(context) * 1.35,
                width: MediaQuery.of(context).size.width,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 0.4),
                    BlendMode.darken,
                  ),
                  child: Image.asset(
                    "assets/images/inform_background.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(child: FormPage()),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          currentIndex: 1,
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

/*
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
*/