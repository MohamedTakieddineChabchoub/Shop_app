import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/components/body.dart';

import '../../size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/spllash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Body(),
    );
  }
}
