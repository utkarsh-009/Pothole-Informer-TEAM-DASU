import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pothole/pages/HomeNavs/maps.dart';

class DetailedInfo extends StatelessWidget {
  final dynamic item;
  final int index;

  static TextStyle titleStyle = TextStyle(
    color: Colors.deepPurple,
    fontSize: 20,
    fontFamily: GoogleFonts.prozaLibre().fontFamily,
    fontWeight: FontWeight.w900,
  );
  static TextStyle descStyle = TextStyle(
    color: Colors.black,
    fontSize: 19,
    fontFamily: GoogleFonts.prozaLibre().fontFamily,
    fontWeight: FontWeight.w400,
  );

  const DetailedInfo({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 50,
                  width: double.infinity,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(maxWidth: width / 1.3),
                      height: height / 2.5,
                      child: Hero(
                        tag: Key(
                          index.toString(),
                        ),
                        child: Image.network(
                          item["image url"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                placeHolders(
                  "City",
                  item['City'],
                ),
                placeHolders(
                  "Address",
                  item['Address of Pothole'],
                ),
                placeHolders(
                  "Location",
                  item['Longitude'].toString() +
                      ", " +
                      item['Latitude'].toString(),
                ),
                placeHolders(
                  "Phone No.",
                  item['Phone No'],
                ),
                placeHolders(
                  "Description",
                  item['Description of Pothole'],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(5),
                              fixedSize: MaterialStateProperty.all(
                                  const Size(200, 50)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MapPage.getPothole(
                                    item['Latitude'],
                                    item['Longitude'],
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.mapMarker,
                                  size: 20,
                                  color: Colors.deepPurple.withOpacity(0.6),
                                ),
                                Text(
                                  "    Open in Maps",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple.withOpacity(0.6),
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding placeHolders(String title, String field) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 35),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title + ": ",
            style: DetailedInfo.titleStyle,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("$field", style: DetailedInfo.descStyle),
            ),
          ),
        ],
      ),
    );
  }
}
