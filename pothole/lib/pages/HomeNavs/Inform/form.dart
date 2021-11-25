// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pothole/pages/HomeNavs/Inform/input_location_maps.dart';
import 'package:pothole/utils/routes.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LatLng potholeLocation = LatLng(19.031, 73.014);
    final locationController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Inform Page",
                  style: TextStyle(
                    fontFamily: GoogleFonts.lato().fontFamily,
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                          child: Center(
                            child: Text(
                              "PERSONAL DETAILS",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 18, 0, 14),
                          child: Row(
                            children: [
                              Text(
                                "Contact Info: ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        TextFormField(
                          cursorHeight: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            hintText: "Phone number",
                            labelText: "Enter Phone Number",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                          child: Center(
                            child: Text(
                              "POTHOLE DETAILS",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 18, 0, 14),
                          child: Row(
                            children: [
                              Text(
                                "Location: ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        TextField(
                          cursorHeight: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            hintText: "Coordinates",
                            labelText: "Enter Coordinates",
                          ),
                          controller: locationController,
                        ),
                        TextButton(
                          onPressed: () async {
                            potholeLocation = await Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    InputLocation(
                                  location: potholeLocation,
                                ),
                              ),
                            ) as LatLng;

                            locationController.value = TextEditingValue(
                              text:
                                  "${potholeLocation.latitude}, ${potholeLocation.longitude}",
                              selection: TextSelection.fromPosition(
                                TextPosition(
                                    offset:
                                        "${potholeLocation.latitude}, ${potholeLocation.longitude}"
                                            .length),
                              ),
                            );
                          },
                          child: Text(
                            "Mark location",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 18, 0, 14),
                          child: Row(
                            children: [
                              Text(
                                "Address: ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        TextFormField(
                          cursorHeight: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            hintText: "Location",
                            labelText: "Enter Address",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 18, 0, 14),
                          child: Text(
                            "Description: ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          cursorHeight: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            focusColor: Colors.red,
                            disabledBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            hintText: "Description",
                            labelText: "Enter Description",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
