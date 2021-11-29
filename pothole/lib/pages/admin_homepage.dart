// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../utils/themes.dart';

class AdminHomePage extends StatefulWidget {
  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Pothole Details")
        .snapshots()
        .listen((event) {
      setState(() {
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
            padding: const EdgeInsets.all(32.0),
            child: Card(
              child: FutureBuilder(
                future: downloadURL(imagePaths[index]),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Container(
                      height: 500,
                      child: Image.network(snapshot.data!),
                    );
                  }
                  return Container();
                },
              ),
            ),
          );
        },
        itemCount: imagePaths.length,
      ),
    );
  }
}
