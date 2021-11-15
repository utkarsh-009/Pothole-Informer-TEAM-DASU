import 'package:flutter/material.dart';
import 'package:pothole_informer/utils/widgets/themes.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Admin HomePage",
              style: TextStyle(fontSize: 40),
            ),
          ],
        )),
      ),
    );
  }
}
