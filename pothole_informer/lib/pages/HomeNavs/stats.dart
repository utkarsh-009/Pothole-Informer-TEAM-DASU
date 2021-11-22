import 'package:flutter/material.dart';
import 'package:pothole_informer/widgets/Home/navigation_bar.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Stats",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: NavigationBar(currentIndex: 3),
    );
  }
}
