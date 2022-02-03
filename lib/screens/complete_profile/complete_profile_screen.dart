import 'package:flutter/material.dart';
import 'package:shop_app/screens/complete_profile/componenets/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Sign Up",
              style: TextStyle(color: Colors.black, fontSize: 15))),
      body: Body(),
    );
  }
}
