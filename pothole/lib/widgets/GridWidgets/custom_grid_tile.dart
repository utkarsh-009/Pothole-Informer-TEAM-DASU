// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class CustomGridTile extends StatefulWidget {
  final String image;
  final String text;
  final String route;

  const CustomGridTile({
    Key? key,
    required this.image,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  State<CustomGridTile> createState() => _CustomGridTileState();
}

class _CustomGridTileState extends State<CustomGridTile> {
  double elv = 5;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: elv,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () async {
          elv = 1;
          setState(() {});
          await Future.delayed(Duration(milliseconds: 200));
          elv = 5;
          setState(() {});
          if (widget.text == "About")
            showAboutDialog(context: context);
          else
            Navigator.pushNamed(context, widget.route);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Image.asset(widget.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.text,
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
