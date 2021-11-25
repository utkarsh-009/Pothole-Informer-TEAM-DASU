import 'package:flutter/material.dart';
import 'package:pothole/layout/custom_clippers.dart';
import 'package:pothole/pages/HomeNavs/Inform/form.dart';

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
      ),
    );
  }
}
