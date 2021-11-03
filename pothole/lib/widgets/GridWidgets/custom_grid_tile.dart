// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomGridTile extends StatelessWidget {
  String image;
  String text;

  CustomGridTile({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 3,
        child: GridTile(
          child: Image.asset(image),
          footer: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                text,
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
