// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_input_button/models/contact.dart';
import 'package:form_input_button/pages/home_page.dart';

class CreateNewContactPage extends StatefulWidget {
  const CreateNewContactPage({Key? key}) : super(key: key);

  @override
  State<CreateNewContactPage> createState() => _CreateNewContactPageState();
}

class _CreateNewContactPageState extends State<CreateNewContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  List<String> listDropdown = [
    'Informatika',
    'RPL',
    'Data Science',
  ];

  String? selectedDropdownItem;

  List<Map<String, dynamic>> data = [
    {
      'id': 'Coding',
      'value': false,
    },
    {
      'id': 'Game',
      'value': false,
    },
    {
      'id': 'Study',
      'value': false,
    },
  ];

  List<String> selectedCheckbox = [];

  String? genderGroupValue = '';

  final formKey = GlobalKey<FormState>();
  //key for form
  @override
  Widget build(BuildContext context) {
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
                        TextFormField(
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
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                              //allow upper and lower case alphabets and space
                              return "Enter Correct Name";
                            } else if (value.length > 20) {
                              return "Name too long";
                            }
                            {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
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
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 'Man',
                                    groupValue: genderGroupValue,
                                    onChanged: (String? val) {
                                      genderGroupValue = val;
                                      setState(() {});
                                      print(genderGroupValue);
                                    },
                                  ),
                                  Text('Man'),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 'Woman',
                                    groupValue: genderGroupValue,
                                    onChanged: (String? val) {
                                      genderGroupValue = val;
                                      setState(() {});
                                      print(genderGroupValue);
                                    },
                                  ),
                                  Text('Woman'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            value: selectedDropdownItem,
                            items: listDropdown.map(buildMenuItem).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                this.selectedDropdownItem = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                title: Text(data[index]['id'].toString()),
                                value: data[index]['value'],
                                onChanged: (value) {
                                  setState(() {
                                    data[index]['value'] = value;

                                    print(data[index]['id']);
                                    print(data[index]['value']);

                                    if (data[index]['value'] == true) {
                                      selectedCheckbox
                                          .add(data[index]['id'].toString());
                                    } else {
                                      selectedCheckbox
                                          .remove(data[index]['id'].toString());
                                    }

                                    print(selectedCheckbox);
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        //check if form data are valid,
                        // your process task ahed if all data are valid

                        setState(
                          () {
                            listOfContact.add(
                              Contact(
                                name: nameController.text,
                                phoneNumber: phoneNumberController.text,
                                gender: genderGroupValue,
                                jurusan: selectedDropdownItem,
                                hobi: selectedCheckbox,
                              ),
                            );

                            Navigator.pop(context);
                          },
                        );

                        // await Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => HomePage()));

                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => HomePage(),
                          ),
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
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

DropdownMenuItem<String> buildMenuItem(String item) {
  return DropdownMenuItem(
    value: item,
    child: Text(item),
  );
}
