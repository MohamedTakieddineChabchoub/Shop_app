import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/constants.dart';

import '../../../size_config.dart';
import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text("complete Profile", style: headingStyle),
              Text(
                "Complete your details or continue \nwith social media",
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              CompleteProfileForm(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Text(
                "By continuing you confirm that you agree \nwith our term an condition ",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
