// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeUserInfo extends StatelessWidget {
  const HomeUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            child: Image.network(
                "https://www.pngall.com/wp-content/uploads/5/Profile-Male-Transparent.png"),
            radius: MediaQuery.of(context).size.width / 8,
            backgroundColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Amogh Prabhu",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textScaleFactor: MediaQuery.of(context).size.width / 350,
            ),
          ),
        ],
      ),
    );
  }
}
