// ignore_for_file: prefer_const_constructors

import 'package:desafio/app/controllers/home_controller.dart';
import 'package:desafio/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FormPhotoWidget extends GetView<HomeController> {
  String label;
  RxString imageName = ''.obs;

  FormPhotoWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () async {
                                XFile? imgFile = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                if (imgFile == null) return;
                                controller.imgFile = imgFile;
                                imageName.value = imgFile.name;
                                //widget.sendMessage(imgFile: File(imgFile.path));
                              },
                              icon: Icon(Icons.photo_camera)),
                          labelText: label,
                          labelStyle: TextStyle(color: secondaryColor),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        ),
                        controller:
                            TextEditingController(text: imageName.value),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
