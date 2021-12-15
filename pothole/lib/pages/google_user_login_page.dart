// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pothole/layout/custom_clippers.dart';
import 'package:pothole/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

// class GoogleUserLogin extends StatelessWidget {
//   const GoogleUserLogin({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               SizedBox(height: 80),
//               Text(
//                 "Pothole Informer",
//                 style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.width / 13,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               Image.asset(
//                 "assets/images/login_image.png",
//                 fit: BoxFit.cover,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 1.2,
//                 height: 50,
//                 child: ElevatedButton.icon(
//                   icon: FaIcon(
//                     FontAwesomeIcons.google,
//                     color: Colors.red[900],
//                   ),
//                   onPressed: () {
//                     final provider = Provider.of<GoogleSignInProvider>(context,
//                         listen: false);
//                     provider.googleLogin();
//                   },
//                   label: Text("Sign up with Google"),
//                   style: ElevatedButton.styleFrom(
//                     primary: Color.fromRGBO(240, 240, 240, 1),
//                     onPrimary: Colors.black,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 80),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class GoogleUserLogin extends StatelessWidget {
  const GoogleUserLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Color.fromRGBO(0, 0, 0, 0.8),
            BlendMode.darken,
          ),
          child: Image.network(
            'https://i.pinimg.com/originals/13/f0/8c/13f08ce3f328678ead15cb6edea460d1.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 10,
                  ),
                  width: MediaQuery.of(context).size.width / 1.25,
                  child: Image.asset(
                    'assets/images/pothole_splash2.png',
                  ),
                ),
                Text(
                  "",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 16,
                    ),
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
