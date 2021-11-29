// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pothole/pages/HomeNavs/Inform/input_location_maps.dart';

class InformPage extends StatefulWidget {
  const InformPage({Key? key}) : super(key: key);

  @override
  State<InformPage> createState() => _InformPageState();
}

class _InformPageState extends State<InformPage> {
  int _currentStep = 0;
  final _personalDetailsFormKey = GlobalKey<FormState>();
  final _potholeDetailsFormKey = GlobalKey<FormState>();
  //To get data from textform field
  TextEditingController phone_no_data = TextEditingController();
  TextEditingController city_data = TextEditingController();
  TextEditingController address_data = TextEditingController();
  TextEditingController description_data = TextEditingController();
  LatLng potholeLocation = LatLng(19.031, 73.014);
  XFile? _image;
  String imageURL =
      "https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227725020-stock-illustration-image-available-icon-flat-vector.jpg";
  String uploadCode = DateTime.now().hashCode.toString();
  final user = FirebaseAuth.instance.currentUser!;

  Future<String> downloadURL(String imageURL) async {
    String downloadUrl =
        await FirebaseStorage.instance.ref(imageURL).getDownloadURL();
    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Inform About Pothole"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/pothole_filling_1.jpg",
                height: 150,
              ),
              SizedBox(
                height: 20,
              ),
              //Defining Stepper widget and its buttons (Continue, Cancel button)
              Stepper(
                steps: _mySteps(),
                currentStep: _currentStep,
                physics: NeverScrollableScrollPhysics(),
                onStepTapped: (step) {
                  //To get any step when directly tapped
                  setState(
                    () {
                      _currentStep = step;
                    },
                  );
                },
                //Continue Button
                onStepContinue: () {
                  setState(
                    () {
                      if (_currentStep < _mySteps().length - 1) {
                        _currentStep = _currentStep + 1;
                      } else {
                        //logic to check if completed
                        print('Completed, check fields');
                      }
                    },
                  );
                },
                //Cancel Button
                onStepCancel: () {
                  setState(
                    () {
                      if (_currentStep > 0) {
                        _currentStep = _currentStep - 1;
                      } else {
                        _currentStep = 0;
                      }
                    },
                  );
                },
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_personalDetailsFormKey.currentState!.validate() &&
                          _potholeDetailsFormKey.currentState!.validate()) {
                        imageURL = await downloadURL("Images/$uploadCode");
                        Map<String, dynamic> data = {
                          "Phone No:": phone_no_data.text,
                          "City": city_data.text,
                          "Address of Pothole": address_data.text,
                          "Latitude": potholeLocation.latitude,
                          "Longitude": potholeLocation.longitude,
                          "Description of Pothole": description_data.text,
                          "image url": imageURL,
                        };
                        FirebaseFirestore.instance
                            .collection("Pothole Details")
                            .doc(uploadCode)
                            .set(data);
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//Defining the content inside each step
  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text(
          'Personal Details',
          style: TextStyle(fontSize: 20),
        ),
        content: Form(
          key: _personalDetailsFormKey,
          child: TextFormField(
            controller: phone_no_data,
            validator: (String? value) {
              if (value != null && value.isEmpty) {
                _currentStep = 0;
                setState(() {});
                return "Please enter your phone number";
              } else if (value != null && value.length != 10) {
                return "Phone number should be of 10 digits";
              }
              return null;
            },
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.deepPurple,
                ),
                labelText: "Phone Number"),
            keyboardType: TextInputType.number,
          ),
        ),
        isActive: _currentStep >= 0,
        state: StepState.indexed,
      ),
      Step(
        title: Text('Address of Pothole', style: TextStyle(fontSize: 20)),
        content: Form(
          key: _potholeDetailsFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: city_data,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Colors.deepPurple,
                    ),
                    labelText: "Enter your city"),
                validator: (String? value) {
                  _currentStep = 1;
                  setState(() {});
                  if (value != null && value.isEmpty) {
                    return "Please enter the city";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: address_data,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.edit,
                      color: Colors.deepPurple,
                    ),
                    labelText: "Enter address of pothole"),
                validator: (String? value) {
                  _currentStep = 1;
                  setState(() {});
                  if (value != null && value.isEmpty) {
                    return "Please enter the address";
                  }
                  return null;
                },
              ),
              TextButton(
                onPressed: () async {
                  potholeLocation = await Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => InputLocation(
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
            ],
          ),
        ),
        isActive: _currentStep >= 1,
        state: StepState.indexed,
      ),
      Step(
        title: Text('Description of Pothole', style: TextStyle(fontSize: 20)),
        content: TextFormField(
          controller: description_data,
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.description,
                color: Colors.deepPurple,
              ),
              labelText: "Enter description of pothole"),
        ),
        isActive: _currentStep >= 2,
        state: StepState.indexed,
      ),
      Step(
        title: Text(
          'Upload Image',
          style: TextStyle(fontSize: 20),
        ),
        content: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (builder) => Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Select Pothole Image",
                      style: TextStyle(fontSize: 22),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(
                          onPressed: () async {
                            Navigator.pop(context);
                            var imagefile = await ImagePicker()
                                .pickImage(source: ImageSource.camera);
                            if (imagefile != null) {
                              setState(() {
                                _image = imagefile;
                              });
                              await FirebaseStorage.instance
                                  .ref("Images/$uploadCode")
                                  .putFile(File(_image!.path));
                            }
                          },
                          icon: Icon(
                            Icons.camera,
                            color: Colors.black,
                          ),
                          label: Text("Camera"),
                        ),
                        TextButton.icon(
                          onPressed: () async {
                            Navigator.pop(context);
                            var imagefile = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (imagefile != null) {
                              setState(() {
                                _image = imagefile;
                              });
                              await FirebaseStorage.instance
                                  .ref("Images/$uploadCode")
                                  .putFile(File(_image!.path));
                            }
                          },
                          icon: Icon(
                            Icons.image,
                            color: Colors.black,
                          ),
                          label: Text("Gallery"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          child: Text(
            "Click here to upload image",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Step(
        title:
            Text('Accept Terms and Conditions', style: TextStyle(fontSize: 18)),
        content: Checker(),
      )
    ];
    return _steps;
  }
}

//For Terms & Condition checkerbox
class Checker extends StatefulWidget {
  const Checker({Key? key}) : super(key: key);

  @override
  State<Checker> createState() => _CheckerState();
}

class _CheckerState extends State<Checker> {
  @override
  bool _value = false;

  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text(
            "Terms and Conditions",
            style: TextStyle(fontSize: 15),
          ),
          subtitle: const Text(
              "I confirm all information provided by me are legit, and if wrong i will suffer future ban",
              style: TextStyle(fontSize: 11)),
          secondary: const Icon(Icons.paste),
          controlAffinity: ListTileControlAffinity.leading,
          value: _value,
          autofocus: false,
          activeColor: Colors.green,
          checkColor: Colors.white,
          selected: _value,
          onChanged: (value) {
            setState(() {
              _value = value!;
            });
          },
        ),
      ],
    );
  }
}
