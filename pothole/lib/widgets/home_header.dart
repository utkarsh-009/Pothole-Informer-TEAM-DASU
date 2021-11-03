// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Homeheader extends StatelessWidget {
  const Homeheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Pothole Informer",
            textScaleFactor: MediaQuery.of(context).size.width / 200,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 27,
            ),
          )
        ],
      ),
    );
  }
}
