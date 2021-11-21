// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeUserInfo extends StatelessWidget {
  const HomeUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            child: Image.network(user.photoURL!),
            radius: MediaQuery.of(context).size.width / 8,
            backgroundColor: Colors.purple[50],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              user.displayName!,
              style: TextStyle(
                color: Colors.purple[50],
                fontWeight: FontWeight.w500,
              ),
              textScaleFactor: MediaQuery.of(context).size.width / 280,
            ),
          ),
        ],
      ),
    );
  }
}
