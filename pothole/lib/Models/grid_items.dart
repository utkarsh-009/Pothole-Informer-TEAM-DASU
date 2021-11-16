class GridItems {
  String image;
  String text;
  GridItems({
    required this.image,
    required this.text,
  });
}

var Items = [
  [
    GridItems(image: "assets/images/Inform2.png", text: "Inform"),
    GridItems(image: "assets/images/maps2.png", text: "Map"),
  ],
  [
    GridItems(image: "assets/images/FeedBack.png", text: "Feedback"),
    GridItems(image: "assets/images/Tracker.png", text: "Tracker"),
  ],
  [
    GridItems(image: "assets/images/Stats.png", text: "Stats"),
    GridItems(image: "assets/images/Info.png", text: "About"),
  ],
];
