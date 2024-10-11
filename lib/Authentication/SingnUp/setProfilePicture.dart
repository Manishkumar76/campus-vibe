import 'package:campus_vibe/main.dart';
import 'package:campus_vibe/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import '../../Models/user_model.dart';


class ProfilePictureScreen extends StatefulWidget {
  const ProfilePictureScreen({Key? key}) : super(key: key);

  @override
  _ProfilePictureScreenState createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  String? selectedFile= null;
   var warning="";
  Future<void> _pickFile() async {
    setWarning("");
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpeg, jpg, png'],
    );

    if (result != null) {
      setState(() {
        selectedFile = result.paths.single;
      });

      // Update the registration proof in UserData
      Provider.of<User>(context, listen: false).profileImage = result.files.single.path!;
    }
  }

  void setWarning(String value){
    setState(() {
      warning=value;
    });
  }

  void submission() async{
    if(selectedFile==null){
      setWarning("Please select a file to upload");
    }
    else{
      // Upload the file to the server
      try {
       var user= await UserServices().addUser(Provider.of<User>(context, listen: false));

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage(title: "Campus Vibe")),
              (Route<dynamic> route) => false, // This removes all the previous routes
        );
      }
      catch(err){
        // Once the file is uploaded, navigate to the home screen
        setWarning("signup failed");
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<User>(context);

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
                  "Attach proof of registration",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(width: 10,),
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

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(title:Text(
                selectedFile ?? '',
                style: const TextStyle(color: Colors.black),
              ),
              trailing: selectedFile != null?
                IconButton(
                icon: const Icon(Icons.close),
        onPressed: () {
          setState(() {
            selectedFile = null;

          });
        },
      ):null,
              )
            ),
           Center(child: warning==""?null:Text(warning,style: const TextStyle(fontSize: 12,color: Colors.red),),),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back)),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {

                      submission();
                    },
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