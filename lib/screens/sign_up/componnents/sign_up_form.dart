import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
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
          BuidEmailFormFeild(),
          SizedBox(height: getProportionateScreenHeight(30)),
          BuildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          BuildConfmPasswordField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue 1/2",
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField BuildConfmPasswordField() {
    return TextFormField(
        obscureText: true,
        onSaved: (newValue) => conform_password = newValue,
        onChanged: (value) {
          if (password == conform_password) {
            removeError(error: kMatchPassError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          } else if (password != value) {
            addError(error: kMatchPassError);

            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Confirm Password',
          hintText: 'Re-enter your password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          ),
        ));
  }

  TextFormField BuildPasswordFormField() {
    return TextFormField(
        obscureText: true,
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPassNullError)) {
            setState(() {
              removeError(error: kPassNullError);
            });
          } else if (value.length >= 8 && errors.contains(kShortPassError)) {
            setState(() {
              removeError(error: kShortPassError);
            });
          }
          password = value;
          return null;
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kPassNullError)) {
            setState(() {
              addError(error: kPassNullError);
            });
            return "";
          } else if (value.length < 8 && !errors.contains(kShortPassError)) {
            setState(() {
              addError(error: kShortPassError);
            });
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Password',
          hintText: 'Entrer votre password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          ),
        ));
  }

  TextFormField BuidEmailFormFeild() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue.toString(),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Entrer votre Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
