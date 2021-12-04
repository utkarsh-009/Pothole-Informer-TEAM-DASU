// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class WelcomeHome extends StatelessWidget {
  const WelcomeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 200,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back",
                  textScaleFactor: 1.7,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Amogh",
                  textScaleFactor: 1.3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
