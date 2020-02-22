import 'package:flutter/material.dart';
import 'package:flutter_firebase_restfull/ui/view/fire_home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
     title: "MyApp",
     home: FireHomeView(),
    );
  }
}