// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:pothole/provider/google_sign_in.dart';
// import 'package:provider/provider.dart';

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
