

import 'package:flutter/material.dart';

class User with ChangeNotifier {
  int id;
  String profileImage;
  String name;
  String email;
  String verifyEmail; // Use camelCase for Dart convention
  String token;
  String password;
  String rollNo; // Use camelCase for Dart convention
  String userType; // Use camelCase for Dart convention
  String gender;
  int departmentId;
  String phone;
  int age;
  String batch;

  User({
     this.id=0,
     this.profileImage='',
     this.name ="",
    this.email= '',
     this.verifyEmail=  '',
     this.token='',
    this.password='',
     this.rollNo='',
     this.userType='',
     this.gender='',
     this.departmentId=0,
     this.phone='',
     this.age=0,
     this.batch="",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0, // Assign default value if null
      profileImage: json['profile_image'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      rollNo: json['roll_no'] ?? '',
      userType: json['user_type'] ?? '',
      gender: json['gender'] ?? '',
      departmentId: json['department_id'] ?? 0, // Assign default value if null
      phone: json['phone'] ?? '',
      age: json['age'] ?? 0, // Assign default value if null
      batch: json['batch'] ?? 0,
      verifyEmail: '',
      token: '', // Assign default value if null
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'profile_image': profileImage,
      'name': name,
      'email': email,
      'verify_email': verifyEmail,
      'token': token,
      'password': password,
      'roll_no': rollNo,
      'user_type': userType,
      'gender':gender,
      'department_id': departmentId,
      'phone': phone,
      'age': age,
      'batch': batch,
    };
  }

  void updateFullName(String value) {
    name = value;
    notifyListeners();
  }

  void updateEmail(String value){
    email= value;
    verifyEmail= value;
    notifyListeners();
  }

  void updateRollNo(String value){
    rollNo= value;
    notifyListeners();
  }

  void updateGender(String value){
    gender= value;
    notifyListeners();
  }

  void setPhoneNumber(String value){
    phone=value;
    notifyListeners();
  }

  void updateAge(int value){
    age=value;
    notifyListeners();
  }

  void updateBatch(String value){
    batch=value;
    notifyListeners();
  }

  void setDepartment(int value){
    departmentId= value;
    notifyListeners();
  }

  void setPassword(String value){
    password= value;
    notifyListeners();
  }
}