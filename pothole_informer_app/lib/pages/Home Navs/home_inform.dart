import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InformPage extends StatefulWidget {
  const InformPage({Key? key}) : super(key: key);

  @override
  State<InformPage> createState() => _InformPageState();
}

class _InformPageState extends State<InformPage> {
  int _currentStep = 0;
  //To get data from textform field
  TextEditingController phone_no_data = new TextEditingController();
  TextEditingController city_data = new TextEditingController();
  TextEditingController address_data = new TextEditingController();
  TextEditingController description_data = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inform About Pothole"),
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.white),
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
                currentStep: this._currentStep,
                physics: NeverScrollableScrollPhysics(),
                onStepTapped: (step) {
                  //To get any step when directly tapped
                  setState(() {
                    this._currentStep = step;
                  });
                },
                //Continue Button
                onStepContinue: () {
                  setState(() {
                    if (this._currentStep < this._mySteps().length - 1) {
                      this._currentStep = this._currentStep + 1;
                    } else {
                      //logic to check if completed
                      print('Completed, check fields');
                    }
                  });
                },
                //Cancel Button
                onStepCancel: () {
                  setState(() {
                    if (this._currentStep > 0) {
                      this._currentStep = this._currentStep - 1;
                    } else {
                      this._currentStep = 0;
                    }
                  });
                },
              ),
              Column(children: [
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Map<String, dynamic> data = {
                          "Phone No:": phone_no_data.text,
                          "City": city_data.text,
                          "Address of Pothole": address_data.text,
                          "Description of Pothole": description_data.text,
                        };
                        FirebaseFirestore.instance
                            .collection("test")
                            .doc("inform details")
                            .set(data);
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                )
              ]),
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
        content: TextFormField(
          controller: phone_no_data,
          decoration: new InputDecoration(
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.deepPurple,
              ),
              labelText: "Phone Number"),
          keyboardType: TextInputType.number,
        ),
        isActive: _currentStep >= 0,
        state: StepState.indexed,
      ),
      Step(
        title: Text('Address of Pothole', style: TextStyle(fontSize: 20)),
        content: Column(
          children: [
            TextFormField(
              controller: city_data,
              decoration: new InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Colors.deepPurple,
                  ),
                  labelText: "Enter your city"),
            ),
            TextFormField(
              controller: address_data,
              decoration: new InputDecoration(
                  prefixIcon: Icon(
                    Icons.edit,
                    color: Colors.deepPurple,
                  ),
                  labelText: "Enter address of pothole"),
            ),
          ],
        ),
        isActive: _currentStep >= 1,
        state: StepState.indexed,
      ),
      Step(
        title: Text('Description of Pothole', style: TextStyle(fontSize: 20)),
        content: TextFormField(
          controller: description_data,
          decoration: new InputDecoration(
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
          onPressed: () {},
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
