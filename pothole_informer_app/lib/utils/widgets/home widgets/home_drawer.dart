import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pothole_informer_app/provider/authentication/google_sign_in.dart';
import 'package:pothole_informer_app/models/grid_items.dart';
import 'package:pothole_informer_app/pages/user_login_page.dart';
import '../../../routes.dart';
import 'drawer/nav_list_tile.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.deepPurple[900],
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(user.photoURL!),
                          backgroundColor: Colors.black,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          user.displayName!,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: Colors.purple[50],
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Email: " + user.email!,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: Colors.purple[50],
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  items.length * 2,
                  (index) => NavListTile(
                    item: items[index ~/ 2][index % 2],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton.icon(
                  onPressed: () async {
                    signOutGoogle();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return UserLogin();
                    }), ModalRoute.withName('/'));
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.black,
                    size: 30,
                  ),
                  label: Text(
                    " Logout",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
