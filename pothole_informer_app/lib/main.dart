import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pothole_informer_app/pages/Home%20Navs/about.dart';
import 'package:pothole_informer_app/pages/Home%20Navs/feedback.dart';
import 'package:pothole_informer_app/pages/Home%20Navs/home_inform.dart';
import 'package:pothole_informer_app/pages/Home%20Navs/maps.dart';
import 'package:pothole_informer_app/pages/Home%20Navs/stats.dart';
import 'package:pothole_informer_app/pages/Home%20Navs/tracker.dart';
import 'package:pothole_informer_app/pages/admin_homepage.dart';
import 'package:pothole_informer_app/pages/admin_login_page.dart';
import 'package:pothole_informer_app/pages/first_page.dart';
import 'package:pothole_informer_app/pages/slide_intro.dart';
import 'package:pothole_informer_app/pages/user_homepage.dart';
import 'package:pothole_informer_app/pages/user_login_page.dart';
import 'package:pothole_informer_app/routes.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:pothole_informer_app/provider/authentication/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
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
        MyRoutes.informRoute: (context) => InformPage(),
        MyRoutes.mapRoute: (context) => MapPage(),
        MyRoutes.feedbackRoute: (context) => FeedbackPage(),
        MyRoutes.trackerRoute: (context) => TrackerPage(),
        MyRoutes.statsRoute: (context) => StatsPage(),
        MyRoutes.aboutRoute: (context) => AboutPage(),
        MyRoutes.sliderIntroRoute: (context) => SlideIntro(),
      },
    );
  }
}
