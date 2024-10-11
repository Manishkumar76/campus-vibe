import 'package:campus_vibe/main.dart';
import 'package:campus_vibe/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../Models/user_model.dart';

class ProfilePictureScreen extends StatefulWidget {
  const ProfilePictureScreen({Key? key}) : super(key: key);

  @override
  _ProfilePictureScreenState createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  File? selectedFile;
  var warning = "";
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickFile() async {
    setWarning("");

    // Pick an image from the gallery or camera
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery, // Or ImageSource.camera for camera
    );

    if (image != null) {
      // Crop the selected image manually without aspect ratio presets
      CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: image.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.indigo,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false, // Allows freeform cropping without constraints
          ),
          IOSUiSettings(
            title: 'Crop Image',
            resetAspectRatioEnabled: true,
            aspectRatioLockEnabled: false, // Allows freeform cropping
          ),
        ],
      );

      if (croppedImage != null) {
        setState(() {
          selectedFile = File(croppedImage.path);
        });

        // Update the profileImage in the User model
        Provider.of<User>(context, listen: false).profileImage = croppedImage.path;
      }
    }
  }

  void setWarning(String value) {
    setState(() {
      warning = value;
    });
  }

  void submission() async {
    if (selectedFile == null) {
      setWarning("Please select a file to upload");
    } else {
      try {
        // Upload the file to the server
        var user = await UserServices().addUser(Provider.of<User>(context, listen: false));

        // Navigate to the home screen after successful upload
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage(title: "Campus Vibe")),
              (Route<dynamic> route) => false,
        );
      } catch (err) {
        // Display an error if the upload fails
        setWarning("Signup failed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              "Signup 3 of 3",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const Text(
              "Upload Profile Picture",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please upload a profile picture to complete your registration",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Attach profile picture",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: _pickFile,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (selectedFile != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  child: Image.file(
                    selectedFile!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (warning != "")
              Center(
                child: Text(
                  warning,
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),
              ),
            const Spacer(), // Spacer directly inside a Column
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: submission,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

}
