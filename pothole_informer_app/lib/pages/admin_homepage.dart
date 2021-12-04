import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pothole_informer_app/routes.dart';
import 'package:pothole_informer_app/utils/themes.dart';

class AdminHomePage extends StatefulWidget {
  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<String> imagePaths = [];
  List<String> add = [];
  List<String> city = [];
  List<String> desc = [];
  List<String> ph_no = [];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Pothole Details")
        .snapshots()
        .listen((event) {
      setState(() {
        add = List.generate(event.docs.length,
            (index) => event.docs[index].data()['Address of Pothole']);
        city = List.generate(
            event.docs.length, (index) => event.docs[index].data()['City']);
        desc = List.generate(event.docs.length,
            (index) => event.docs[index].data()['Description of Pothole']);
        ph_no = List.generate(
            event.docs.length, (index) => event.docs[index].data()['Phone No']);
        imagePaths = List.generate(event.docs.length,
            (index) => event.docs[index].data()['image url']);
      });
    });
  }

  Future<String> downloadURL(String imageURL) async {
    String downloadUrl =
        await FirebaseStorage.instance.ref(imageURL).getDownloadURL();
    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      appBar: AppBar(
        title: Text("Admin Homepage"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Container(
                height: 500,
                child: Column(
                  children: [
                    Image.network(
                      imagePaths[index],
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Address of Pothole: "),
                              Text(
                                "${add[index]}",
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("City: "),
                              Text(
                                "${city[index]}",
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Description of Pothole: "),
                              Text(
                                "${desc[index]}",
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Phone No: "),
                              Text(
                                "${ph_no[index]}",
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: imagePaths.length,
      ),
    );
  }
}
