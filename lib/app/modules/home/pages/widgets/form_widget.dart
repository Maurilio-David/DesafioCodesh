// ignore_for_file: prefer_const_constructors

import 'package:desafio/app/themes/app_themes.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  String label;
  TextEditingController controller;
  bool required;
  FormWidget(
      {required this.label, required this.controller, required this.required});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: required
          ? EdgeInsets.only(left: 10, right: 3)
          : EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: controller,
                    validator: required
                        ? (value) {
                            if (value == '') {
                              return 'Campo Obrigatório';
                            }
                          }
                        : null,
                    decoration: InputDecoration(
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
                  ),
                ),
              ),
              required
                  ? Container(
                      color: Colors.transparent,
                      child: Text(
                        '*',
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    )
                  : Container()
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
