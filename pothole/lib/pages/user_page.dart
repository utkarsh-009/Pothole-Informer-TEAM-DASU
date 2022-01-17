import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pothole/pages/user_homepage.dart';
import 'package:pothole/pages/user_login_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return const UserHomePage();
            } else if (snapshot.hasError) {
              return const Center(child: Text("Oops! Something went wrong."));
            } else {
              return const UserLogin();
            }
          }),
    );
  }
}
