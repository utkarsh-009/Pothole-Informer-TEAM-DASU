// ignore_for_file: prefer_typing_uninitialized_variables, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:pothole_informer/pages/HomeNavs/home_inform.dart';
import 'package:pothole_informer/utils/routes.dart';

class NavigationBar extends StatefulWidget {
  final int currentIndex;
  const NavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState(currentIndex);
}

class _NavigationBarState extends State<NavigationBar> {
  final currentIndex;

  _NavigationBarState(this.currentIndex);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navigationIcons(
              Icons.home, 0, currentIndex, MyRoutes.userHomeRoute, "Home"),
          navigationIcons(Icons.perm_device_information, 1, currentIndex,
              MyRoutes.informRoute, "Inform"),
          navigationIcons(
              Icons.map, 2, currentIndex, MyRoutes.mapRoute, "Maps"),
          navigationIcons(
              Icons.auto_graph, 3, currentIndex, MyRoutes.statsPage, "Stats"),
        ],
      ),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 20.0, // soften the shadow
          spreadRadius: 3.0, //extend the shadow
          offset: Offset(
            0, // Move to right 10  horizontally
            20, // Move to bottom 10 Vertically
          ),
        )
      ]),
    );
  }

  navigationIcons(
      IconData icon, int index, int selectedIndex, String route, String name) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(bottom: 2),
        height: 51,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              constraints: const BoxConstraints(maxHeight: 33),
              padding: const EdgeInsets.all(8),
              icon: Icon(icon,
                  size: 22,
                  color: selectedIndex == index ? Colors.black : Colors.grey),
              onPressed: () {
                if (selectedIndex != index) {
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        decoration: selectedIndex == index
            ? BoxDecoration(
                border: const Border(
                    bottom: BorderSide(width: 1.5, color: Colors.deepPurple)),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.withOpacity(0.3),
                    Colors.purple.withOpacity(0.08),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              )
            : const BoxDecoration(),
      ),
    );
  }
}
