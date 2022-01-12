// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pothole/pages/AdminPages/admin_homepage.dart';
import 'package:pothole/pages/HomeNavs/about.dart';
import 'package:pothole/pages/HomeNavs/stats.dart';
import 'package:pothole/pages/HomeNavs/tracker.dart';
import 'package:pothole/pages/user_page.dart';
// import 'package:pothole/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import './pages/google_user_login_page.dart';
import './pages/HomeNavs/FeedBack.dart';
import './pages/HomeNavs/maps.dart';
import './pages/AdminPages/admin_login_page.dart';
import './pages/first_page.dart';
import './pages/google_user_login_page.dart';
import './pages/slide_intro.dart';
import './pages/user_homepage.dart';
import './pages/user_login_page.dart';
import './utils/routes.dart';
import 'pages/AdminPages/admin_login_page.dart';
import 'pages/HomeNavs/Inform/home_inform.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/images/pothole_splash2.png',
          height: 500,
        ),
        splashIconSize: double.infinity,
        nextScreen: FirstPage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color.fromRGBO(30, 0, 50, 1),
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
        MyRoutes.informRoute: (context) => InformPage(),
        MyRoutes.mapRoute: (context) => MapPage(),
        MyRoutes.feedbackRoute: (context) => FeedbackPage(),
        MyRoutes.trackerRoute: (context) => TrackerPage(),
        MyRoutes.statsRoute: (context) => StatsPage(),
        MyRoutes.aboutRoute: (context) => AboutPage(),
        MyRoutes.sliderIntroRoute: (context) => SplashScreen(),
        // MyRoutes.imageUploadRoute: (context) => ImageUpload(),
      },
    );
  }
}
