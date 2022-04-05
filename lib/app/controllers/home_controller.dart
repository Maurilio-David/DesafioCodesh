// ignore_for_file: invalid_use_of_protected_member, prefer_is_empty, prefer_if_null_operators, prefer_const_literals_to_create_immutables, prefer_const_constructors, unrelated_type_equality_checks

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio/app/data/model/produtos_model.dart';
import 'package:desafio/app/data/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;
  HomeController(this.homeRepository);
  var queryController = TextEditingController(text: '').obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  double? newRating;

  /* int i = 0; */
  List id = [];
  var dados = [].obs;
  var dadosFiltrados = [].obs;
  XFile? imgFile;
  @override
  onInit() {
    super.onInit();
    getProducts();
    getProducts();
  }

  /* salvando() async {
    dados.value.forEach((element) {
      FirebaseFirestore.instance.collection("produtos").doc("produto $i").set({
        "id": "produto $i",
        "title": element.title,
        "type": element.type,
        "description": element.description,
        "filename": element.filename,
        "height": element.height,
        "width": element.width,
        "price": element.price,
        "rating": element.rating
      });
      i = i + 1;
    });
  } */

  getProducts() async {
    dados.clear();
    await homeRepository.getProducts().then((value) {
      if (value.length > 0) {
        dados.value.addAll(value);
      }
    });
    dadosFiltrados.value = dados.value;
    dadosFiltrados.refresh();
  }

  updateProd(String id, String title, String type, String description,
      File? imgFile, String filename, double price, double rating) async {
    String? res = await homeRepository.updateProd(id, title, type, description,
        filename, price, rating, imgFile != null ? imgFile : null);
    if (res == 'Sucesso') {
      getProducts();
    }
  }

  deleteProd(id) async {
    var res = await homeRepository.deleteProd(id);
    if (res == 'Sucesso') {
      getProducts();
    }
  }
  /* obterDados() async {
    await homeRepository.obterDados().then((value) {
      if (value.length > 0) {
        dados.value.addAll(value);
      }
    });
    dadosFiltrados.value = dados.value;
    /* salvando(); */
  } */

  filtrarLista(String query) {
    if (query == '') {
      dadosFiltrados.value = RxList.from(dados.value);
    } else {
      dadosFiltrados.value.retainWhere((element) {
        return (element.title
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            element.type
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()));
      });
      dadosFiltrados.refresh();
    }
  }

  /* limparFiltro() {
    dadosFiltrados.value = RxList.from(dados);
    this.dadosFiltrados.refresh();
  } */
}
