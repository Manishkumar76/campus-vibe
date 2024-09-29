import 'package:campus_vibe/Authentication/SingnUp/verificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/user_model.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  TextEditingController businessContoller = TextEditingController();
  TextEditingController InformalContoller = TextEditingController();
  TextEditingController adressContoller = TextEditingController();
  TextEditingController cityContoller = TextEditingController();
  TextEditingController StateContoller = TextEditingController();

  var warning = "";
  void setWarning(String message) {
    setState(() {
      warning = message;
    });
  }

  void continueToNext() {
    if (businessContoller.text.isEmpty ||
        InformalContoller.text.isEmpty ||
        adressContoller.text.isEmpty ||
        cityContoller.text.isEmpty ||
        StateContoller.text.isEmpty ) {
      setWarning("Every Fields are Required!");
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const VerificationScreen()));
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
              const SizedBox(
                height: 100,
              ),
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
                controller: businessContoller,
                onChanged: (value) {

                  setState(() {
                    businessContoller = value as TextEditingController;
                  });
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
              TextField(
                controller: InformalContoller,
                onChanged: (value) {

                  setState(() {
                    InformalContoller = value as TextEditingController;
                  });
                  setWarning("");
                },
                decoration: InputDecoration(
                  prefixIcon:const Icon(Icons.book),
                  hintText: 'Department',
                  filled: true,
                  fillColor: const Color(0xFFEAE8E4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: adressContoller,
                onChanged: (value) {
                  setState(() {
                    adressContoller = value as TextEditingController;
                  });
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
              TextField(
                controller: cityContoller,
                onChanged: (value) {

                  setState(() {
                    cityContoller = value as TextEditingController;
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
              ),
              const SizedBox(height: 10),
              TextField(
                controller: StateContoller,
                onChanged: (value) {

                  setState(() {
                    StateContoller = value as TextEditingController;
                  });
                  setWarning("");
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_circle_outlined),
                  hintText: 'Age',
                  filled: true,
                  fillColor: const Color(0xFFEAE8E4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: warning == ""
                    ? null
                    : Text(
                        warning,
                        style: const TextStyle(fontSize: 12, color: Colors.red),
                      ),
              ),
            const SizedBox( height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
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
