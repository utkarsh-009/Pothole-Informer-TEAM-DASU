// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pothole/Models/grid_items.dart';

class NavListTile extends StatelessWidget {
  GridItems item;

  NavListTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, item.route);
        },
        icon: Icon(
          item.icon,
          color: Colors.black,
          size: 30,
        ),
        label: Text(
          " " + item.text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
