import 'package:flutter/material.dart';
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
      body: FutureBuilder(builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              return _listUser();
            } else {
              return _notFoundWidget;
            }
            break;
          default:
            return _waitingWidget;
        }
      }),
    );
  }

  Widget _listUser() {  
    return Center(child: Text("data"));
  }

  Widget get _notFoundWidget => Center(child: Text("Not Found"));
  Widget get _waitingWidget => Center(child: CircularProgressIndicator());
}
