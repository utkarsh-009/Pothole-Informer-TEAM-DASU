import 'package:flutter/material.dart';


class InformPage extends StatefulWidget {
  const InformPage({Key? key}) : super(key: key);

  @override
  State<InformPage> createState() => _InformPageState();
}

class _InformPageState extends State<InformPage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inform About Pothole"),
      ),
      body: Stepper(
        steps: _mySteps(),
        currentStep: this._currentStep,
        onStepTapped: (step) {
          setState(() {
            this._currentStep = step;
          });
        },
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
    );
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text(
          'Phone Number',
          style: TextStyle(fontSize: 20),
        ),
        content: TextFormField(
          decoration: new InputDecoration(labelText: "Enter your phone number"),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value!.isEmpty || value.length < 10) {
              return 'Please enter valid number';
            }
          },
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Address of Pothole', style: TextStyle(fontSize: 20)),
        content: TextFormField(
          decoration:
              new InputDecoration(labelText: "Enter address of pothole"),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter the address of pothole';
            }
          },
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Description of Pothole', style: TextStyle(fontSize: 20)),
        content: TextFormField(
          decoration:
              new InputDecoration(labelText: "Enter description of pothole"),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter the description of pothole';
            }
          },
        ),
        isActive: _currentStep >= 2,
      ),
    ];
    return _steps;
  }
}
