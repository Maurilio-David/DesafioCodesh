// ignore_for_file: override_on_non_overriding_member, use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:desafio/app/controllers/home_controller.dart';
import 'package:desafio/app/modules/home/pages/widgets/dialog_altera_prod_widget.dart';
import 'package:desafio/app/modules/home/pages/widgets/form_photo_widget.dart';
import 'package:desafio/app/modules/home/pages/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../../../themes/app_themes.dart';

class CardProdWidget extends GetView<HomeController> {
  String title;
  String id;
  String type;
  String filename;
  double price;
  double rating;

  CardProdWidget(
      {required this.type,
      required this.filename,
      required this.id,
      required this.price,
      required this.rating,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                flex: 1,
                onPressed: (context) {
                  Get.dialog(DialogAltProdWidget(
                    title: title,
                    rating: double.parse(rating.toString()),
                    filename: filename,
                    id: id,
                  ));
                },
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Alterar',
              ),
              SlidableAction(
                flex: 1,
                onPressed: (context) {
                  Get.dialog(Dialog(
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(10),
                      child: IntrinsicHeight(
                          child: Column(
                        children: [
                          Text(
                            'Tem certeza que deseja excluir: $title ?',
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    'Cancelar',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.deleteProd(id);
                                  },
                                  child: Text(
                                    'Excluir',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ))
                            ],
                          )
                        ],
                      )),
                    ),
                  ));
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Remover',
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(10)),
            width: Get.width,
            height: 120,
            padding: EdgeInsets.all(10),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/desafio-coodesh-e6399.appspot.com/o/' +
                        filename +
                        '?alt=media&token=1198546b-be70-4913-bb47-1e1b85d151b7',
                    width: 120,
                    height: 120,
                    fit: BoxFit.fill,
                  ),
                  /* Image.asset(
                    'assets/images/' + filename,
                    width: 120,
                    height: 120,
                    fit: BoxFit.fill,
                  ), */
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              title,
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              type,
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBarIndicator(
                              rating: double.parse(rating.toString()),
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 25.0,
                              direction: Axis.horizontal,
                            ),
                            Text(
                              'R\$ ' + price.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ]),
          )),
    );
  }
}
