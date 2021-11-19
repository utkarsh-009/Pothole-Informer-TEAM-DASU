// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class UserStats extends StatelessWidget {
  final noInforms;
  final noFeedbacks;
  final pending;
  final fixed;

  const UserStats(
      {Key? key, this.noInforms, this.noFeedbacks, this.pending, this.fixed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 40, left: 32, right: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "$noInforms",
                  style: TextStyle(color: Colors.purple[50]),
                  textScaleFactor: 3,
                ),
                Text(
                  "Informs",
                  style: TextStyle(color: Colors.purple[50]),
                  textScaleFactor: 1.2,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "$noFeedbacks",
                  style: TextStyle(color: Colors.purple[50]),
                  textScaleFactor: 3,
                ),
                Text(
                  "Feedbacks",
                  style: TextStyle(color: Colors.purple[50]),
                  textScaleFactor: 1.2,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "$pending",
                  style: TextStyle(color: Colors.purple[50]),
                  textScaleFactor: 3,
                ),
                Text(
                  "Pending",
                  style: TextStyle(color: Colors.purple[50]),
                  textScaleFactor: 1.2,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "$fixed",
                  style: TextStyle(color: Colors.purple[50]),
                  textScaleFactor: 3,
                ),
                Text(
                  "Fixed",
                  style: TextStyle(color: Colors.purple[50]),
                  textScaleFactor: 1.2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
