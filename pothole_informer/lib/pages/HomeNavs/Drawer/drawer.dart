import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pothole_informer/Models/grid_items.dart';
import 'package:pothole_informer/pages/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'list_widget.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 240,
            width: double.infinity,
            color: Colors.deepPurple,
            margin: const EdgeInsets.all(0.0),
            padding: const EdgeInsets.all(0.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  CircleAvatar(
                    radius: 47,
                    backgroundImage: NetworkImage(user.photoURL!),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 13, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.displayName!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Email ID: ${user.email}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: List.generate(
              items.length * 2,
              (index) => Row(
                children: [ListWidget(item: items[index ~/ 2][index % 2])],
              ),
            ),
          ),
          const Divider(thickness: 1, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(7),
            child: TextButton(
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Log Out",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSigInProvider>(context, listen: false);
                provider.logout();
              },
            ),
          )
        ],
      ),
    );
  }
}
