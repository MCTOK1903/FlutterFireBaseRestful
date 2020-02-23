import 'dart:convert';
import 'dart:io';
import 'package:flutter_firebase_restfull/core/model/student.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_firebase_restfull/core/model/user.dart';

class FirebaseSerive {
  static const String FIREBASE_URL =
      "https://flutterfire-fb519.firebaseio.com/";

  Future<List<User>> getUsers() async {
    final response = await http.get("$FIREBASE_URL/users.json");

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonModel = json.decode(response.body);
        final userList =
            jsonModel.map((e) => User.fromJson(e)).toList().cast<User>();
        return userList;
      default:
        return Future.error(response.statusCode);
    }
  }

  Future<List<Student>> getStudents() async {
    final response = await http.get("$FIREBASE_URL/students.json");

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonModel = json.decode(response.body) as Map;
        final studentList = List<Student>();
        jsonModel.forEach((key,value){
          Student student = Student.fromJson(value);
          student.key = key;
          studentList.add(student); 
        });

        

        return studentList;
      default:
        return Future.error(response.statusCode);
    }
  }
}
