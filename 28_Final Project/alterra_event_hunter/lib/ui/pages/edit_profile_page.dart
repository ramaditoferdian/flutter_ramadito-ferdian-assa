// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:alterra_event_hunter/models/user_model.dart';
import 'package:alterra_event_hunter/providers/auth_provider.dart';
import 'package:alterra_event_hunter/shared/theme.dart';
import 'package:alterra_event_hunter/ui/widgets/loading_button.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController fullNameController = TextEditingController(text: '');

  TextEditingController phoneNumberController = TextEditingController(text: '');
  TextEditingController roleController = TextEditingController(text: '');

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();

    Provider.of<AuthProvider>(context, listen: false).getUserActive();
  }

  @override
  Widget build(BuildContext context) {
    // bool isLoading = AuthProvider().authState == AuthState.loading;
    // bool isLoading = false;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UserModel user = authProvider.user;

    emailController.text = user.email!;
    fullNameController.text = user.fullName!;
    phoneNumberController.text = user.phoneNumber!.toString();
    roleController.text = user.role!;

    handleUpdateProfile() async {
      setState(() {
        isLoading = true;
      });

      bool isAdaPerubahan = fullNameController.text != user.fullName ||
          phoneNumberController.text != user.phoneNumber.toString();

      try {
        if (isAdaPerubahan &&
            await authProvider.updateProfile(
              fullName: fullNameController.text,
              phoneNumber: int.parse(phoneNumberController.text),
            )) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              backgroundColor: successColor,
              content: Text(
                'Profile Berhasil Update',
                textAlign: TextAlign.center,
              ),
            ),
          );
          Future.delayed(Duration(milliseconds: 2500), () async {
            Navigator.pop(context);
          });
        } else if (!isAdaPerubahan) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              backgroundColor: alertColor,
              content: Text(
                'Tidak ada perubahan',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        String handlingErrorCode(String errorCode) {
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
                color: disabledColor,
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
                        enabled: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        style: secondaryTextStyle,
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

    Widget roleInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Role',
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
                color: disabledColor,
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
                        enabled: false,
                        keyboardType: TextInputType.name,
                        controller: roleController,
                        style: secondaryTextStyle,
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

    Widget updateButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              handleUpdateProfile();
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
            'Update Profile',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 35, 20, 0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Back');
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF4FFFE),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xff32B0C7),
                        ),
                      ),
                    ),
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    emailInput(),
                    roleInput(),
                    fullNameInput(),
                    phoneNumberInput(),
                    isLoading ? LoadingButton() : updateButton(),
                  ],
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
