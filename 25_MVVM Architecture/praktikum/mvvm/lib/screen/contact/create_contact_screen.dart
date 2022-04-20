// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm/model/contact_model.dart';
import 'package:mvvm/screen/contact/contact_view_model.dart';
import 'package:mvvm/utils/random_hex_color.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateContactScreen extends StatefulWidget {
  const CreateContactScreen({Key? key}) : super(key: key);

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  //key for form

  @override
  Widget build(BuildContext context) {
    ContactViewModel contactViewModel = Provider.of<ContactViewModel>(context);

    void addContact() {
      contactViewModel.addNewContact(
        ContactModel(
          id: contactViewModel.contacts.length + 1,
          name: nameController.text,
          phoneNumber: phoneNumberController.text,
          // avatarColor: contactViewModel.generateRandomHexColor(),
          avatarColor: RandomHexColor().generateRandomHexColor(),
        ),
      );
    }

    Widget inputNameField() {
      return TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          hintText: 'Enter Name',
          prefixIcon: Icon(
            Icons.person,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
            //allow upper and lower case alphabets and space
            return "Enter Correct Name";
          } else if (value.length > 20) {
            return "Name too long";
          }
          {
            return null;
          }
        },
      );
    }

    Widget inputPhoneNumberField() {
      return TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        controller: phoneNumberController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Enter Phone Number',
          prefixIcon: Icon(
            Icons.phone,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty ||
              !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                  .hasMatch(value)) {
            //  r'^[0-9]{10}$' pattern plain match number with length 10
            return "Enter Correct Phone Number";
          } else if (value.length > 15) {
            return "Phone Number too long";
          } else {
            return null;
          }
        },
      );
    }

    Widget buttonSumbit() {
      return ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            //check if form data are valid,
            // your process task ahed if all data are valid

            setState(
              () {
                addContact();
              },
            );

            bool hasilResponse = await contactViewModel.postContact(
              ContactModel(
                id: contactViewModel.contacts.length,
                name: nameController.text,
                phoneNumber: phoneNumberController.text,
                avatarColor: RandomHexColor().generateRandomHexColor(),
              ),
            );

            if (hasilResponse) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Berhasil POST'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('id    : ${contactViewModel.contacts.length}'),
                        Text('name  : ${nameController.text}'),
                        Text('phone : ${phoneNumberController.text}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/',
                            (route) => false,
                          );
                        },
                        child: Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Fill in all the fields'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Text("Submit"),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Create New Contact'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 50,
            ),
            child: Form(
              key: formKey, //key for form
              child: Column(
                children: [
                  Container(
                    // height: 215,
                    // color: Colors.amber,
                    child: Column(
                      children: [
                        inputNameField(),
                        SizedBox(
                          height: 20,
                        ),
                        inputPhoneNumberField(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  buttonSumbit(),
                ],
              ),
            ),
          ),
        ));
  }
}
