// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Text(
          "Feedback",
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
