import 'package:campus_vibe/Authentication/SingnUp/setProfilePicture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/user_model.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  TextEditingController rollNoController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  int? selectedDepartmentId; // Store the selected department ID here
  List<Map<String, dynamic>> departments = [
    {'id': 1, 'name': 'Computer Science'},
    {'id': 2, 'name': 'Electrical Engineering'},
    {'id': 3, 'name': 'Mechanical Engineering'},
    {'id': 4, 'name': 'Civil Engineering'},
    // Add more departments as needed
  ];

  String? selectedGender; // Store the selected gender here
  List<String> genderOptions = ['Male', 'Female', 'Other'];

  String warning = "";
  void setWarning(String message) {
    setState(() {
      warning = message;
    });
  }

  void continueToNext() {
    if (rollNoController.text.isEmpty ||
        selectedDepartmentId == null ||
        batchController.text.isEmpty ||
        selectedGender == null) {
      setWarning("Every field is required!");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProfilePictureScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<User>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: ListView(
            children: [
              const SizedBox(height: 100),
              const Text('Signup 2 of 3',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey)),
              const SizedBox(height: 4),
              const Text('Basic Details',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const SizedBox(height: 20),
              TextField(
                controller: rollNoController,
                onChanged: (value) {
                  userData.rollNo = value;
                  setWarning("");
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.sticky_note_2_outlined),
                  hintText: 'Roll Number',
                  filled: true,
                  fillColor: const Color(0xFFEAE8E4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<int>(
                value: selectedDepartmentId,
                onChanged: (value) {
                  setState(() {
                    selectedDepartmentId = value;
                    userData.departmentId = value!; // Update userData with the selected ID
                  });
                  setWarning("");
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.book),
                  hintText: 'Department',
                  filled: true,
                  fillColor: const Color(0xFFEAE8E4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: departments.map((department) {
                  return DropdownMenuItem<int>(
                    value: department['id'],
                    child: Text(department['name']),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: batchController,
                onChanged: (value) {
                  userData.batch = value;
                  setWarning("");
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.batch_prediction),
                  hintText: 'Batch Year',
                  filled: true,
                  fillColor: const Color(0xFFEAE8E4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                    userData.gender = value!; // Update userData with the selected gender
                  });
                  setWarning("");
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.people_alt_outlined),
                  hintText: 'Gender',
                  filled: true,
                  fillColor: const Color(0xFFEAE8E4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: genderOptions.map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              if (warning.isNotEmpty)
                Center(
                  child: Text(
                    warning,
                    style: const TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
              const SizedBox(height: 40),
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
                      onPressed: () {
                        continueToNext();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Continue',
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
      ),
    );
  }
}
