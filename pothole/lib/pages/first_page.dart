// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pothole/layout/custom_clippers.dart';
import 'package:pothole/utils/themes.dart';
import '../utils/routes.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  bool changeButton = false;


  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          child: Stack(
            children: [
              ClipPath(
                clipper: BottomCurve(),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 0.55),
                    BlendMode.darken,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/images/firstpage_bg.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      Text(
                        "Welcome!",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.sora().fontFamily,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Choose the User Mode",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.sora().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Align(
                          child: Text(
                            "Press User Login To Inform Pothole!",
                            style: TextStyle(
                              fontSize: 20,
                              color: MyThemes.darkBluishColor.withBlue(90),
                              fontFamily: GoogleFonts.sora().fontFamily,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, MyRoutes.userPage),
                          child: Text(
                            "User Login",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: MyThemes.darkBluishColor.withBlue(90),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, MyRoutes.adminLoginRoute),
                      child: Text(
                        "Admin Login",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: MyThemes.darkBluishColor.withBlue(90),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
