import 'package:flutter/material.dart';
import 'package:shop_app/screens/login_success/componnents/body.dart';

class LoginSucessScreen extends StatelessWidget {
  static String routeName = "/login_sucess";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text(
          'Login Sucess',
          style: TextStyle(fontSize: 17, color: Colors.black54),
        ),
      ),
      body: Body(),
    );
  }
}
