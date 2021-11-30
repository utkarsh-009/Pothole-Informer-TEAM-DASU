// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_single_cascade_in_expression_statements

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'input_location_maps.dart';

class FormPage extends StatefulWidget {
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _personalDetailsFormKey = GlobalKey<FormState>();
  final _potholeDetailsFormKey = GlobalKey<FormState>();
  late Map<String, dynamic> potholeData;
  var phone;
  var address;
  var description;
  final user = FirebaseAuth.instance.currentUser!;
  LatLng potholeLocation = LatLng(19.031, 73.014);

  moveToHome() async {
    if (_personalDetailsFormKey.currentState!.validate() &&
        _potholeDetailsFormKey.currentState!.validate()) {
      addData();
      Navigator.pop(context);
    }
  }

  void addData() {
    potholeData = {
      "Phone Number": phone,
      "Latitude": potholeLocation.latitude,
      "Longitude": potholeLocation.longitude,
      "Address": address,
      "Description": description,
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(user.uid.toString());
    collectionReference.add(potholeData);
  }

  @override
  Widget build(BuildContext context) {
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
                key: _personalDetailsFormKey,
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
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return "Please enter your phone number";
                            } else if (value != null && value.length != 10) {
                              return "Phone number should be of 10 digits";
                            }
                            return null;
                          },
                          onChanged: (phoneNumber) {
                            setState(() {
                              phone = phoneNumber;
                            });
                          },
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
                key: _potholeDetailsFormKey,
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
                        Text(
                            "${potholeLocation.latitude}, ${potholeLocation.longitude}"),
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
                            setState(() {});
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
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return "Please enter pothole address";
                            }
                            return null;
                          },
                          onChanged: (location) {
                            setState(() {
                              address = location;
                            });
                          },
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
                          onChanged: (desc) {
                            setState(() {
                              description = desc;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    moveToHome();
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ],
    );
  }
}
