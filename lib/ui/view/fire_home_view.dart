import 'package:flutter/material.dart';
import 'package:flutter_firebase_restfull/core/model/student.dart';
import 'package:flutter_firebase_restfull/core/model/user.dart';
import 'package:flutter_firebase_restfull/core/service/firebase_service.dart';

class FireHomeView extends StatefulWidget {
  @override
  _FireHomeViewState createState() => _FireHomeViewState();
}

class _FireHomeViewState extends State<FireHomeView> {
  FirebaseSerive firebaseSerive;

  @override
  void initState() {
    super.initState();
    firebaseSerive = FirebaseSerive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: studentFutureBuilder,
    );
  }

  Widget get studentFutureBuilder => FutureBuilder<List<Student>>(
      future: firebaseSerive.getStudents(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              return _listStudent(snapshot.data);
            } else {
              return _notFoundWidget;
            }
            break;
          default:
            return _waitingWidget;
        }
      });

  Widget get userFutureBuilder => FutureBuilder<List<User>>(
      future: firebaseSerive.getUsers(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              return _listUser(snapshot.data);
            } else {
              return _notFoundWidget;
            }
            break;
          default:
            return _waitingWidget;
        }
      });

  Widget _listUser(List<User> list) {
    return Center(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return _userCard(list[index]);
            }));
  }

   Widget _listStudent(List<Student> list) {
    return Center(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return _studentCard(list[index]);
            }));
  }

  Widget _userCard(User user) {
    return Card(
      child: ListTile(
        title: Text(user.name),
      ),
    );
  }

  Widget _studentCard(Student student) {
    return Card(
      child: ListTile(
        title: Text(student.name),
        subtitle: Text(student.name),
      ),
    );
  }

  Widget get _notFoundWidget => Center(child: Text("Not Found"));
  Widget get _waitingWidget => Center(child: CircularProgressIndicator());
}
