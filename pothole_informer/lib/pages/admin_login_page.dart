import 'package:flutter/material.dart';

import '../routes.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.adminHomeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/admin_login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 35,
                child: Text(
                  "Admin Login",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              SizedBox(
                height: 35,
                child: Text(
                  "Only For Administrators",
                  style: TextStyle(
                    fontSize: 22,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 25,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Username cannot be Empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Password cannot be Empty";
                        } else if (value != null && value.length < 6) {
                          return "Password should be atleast 6 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(
                          changeButton ? 50 : 8), //Smooth animation
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                          // decoration: BoxDecoration(
                          //   color: Colors.deepPurple,
                          // shape: changeButton ? BoxShape.circle : BoxShape.rectangle, //Not smooth animation
                        ),
                      ),
                    ),
                    /*
                    ElevatedButton(
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      style: TextButton.styleFrom(minimumSize: Size(100, 50)),
                    )
                    */
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
