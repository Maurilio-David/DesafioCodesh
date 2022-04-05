// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:desafio/app/controllers/home_controller.dart';
import 'package:desafio/app/data/model/produtos_model.dart';
import 'package:desafio/app/modules/home/pages/widgets/card_prod_widget.dart';
import 'package:desafio/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            /* Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        controller: controller.queryController.value,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          controller.filtrarLista(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Buscar',
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
                      )),
                    ],
                  ),
                ), */
            Obx(() => Flexible(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.getProducts();
                    },
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.dadosFiltrados.value.length,
                        itemBuilder: (context, index) {
                          Produtos produto = controller.dados.value[index];
                          controller.id.add('Produto $index');
                          return CardProdWidget(
                            id: produto.id.toString(),
                            title: produto.title.toString(),
                            filename: produto.filename.toString(),
                            price: double.parse(produto.price.toString()),
                            rating: double.parse(produto.rating.toString()),
                            type: produto.type.toString(),
                          );
                        }),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
