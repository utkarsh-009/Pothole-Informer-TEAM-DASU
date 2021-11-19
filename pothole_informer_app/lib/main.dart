import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pothole_informer_app/pages/admin_homepage.dart';
import 'package:pothole_informer_app/pages/admin_login_page.dart';
import 'package:pothole_informer_app/pages/first_page.dart';
import 'package:pothole_informer_app/pages/user_homepage.dart';
import 'package:pothole_informer_app/pages/user_login_page.dart';
import 'package:pothole_informer_app/routes.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:pothole_informer_app/firebase/authentication/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
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
      ),
    );
  }
}
