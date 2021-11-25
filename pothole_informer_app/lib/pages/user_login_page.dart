import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pothole_informer_app/main.dart';
import 'package:pothole_informer_app/pages/user_homepage.dart';
import 'package:pothole_informer_app/utils/themes.dart';
import 'package:provider/provider.dart';
import 'package:pothole_informer_app/provider/authentication/google_sign_in.dart';
import '../routes.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.userHomeRoute);
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
                height: 30,
              ),
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
                height: 255,
                width: 400,
              ),
              // SizedBox(
              //   height: 0,
              // ),
              SizedBox(
                height: 33,
                child: Text(
                  "User Login",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Text(
                "Welcome To Login Page",
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(
              //   height: 25,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.deepPurple,
                        ),
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
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.deepPurple,
                        ),
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
                      height: 30,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(
                          changeButton ? 50 : 150), //Smooth animation
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      '-- OR --',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Sign in using',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      print("Logged in with Google");
                      signInWithGoogle().then((result) {
                        if (result != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return UserHomePage();
                              },
                            ),
                          );
                        }
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/images/google.png"),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Logged in with Facebook");
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/images/facebook.png"),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Logged in with Instagram");
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/images/instagram.png"),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
