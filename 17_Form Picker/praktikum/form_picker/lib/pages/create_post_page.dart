// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:form_picker/pages/preview_post_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  DateTime? _publishDate;
  final currentDate = DateTime.now();

  Color? _currentColor;

  File? image;

  TextEditingController captionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Text('Create Post'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(30),
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cover',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    pickImage();
                  },
                  child: Text('Pilih File'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Publish At',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () async {
                  print('pilih tanggal');

                  final selectDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(currentDate.year + 10),
                  );
                  setState(() {
                    if (selectDate != null) {
                      _publishDate = selectDate;
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  // height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _publishDate != null
                      ? Text(DateFormat('dd-MM-yyyy').format(_publishDate!))
                      : Text('dd-MM-yyyy'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Color Theme',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () async {
                  print('pilih warna');
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Pick a color'),
                        content: BlockPicker(
                          pickerColor: Colors.white,
                          onColorChanged: (color) {
                            setState(() {
                              _currentColor = color;
                            });
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              print(_currentColor.toString());
                            },
                            child: Text('Save'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  // height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: _currentColor ?? Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _currentColor != null
                      ? Text(_currentColor.toString())
                      : Text('Pick a color'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Caption',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              TextFormField(
                maxLines: 8,
                controller: captionController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please fill this field";
                  } else {
                    return null;
                  }
                },
              ),

              // note : Button Preview
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  // width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      if ((formKey.currentState!.validate()) &&
                          (image != null) &&
                          (_publishDate != null) &&
                          (_currentColor != null)) {
                        //check if form data are valid,
                        // your process task ahed if all data are valid

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return PreviewPostPage(
                                image: image,
                                publishDate: DateFormat('dd-MM-yyyy')
                                    .format(_publishDate!),
                                colorTheme: _currentColor,
                                captionText: captionController.text,
                              );
                            },
                          ),
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
                    child: Text('Simpan'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// Container(
//                 height: 250,
//                 color: Colors.red,
//                 child: image != null
//                     ? Image.file(
//                         image!,
//                         height: 250,
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                       )
//                     : SizedBox(),
//               )