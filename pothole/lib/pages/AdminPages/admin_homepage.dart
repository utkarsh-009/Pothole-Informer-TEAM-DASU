import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pothole/pages/AdminPages/pothole_details.dart';
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
              child: Text(
                "Admin Page",
                style: TextStyle(
                    color: MyThemes.darkBluishColor,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            potholeItems.isEmpty
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ItemHolder(potholeItems: potholeItems)
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
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            child: PotholeWidget(
              index: index,
              item: potholeItems[index],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedInfo(
                    item: potholeItems[index],
                    index: index,
                  ),
                ),
              );
            },
          );
        },
        itemCount: potholeItems.length,
      ),
    );
  }
}

class PotholeWidget extends StatelessWidget {
  final int index;
  final dynamic item;

  const PotholeWidget({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  child: Hero(
                    tag: Key(index.toString()),
                    child: Image.network(
                      item["image url"],
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Text('Some error occurred!')),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description: ",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "${item['Description of Pothole']}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
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
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
