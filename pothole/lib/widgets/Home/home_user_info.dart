// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeUserInfo extends StatelessWidget {
  const HomeUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 64, vertical: 8),
      height: MediaQuery.of(context).size.width / 2.8,
      child: Column(
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width / 10,
            backgroundImage: NetworkImage(user.photoURL!),
            backgroundColor: Colors.black,
          ),
          SizedBox(height: 10),
          Expanded(
            child: Text(
              user.displayName!,
              maxLines: 1,
              style: TextStyle(
                color: Colors.purple[50],
                fontWeight: FontWeight.w500,
              ),
              textScaleFactor: MediaQuery.of(context).size.width / 280,
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Text(
              "Email: " + user.email!,
              maxLines: 1,
              style: TextStyle(
                color: Colors.purple[50],
              ),
              textScaleFactor: MediaQuery.of(context).size.width / 350,
            ),
          ),
        ],
      ),
    );
  }
}
