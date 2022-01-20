// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pothole/layout/custom_clippers.dart';
import 'package:pothole/provider/authentication/google_sign_in.dart';
import 'package:pothole/utils/routes.dart';
import 'package:provider/provider.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  bool changeButton = false;
  late String username;
  late String password;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(const Duration(seconds: 1));
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
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              ClipPath(
                clipper: BottomCurve(),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 0.55),
                    BlendMode.darken,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/images/user_login.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.7,
                      ),
                      Text(
                        "User Login",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.sora().fontFamily,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Inform about Potholes",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: GoogleFonts.sora().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 18),
                              hintText: "Enter Username",
                              labelText: "Username",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              username = value;
                            },
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Username cannot be Empty";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            style: const TextStyle(fontSize: 14),
                            obscureText: true,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 18),
                              hintText: "Enter Password",
                              labelText: "Password",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              password = value;
                            },
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Password cannot be Empty";
                              } else if (value != null && value.length < 6) {
                                return "Password should be atleast 6 characters";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Row(
                          children: const <Widget>[
                            Expanded(
                              child: Divider(
                                indent: 30,
                                thickness: 0.8,
                                endIndent: 8,
                                color: Color.fromRGBO(85, 85, 85, 0.5),
                              ),
                            ),
                            Text(
                              "OR",
                              style: TextStyle(
                                color: Color.fromRGBO(85, 85, 85, 1),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                indent: 8,
                                thickness: 0.8,
                                endIndent: 30,
                                color: Color.fromRGBO(85, 85, 85, 0.5),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(5),
                                    fixedSize: MaterialStateProperty.all(
                                      Size(
                                        MediaQuery.of(context).size.width / 2,
                                        MediaQuery.of(context).size.height / 17,
                                      ),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xff32316B)),
                                  ),
                                  onPressed: () {
                                    final provider =
                                        Provider.of<GoogleSignInProvider>(
                                            context,
                                            listen: false);
                                    provider.googleLogin();
                                  },
                                  child: Row(
                                    children: const [
                                      FaIcon(
                                        FontAwesomeIcons.google,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                      Text("    Sign-In using Google"),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
