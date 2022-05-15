// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:alterra_event_hunter/providers/auth_provider.dart';
import 'package:alterra_event_hunter/shared/theme.dart';
import 'package:alterra_event_hunter/ui/widgets/loading_button.dart';
import 'package:alterra_event_hunter/utils/form_field_validator.dart';
import 'package:alterra_event_hunter/utils/format_currency.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // bool isLoading = AuthProvider().authState == AuthState.loading;
    // bool isLoading = false;
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      try {
        if (await authProvider.signIn(
          email: emailController.text,
          password: passwordController.text,
        )) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              backgroundColor: successColor,
              content: Text(
                'Berhasil Login',
                textAlign: TextAlign.center,
              ),
            ),
          );
          Future.delayed(Duration(seconds: 3), () async {
            if (authProvider.user.role == 'Customer') {
              await Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            } else if (authProvider.user.role == 'Event Organizer') {
              await Navigator.pushNamedAndRemoveUntil(
                  context, '/profile-page', (route) => false);
            }
          });
        }
      } on FirebaseAuthException catch (e) {
        String handlingErrorCode(String errorCode) {
          if (errorCode == 'user-not-found') {
            return 'User Not Found';
          } else if (errorCode == 'wrong-password') {
            return 'Wrong Password';
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
          'Log in',
          style: mainTextStyle.copyWith(
            fontSize: 48,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 40),
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

    Widget forgotPassword() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          // bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Forget password? ',
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, '/sign-up');
                print('forget password');
              },
              child: Text(
                'click here',
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

    Widget logInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              handleSignIn();
            }
            FocusManager.instance.primaryFocus?.unfocus();
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Log In',
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
              'Dont\'t have an account? ',
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text(
                'Sign Up',
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
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
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
                        emailInput(),
                        passwordInput(),
                        forgotPassword(),
                        isLoading ? LoadingButton() : logInButton(),
                        footer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: footer(),
    );
  }
}
