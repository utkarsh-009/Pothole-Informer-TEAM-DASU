import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pothole_informer_app/utils/themes.dart';

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
              child: Container(
                height: 500,
                child: Image.network(imagePaths[index]),
              ),
            ),
          );
        },
        itemCount: imagePaths.length,
      ),
    );
  }
}
