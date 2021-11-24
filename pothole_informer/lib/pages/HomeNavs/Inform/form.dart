import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pothole_informer/utils/themes.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

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
                                  fontSize: 18,
                                  color: MyThemes.darkBluishColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 18, 0, 14),
                          child: Text(
                            "Contact Info: ",
                            style: TextStyle(
                                fontSize: 16,
                                color: MyThemes.darkBluishColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          cursorHeight: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            focusColor: Colors.red,
                            counter: Text(
                              "*Required",
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(),
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
                                  fontSize: 18,
                                  color: MyThemes.darkBluishColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 18, 0, 14),
                          child: Text(
                            "Address: ",
                            style: TextStyle(
                                fontSize: 16,
                                color: MyThemes.darkBluishColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          cursorHeight: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            focusColor: Colors.red,
                            counter: Text(
                              "*Required",
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(),
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
                            "Location: ",
                            style: TextStyle(
                                fontSize: 16,
                                color: MyThemes.darkBluishColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          cursorHeight: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            focusColor: Colors.red,
                            counter: Text(
                              "*Required",
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            hintText: "Cordinates",
                            labelText: "Enter Cordinates",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 18, 0, 14),
                          child: Text(
                            "Description: ",
                            style: TextStyle(
                                fontSize: 16,
                                color: MyThemes.darkBluishColor,
                                fontWeight: FontWeight.bold),
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
