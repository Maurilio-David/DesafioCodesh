// ignore_for_file: prefer_const_constructors, prefer_conditional_assignment

import 'dart:io';

import 'package:desafio/app/controllers/home_controller.dart';
import 'package:desafio/app/modules/home/pages/widgets/form_photo_widget.dart';
import 'package:desafio/app/modules/home/pages/widgets/form_widget.dart';
import 'package:desafio/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class DialogAltProdWidget extends GetView<HomeController> {
  String title;
  String? id;
  String filename;
  double rating;
  final GlobalKey<FormState> formUpdateProd = GlobalKey<FormState>();

  DialogAltProdWidget(
      {required this.title,
      required this.rating,
      this.id,
      required this.filename});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          color: primaryColor,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formUpdateProd,
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormPhotoWidget(label: 'Foto'),
                  FormWidget(
                      label: 'Title',
                      controller: controller.titleController,
                      required: true),
                  FormWidget(
                    label: 'Tipo',
                    controller: controller.typeController,
                    required: true,
                  ),
                  FormWidget(
                      label: 'Descrição',
                      controller: controller.descController,
                      required: false),
                  FormWidget(
                      label: 'Preço',
                      controller: controller.priceController,
                      required: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        initialRating: double.parse(rating.toString()),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          controller.newRating = rating;
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (formUpdateProd.currentState!.validate()) {
                            Get.back();
                            if (controller.newRating == null)
                              controller.newRating = rating;
                            controller.updateProd(
                                id.toString(),
                                controller.titleController.text,
                                controller.typeController.text,
                                controller.descController.text,
                                controller.imgFile != null
                                    ? File(controller.imgFile!.path)
                                    : null,
                                filename,
                                controller.priceController.text != ''
                                    ? double.parse(
                                        controller.priceController.text)
                                    : 0,
                                controller.newRating != null
                                    ? double.parse(
                                        controller.newRating.toString())
                                    : 0);
                          }
                        },
                        child: Text('Alterar Produto'),
                        style: ElevatedButton.styleFrom(
                          primary: secondaryColor, // background
                          onPrimary: Colors.white, // foreground
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
