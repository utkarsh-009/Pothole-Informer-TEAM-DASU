// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pothole/layout/back.dart';
import 'package:pothole/widgets/GridWidgets/custom_grid.dart';
import 'package:pothole/widgets/Home/home_user_info.dart';
import 'package:pothole/widgets/Home/user_stats.dart';

import '../widgets/Home/home_header.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 241, 240, 1),
      body: Stack(
        children: [
          HomeBack(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Homeheader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 2),
                      HomeUserInfo(),
                      UserStats(
                        noFeedbacks: 2,
                        noInforms: 5,
                        fixed: 4,
                        pending: 1,
                      ),
                      CustomGrid(),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
