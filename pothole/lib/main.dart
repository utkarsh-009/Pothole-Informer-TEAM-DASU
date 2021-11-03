// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pothole/utils/routes.dart';

import './pages/home_page.dart';
import './pages/login_page.dart';

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
      initialRoute: MyRoutes.loginPageRoute,
      routes: {
        MyRoutes.homePageRoute: (context) => HomePage(),
        MyRoutes.loginPageRoute: (context) => LoginPage(),
      },
    );
  }
}
