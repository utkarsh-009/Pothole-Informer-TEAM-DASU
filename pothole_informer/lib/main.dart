import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pothole_informer/pages/admin_homepage.dart';
import 'package:pothole_informer/pages/admin_login_page.dart';
import 'package:pothole_informer/pages/first_page.dart';
import 'package:pothole_informer/pages/user_homepage.dart';
import 'package:pothole_informer/pages/user_login_page.dart';
import 'package:pothole_informer/routes.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/images/pothole_splash.png',
          height: 200,
          width: 100,
        ),
        splashIconSize: double.infinity,
        nextScreen: FirstPage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.deepPurple,
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily, //Adding google font
      ),
      // initialRoute: '/firstpage',
      routes: {
        MyRoutes.firstPageRoute: (context) => FirstPage(),
        MyRoutes.userLoginRoute: (context) => UserLogin(),
        MyRoutes.adminLoginRoute: (context) => AdminLogin(),
        MyRoutes.userHomeRoute: (context) => UserHomePage(),
        MyRoutes.adminHomeRoute: (context) => AdminHomePage(),
      },
    );
  }
}
