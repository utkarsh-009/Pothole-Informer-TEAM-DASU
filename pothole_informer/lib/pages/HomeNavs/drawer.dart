import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Drawer(
      child: ListView(
        children: [
          Container(
              height: 200,
              color: Colors.deepPurple,
              child: DrawerHeader(
                padding: EdgeInsets.all(15),
                child: UserAccountsDrawerHeader(
                  accountName: Text("Name: ${user.displayName!},"),
                  accountEmail: Text("Email: ${user.email!}"),
                  currentAccountPicture: Container(
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      radius: 500,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                  ),
                ),
              ),
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(0.0)),
        ],
      ),
    );
  }
}
