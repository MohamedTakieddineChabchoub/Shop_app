import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_up/componnents/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Body(),
    );
  }
}
