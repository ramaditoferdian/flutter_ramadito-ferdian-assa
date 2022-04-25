// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:alterra_event_hunter/providers/auth_provider.dart';
import 'package:alterra_event_hunter/shared/theme.dart';
import 'package:alterra_event_hunter/ui/widgets/loading_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController fullNameController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController verfifyPasswordController =
      TextEditingController(text: '');

  String? roleUserGroupValue = '';

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      try {
        if (await authProvider.signUp(
          role: roleUserGroupValue!,
          email: emailController.text,
          password: passwordController.text,
          fullName: fullNameController.text,
          phoneNumber: int.parse(phoneNumberController.text),
        )) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              backgroundColor: successColor,
              content: Text(
                'Berhasil Daftar',
                textAlign: TextAlign.center,
              ),
            ),
          );
          Future.delayed(Duration(seconds: 2), () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 2),
                backgroundColor: successColor,
                content: Text(
                  'Halaman dialihkan',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          });
          Future.delayed(Duration(seconds: 5), () async {
            await Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          });
        }
      } on FirebaseAuthException catch (e) {
        String handlingErrorCode(String errorCode) {
          if (errorCode == 'email-already-in-use') {
            return 'Email Already in Use';
          }

          return errorCode;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              handlingErrorCode(e.code),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget logoTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          bottom: 20,
        ),
        height: 80,
        child: Image(image: AssetImage('assets/img/event_hunter_logo.png')),
      );
    }

    Widget title() {
      return Container(
        child: Text(
          'Sign Up',
          style: mainTextStyle.copyWith(
            fontSize: 48,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget selectRole() {
      return Container(
        // color: Colors.amber,
        margin: EdgeInsets.only(top: 20),

        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      activeColor: primaryColor,
                      value: 'Event Organizer',
                      groupValue: roleUserGroupValue,
                      onChanged: (String? val) {
                        roleUserGroupValue = val;
                        setState(() {});
                        print(roleUserGroupValue);
                      },
                    ),
                    Text('Event Organizer'),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: primaryColor,
                      value: 'Customer',
                      groupValue: roleUserGroupValue,
                      onChanged: (String? val) {
                        roleUserGroupValue = val;
                        setState(() {});
                        print(roleUserGroupValue);
                      },
                    ),
                    Text('Customer'),
                  ],
                ),
              ],
            ),
            // Container(
            //   // color: Colors.amber,
            //   // height: 10,
            //   child: roleUserGroupValue == ''
            //       ? Text('Select Role Required',
            //           style: TextStyle(color: alertColor, fontSize: 12))
            //       : Text(''),
            // ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor1,
                borderRadius: BorderRadius.circular(
                  12,
                ),
                border: Border.all(
                  color: greyColor,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        style: secondaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: subtitleTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email Required";
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Enter Correct Email';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget fullNameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor1,
                borderRadius: BorderRadius.circular(
                  12,
                ),
                border: Border.all(
                  color: greyColor,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: fullNameController,
                        style: secondaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Full Name',
                          hintStyle: subtitleTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            //allow upper and lower case alphabets, space, and number
                            return "Full Name Required";
                          } else if (!RegExp(r'^[a-z A-Z 0-9]+$')
                              .hasMatch(value)) {
                            return "Enter Correct Name";
                          } else if (value.length > 50) {
                            return "Name too long";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget phoneNumberInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone Number',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor1,
                borderRadius: BorderRadius.circular(
                  12,
                ),
                border: Border.all(
                  color: greyColor,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        controller: phoneNumberController,
                        style: secondaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Phone Number',
                          hintStyle: subtitleTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Phone Number Required";
                          } else if (value.length <= 9) {
                            return "Phone Number too short";
                          } else if (value.length > 20) {
                            return "Phone Number too long";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor1,
                borderRadius: BorderRadius.circular(
                  12,
                ),
                border: Border.all(
                  color: greyColor,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        style: secondaryTextStyle,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Required";
                          } else if (value.length < 8) {
                            return "Password must be more than 8 characters";
                          } else if (value.length > 32) {
                            return "Password must be less than 32 characters";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget verifyPasswordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify Password',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor1,
                borderRadius: BorderRadius.circular(
                  12,
                ),
                border: Border.all(
                  color: greyColor,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: verfifyPasswordController,
                        style: secondaryTextStyle,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Verify Password',
                          hintStyle: subtitleTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Verify Password Required";
                          } else if (value != passwordController.text) {
                            return "Password and Verify Password must be match";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signUpButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              if (roleUserGroupValue != '') {
                handleSignUp();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: alertColor,
                    content: Text(
                      'Select Role First',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Sign Up',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(
          top: 50,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, '/sign-in');
                Navigator.pushNamedAndRemoveUntil(
                    context, '/sign-in', (route) => false);
              },
              child: Text(
                'Sign In',
                style: mainTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              logoTitle(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin * 2),
                padding: EdgeInsets.all(defaultMargin),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(
                    45,
                  ),
                  border: Border.all(
                    color: greyColor,
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 2), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                  ],
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      title(),
                      selectRole(),
                      emailInput(),
                      fullNameInput(),
                      phoneNumberInput(),
                      passwordInput(),
                      verifyPasswordInput(),
                      isLoading ? LoadingButton() : signUpButton(),
                      footer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: footer(),
    );
  }
}
