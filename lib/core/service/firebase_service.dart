import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_firebase_restfull/core/model/user.dart';

class FirebaseSerive {
  static const String FIREBASE_URL =
      "https://flutterfire-fb519.firebaseio.com/";

  Future<List<User>> getUsers() async {
    final response = await http.get(FIREBASE_URL);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonModel = json.decode(response.body);
        final userList = jsonModel as List<User>;
        return userList;
      default:
        return Future.error(response.statusCode);
    }
  }
}
