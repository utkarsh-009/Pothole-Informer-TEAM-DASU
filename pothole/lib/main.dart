// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import './pages/admin_homepage.dart';
import './pages/admin_login_page.dart';
import './pages/first_page.dart';
import './pages/user_homepage.dart';
import './pages/user_login_page.dart';
import './utils/routes.dart';
import 'pages/user_homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pothole Informer",
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
      ),
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
