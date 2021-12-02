import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  dynamic file;
  late String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Add Image here"),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.deepPurple)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (file != null)
                        ? Image.file(
                            file,
                            width: double.infinity,
                            height: 400,
                            fit: BoxFit.contain,
                          )
                        : Expanded(
                            child: Center(child: Text('No Image Selected'))),
                    ElevatedButton(
                        onPressed: () {
                          imagePicker();
                        },
                        child: Text("Select Image")),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  uploadImage();
                },
                child: Text("Upload Image"))
          ],
        ),
      ),
    );
  }

  void imagePicker() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
    }
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    //Select Image
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    var file = File(image!.path);

    if (image != null) {
      //Upload to Firebase
      var snapshot =
          await _storage.ref().child('folderName/imageName').putFile(file);

      var downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
      });
    } else {
      print('No Path Received');
    }
  }
}
