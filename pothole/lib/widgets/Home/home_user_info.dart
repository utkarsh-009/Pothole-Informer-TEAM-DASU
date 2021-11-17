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
            child: Image.asset("assets/images/Profile_image.png"),
            radius: MediaQuery.of(context).size.width / 8,
            backgroundColor: Colors.purple[50],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Amogh Prabhu",
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
