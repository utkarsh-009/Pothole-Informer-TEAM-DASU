// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Homeheader extends StatelessWidget {
  const Homeheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 27,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }
}
