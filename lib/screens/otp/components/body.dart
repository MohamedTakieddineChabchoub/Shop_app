import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/otp/components/otp_form.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

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
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "OTP Verrification",
                style: headingStyle,
              ),
              Text("We sent you a code to +1 898 860 ***"),
              BuilderTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Resent OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row BuilderTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired  "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30),
          builder: <int>(context, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
