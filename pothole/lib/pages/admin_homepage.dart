// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pothole/utils/themes.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final CollectionReference potholeList =
      FirebaseFirestore.instance.collection("Pothole Details");

  List potholeItems = [];
  Future fetchPotholeList() async {
    await potholeList.get().then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        potholeItems.add(element.data());
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchPotholeList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
                child: Text(
                  "Admin Page",
                  style: TextStyle(
                      color: MyThemes.darkBluishColor,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ItemHolder(potholeItems: potholeItems)
          ],
        ),
      ),
    );
  }
}

class ItemHolder extends StatelessWidget {
  const ItemHolder({Key? key, required this.potholeItems}) : super(key: key);
  final dynamic potholeItems;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PotholeWidget(
            item: potholeItems[index],
          );
        },
        itemCount: potholeItems.length,
      ),
    );
  }
}

class PotholeWidget extends StatelessWidget {
  final dynamic item;

  const PotholeWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Card(
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        item["image url"],
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Text('Some errors occurred!'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 310,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                        gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.centerLeft),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Text(
                          item['Description of Pothole'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'Raleway'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
