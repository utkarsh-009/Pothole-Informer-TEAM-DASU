import 'package:flutter/material.dart';
import 'package:pothole_informer_app/custom%20layouts/custom_grid.dart';
import 'package:pothole_informer_app/custom%20layouts/home_back.dart';
import 'package:pothole_informer_app/utils/themes.dart';
import 'package:pothole_informer_app/utils/widgets/home%20widgets/home_drawer.dart';
import 'package:pothole_informer_app/utils/widgets/home%20widgets/user_stats.dart';

import '../routes.dart';

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
