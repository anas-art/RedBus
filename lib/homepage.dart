import 'package:flutter/material.dart';
import 'package:redbusclone/authntication.dart';
import 'package:redbusclone/database.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key,this.auth,this.userId,this.logoutCallback}):super(key:key);
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  Databasemethods databaseMethods =new Databasemethods();


  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Home Page"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.exit_to_app), onPressed: signOut)
      ],
    ),
      body: Container(
        child: Center(
          child: Text("Home screen"),
        ),
      ),
    );
  }
}
