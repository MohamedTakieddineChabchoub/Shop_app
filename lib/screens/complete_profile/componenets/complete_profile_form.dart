import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String? firstName;
  String? phoneNumber;
  String? address;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(50)),
          BuildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          BuildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          BuildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          BuildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField BuildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => address = newValue.toString(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);

          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: 'Adress',
        hintText: 'Enter your adrress',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Location point.svg",
        ),
      ),
    );
  }

  TextFormField BuildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty || value.length != 8) {
          addError(error: kPhoneNumberNullError);

          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Phone.svg",
        ),
      ),
    );
  }

  TextFormField BuildLastNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => firstName = newValue.toString(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLastNamelNullError);
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kLastNamelNullError);

          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: 'Last Name',
        hintText: 'Enter your last name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/User.svg",
        ),
      ),
    );
  }

  TextFormField BuildFirstNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => firstName = newValue.toString(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);

          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: 'First Name',
        hintText: 'Enter your first name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/User.svg",
        ),
      ),
    );
  }
}
