import 'package:flutter/material.dart';
import 'package:pothole_informer/pages/google_sign_in.dart';
import 'package:provider/provider.dart';

class Homeheader extends StatelessWidget {
  const Homeheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSigInProvider>(context, listen: false);
              provider.logout();
            },
            child: const Text(
              "LOGOUT",
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 27,
            ),
          )
        ],
      ),
    );
  }
}
