
import 'package:flutter/material.dart';
import 'walkthrough.dart';
import 'package:flutter/widgets.dart';

import 'dart:async';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => Walkthrogh()
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 190.0,
              height: 190.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage( image: AssetImage('assets/image/icom.png'),fit: BoxFit.fill,)


              ),


            ),

          ],
        ),
      ),
    );
  }
}
