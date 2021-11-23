// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pothole_informer/pages/HomeNavs/about.dart';
import 'package:pothole_informer/pages/HomeNavs/feedback.dart';
import 'package:pothole_informer/pages/HomeNavs/home_inform.dart';
import 'package:pothole_informer/pages/HomeNavs/maps.dart';
import 'package:pothole_informer/pages/HomeNavs/stats.dart';
import 'package:pothole_informer/pages/HomeNavs/tracker.dart';
import 'package:pothole_informer/pages/authenticator.dart';
import 'package:pothole_informer/pages/google_sign_in.dart';
import 'package:pothole_informer/pages/slide_intro.dart';
import 'package:pothole_informer/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './pages/admin_homepage.dart';
import './pages/admin_login_page.dart';
import './pages/first_page.dart';
import './pages/user_homepage.dart';
import './pages/user_login_page.dart';
import './utils/routes.dart';
import 'pages/slide_intro.dart';
import 'pages/user_homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSigInProvider(),
        child: MaterialApp(
          title: "Pothole Informer",
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
            splash: Image.asset(
              "assets/images/pothole_splash.png",
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
            MyRoutes.informRoute: (context) => InformPage(),
            MyRoutes.mapRoute: (context) => MapPage(),
            MyRoutes.feedbackRoute: (context) => FeedbackPage(),
            MyRoutes.sliderIntroRoute: (context) => SlideIntro(),
            MyRoutes.loginRoute: (context) => LoginPage(),
            MyRoutes.myNavigator: (context) => HomePage(),
            MyRoutes.statsPage: (context) => Stats(),
            MyRoutes.aboutPage: (context) => About(),
            MyRoutes.trackerRoute: (context) => Tracker(),
          },
        ),
      );
}
