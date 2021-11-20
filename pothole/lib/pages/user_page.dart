// ignore_for_file: prefer_const_constructors
//Page after first page to navigate to the home page if logged in else navigate to the login page

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pothole/pages/google_user_login_page.dart';
import 'package:pothole/pages/user_homepage.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return UserHomePage();
            } else if (snapshot.hasError) {
              return Center(child: Text("Oops! Something went wrong."));
            } else {
              return GoogleUserLogin();
            }
          }),
    );
  }
}
