// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pothole/layout/back.dart';
import 'package:pothole/utils/routes.dart';
import 'package:pothole/widgets/GridWidgets/custom_grid.dart';
import 'package:pothole/widgets/Home/home_drawer.dart';
import 'package:pothole/widgets/Home/user_stats.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          HomeBack(),
          Scaffold(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(255, 255, 255, 0),
              elevation: 0,
              title: Text("Pothole Informer"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.sliderIntroRoute);
                    },
                    icon: Icon(Icons.info)),
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
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
            drawer: HomeDrawer(),
          )
        ],
      ),
    );
  }
}
