// ignore_for_file: prefer_typing_uninitialized_variables, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:pothole_informer/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        navigationIcons(FontAwesomeIcons.home, 0, currentIndex,
            MyRoutes.userHomeRoute, "Home"),
        navigationIcons(FontAwesomeIcons.infoCircle, 1, currentIndex,
            MyRoutes.informRoute, "Inform"),
        navigationIcons(FontAwesomeIcons.mapMarker, 2, currentIndex,
            MyRoutes.mapRoute, "Maps"),
        navigationIcons(FontAwesomeIcons.bars, 3, currentIndex,
            MyRoutes.statsPage, "Stats"),
      ],
    );
  }

  navigationIcons(
      IconData icon, int index, int selectedIndex, String route, String name) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(bottom: 2),
        height: 51,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              constraints: BoxConstraints(maxHeight: 33),
              padding: EdgeInsets.all(8),
              icon: FaIcon(icon,
                  size: 20,
                  color: selectedIndex == index ? Colors.black : Colors.grey),
              onPressed: () {
                if (selectedIndex != index) Navigator.pushNamed(context, route);
              },
            ),
            Text(
              name,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        decoration: selectedIndex == index
            ? BoxDecoration(
                border: const Border(
                    bottom: BorderSide(width: 1.5, color: Colors.deepPurple)),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.withOpacity(0.3),
                    Colors.purple.withOpacity(0.015),
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
