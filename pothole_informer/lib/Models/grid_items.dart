import 'package:flutter/material.dart';
import 'package:pothole_informer/utils/routes.dart';

class GridItems {
  String image;
  String text;
  String route;
  IconData icon;
  GridItems({
    required this.image,
    required this.text,
    required this.route,
    required this.icon,
  });
}

var items = [
  [
    GridItems(
      image: "assets/images/Inform2.png",
      text: "Inform",
      route: MyRoutes.informRoute,
      icon: Icons.perm_device_information,
    ),
    GridItems(
      image: "assets/images/maps2.png",
      text: "Map",
      route: MyRoutes.mapRoute,
      icon: Icons.map,
    ),
  ],
  [
    GridItems(
      image: "assets/images/FeedBack.png",
      text: "Feedback",
      route: MyRoutes.feedbackRoute,
      icon: Icons.feedback,
    ),
    GridItems(
      image: "assets/images/Tracker.png",
      text: "Tracker",
      route: MyRoutes.trackerRoute,
      icon: Icons.track_changes,
    ),
  ],
  [
    GridItems(
      image: "assets/images/Stats.png",
      text: "Stats",
      route: MyRoutes.statsPage,
      icon: Icons.auto_graph,
    ),
    GridItems(
      image: "assets/images/Info.png",
      text: "About",
      route: MyRoutes.aboutPage,
      icon: Icons.info,
    ),
  ],
];
