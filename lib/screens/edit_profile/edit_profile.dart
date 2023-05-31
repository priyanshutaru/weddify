import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:weddify/firebase_helper/firebase-storage/firebase-storage.dart';
import 'package:weddify/models/usermodel/usermodel.dart';
import 'package:weddify/provider/appprovider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;
  void takePicture() async {
    XFile? value = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 40);
    if (value != null) {
      setState(() {
        image = File(value.path);
      });
    }
  }

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Profile",
          style: GoogleFonts.kurale(
            // fontSize: 12,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          image == null
              ? CupertinoButton(
                  onPressed: () {
                    takePicture();
                  },
                  child: const CircleAvatar(
                      radius: 55, child: Icon(Icons.camera_alt)),
                )
              : CupertinoButton(
                  onPressed: () {
                    takePicture();
                  },
                  child: CircleAvatar(
                    backgroundImage: FileImage(image!),
                    radius: 55,
                  ),
                ),
          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: appProvider.getUserInformation.name,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Container(
            height: 45,
            child: ElevatedButton(
              child: Text(
                "Update",
                style: GoogleFonts.kurale(
                    // fontSize: 12,
                    ),
              ),
              onPressed: () async {
                UserModel userModel = appProvider.getUserInformation
                    .copyWith(name: textEditingController.text);
                appProvider.updateUserInfoFirebase(context, userModel, image);
              },
            ),
          ),
        ],
      ),
    );
  }
}
