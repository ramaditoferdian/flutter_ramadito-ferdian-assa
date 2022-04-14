// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_provider/models/contact_model.dart';
import 'package:shared_preferences_provider/providers/contact_provider.dart';

class CreateContactPage extends StatefulWidget {
  const CreateContactPage({Key? key}) : super(key: key);

  @override
  State<CreateContactPage> createState() => _CreateContactPageState();
}

class _CreateContactPageState extends State<CreateContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  //key for form

  @override
  Widget build(BuildContext context) {
    ContactProvider contactProvider = Provider.of<ContactProvider>(context);

    Random random = new Random();

    String generateRandomHexColor() {
      int length = 6;
      String chars = '0123456789ABCDEF';
      String hex = '0xff';
      while (length-- > 0) hex += chars[(random.nextInt(16)) | 0];
      return hex;
    }

    void addContact() {
      final _random = Random();
      contactProvider.addNewContact(
        ContactModel(
          id: contactProvider.contacts.length + 1,
          name: nameController.text,
          phoneNumber: phoneNumberController.text,
          avatarColor: int.parse(generateRandomHexColor()),
          // avatarColor:
          //     Colors.primaries[_random.nextInt(Colors.primaries.length)]
          //             [_random.nextInt(9) * 100] ??
          //         Colors.amber,
        ),
      );
      contactProvider.sortingContact();
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

            await Navigator.pushNamedAndRemoveUntil(
              context,
              '/',
              (route) => false,
            );
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
