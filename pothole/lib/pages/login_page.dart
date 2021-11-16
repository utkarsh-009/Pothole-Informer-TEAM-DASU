// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pothole/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 248, 245, 1),
      body: SingleChildScrollView(
        child: Stack(children: [
          ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              color: Colors.white,
              height: width(context) * 0.8,
              width: MediaQuery.of(context).size.width,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Color.fromRGBO(0, 0, 0, 0.7),
                  BlendMode.darken,
                ),
                child: Image.asset(
                  "assets/images/road_login.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: width(context) * 0.8,
                  child: Center(
                    child: Text(
                      "Pothole Informer",
                      textScaleFactor: width(context) / 160,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 240, 0.8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Form(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 32, right: 32, bottom: 100),
                    child: Column(
                      children: [
                        Text(
                          "Login",
                          textScaleFactor: 2.5,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              label: Text("Username"),
                              hintText: "Enter your username"),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              label: Text("Mobile number"),
                              hintText: "Enter your mobile number"),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("Password"),
                            hintText: "Enter your password",
                          ),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(150, 50)),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(85, 85, 85, 1)),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MyRoutes.userHomeRoute);
                          },
                          child: Text("Submit"),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
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
