// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pothole_informer/layout/back.dart';
import 'package:pothole_informer/pages/HomeNavs/Drawer/drawer.dart';
import 'package:pothole_informer/widgets/GridWidgets/custom_grid.dart';
import 'package:pothole_informer/widgets/Home/home_user_info.dart';
import 'package:pothole_informer/widgets/Home/navigation_bar.dart';
import 'package:pothole_informer/widgets/Home/user_stats.dart';

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
              backgroundColor: Color.fromRGBO(23, 2, 51, 0),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.notifications,
                    size: 26,
                  ),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
            ),
            drawer: MyDrawer(),
            bottomNavigationBar: NavigationBar(
              currentIndex: 0,
            ),
          ),
        ],
      ),
    );
  }
}
