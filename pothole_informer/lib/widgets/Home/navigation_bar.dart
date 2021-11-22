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
        navigationIcons(
            FontAwesomeIcons.home, 0, currentIndex, MyRoutes.userHomeRoute),
        navigationIcons(
            FontAwesomeIcons.search, 1, currentIndex, MyRoutes.informRoute),
        navigationIcons(
            FontAwesomeIcons.mapMarker, 2, currentIndex, MyRoutes.mapRoute),
      ],
    );
  }

  navigationIcons(IconData icon, int index, int selectedIndex, String route) {
    return Expanded(
      child: Container(
        child: IconButton(
          icon: FaIcon(icon,
              color: selectedIndex == index ? Colors.black : Colors.grey),
          onPressed: () {
            if (selectedIndex != index) Navigator.pushNamed(context, route);
          },
        ),
        decoration: selectedIndex == index
            ? BoxDecoration(
                border: const Border(
                    bottom: BorderSide(width: 2, color: Colors.deepPurple)),
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

/*
class navigationIcons extends StatefulWidget {
  const navigationIcons({
    Key? key, required int index, selectedIndex, required IconData icon, required String route,
  }) : super(key: key);

  @override
  State<navigationIcons> createState() => _navigationIconsState(icon:icon,);
}

class _navigationIconsState extends State<navigationIcons> {
  @override
  final IconData icon;
  final int selectedIndex;
  final int index;
  final String route;

  _navigationIconsState(this.icon, this.selectedIndex, this.index, this.route);

  Widget build(BuildContext context) {
    bool counter = false;
    return Expanded(
      child: Container(
          child: IconButton(
            icon: FaIcon(
              icon,
              color: const Color.fromRGBO(113, 122, 106, 1),
            ),
            onPressed: () {
              if (selectedIndex == index) Navigator.pushNamed(context, route);
              setState(() {
                counter = true;
              });
            },
          ),
          color: counter ? Colors.green : Colors.white),
    );
  }
}
*/