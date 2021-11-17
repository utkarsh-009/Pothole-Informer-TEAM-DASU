import 'package:pothole/utils/routes.dart';

class GridItems {
  String image;
  String text;
  String route;
  GridItems({
    required this.image,
    required this.text,
    required this.route,
  });
}

var Items = [
  [
    GridItems(
        image: "assets/images/Inform2.png",
        text: "Inform",
        route: MyRoutes.informRoute),
    GridItems(
        image: "assets/images/maps2.png",
        text: "Map",
        route: MyRoutes.mapRoute),
  ],
  [
    GridItems(
        image: "assets/images/FeedBack.png",
        text: "Feedback",
        route: MyRoutes.feedbackRoute),
    GridItems(
        image: "assets/images/Tracker.png",
        text: "Tracker",
        route: MyRoutes.informRoute),
  ],
  [
    GridItems(
        image: "assets/images/Stats.png",
        text: "Stats",
        route: MyRoutes.informRoute),
    GridItems(
        image: "assets/images/Info.png",
        text: "About",
        route: MyRoutes.informRoute),
  ],
];
