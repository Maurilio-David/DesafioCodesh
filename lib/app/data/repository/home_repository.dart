import 'dart:io';

import 'package:desafio/app/data/model/produtos_model.dart';
import 'package:desafio/app/data/provider/home_provider.dart';
import 'package:get/get.dart';

class HomeRepository {
  final HomeProvider homeProvider;
  HomeRepository(this.homeProvider);

  /* late FirebaseFirestore db; */

  Future<List<Produtos>> getProducts() async {
    final list = <Produtos>[].obs;
    list.clear();
    var products = await homeProvider.getProducts();
    products.forEach((e) {
      list.add(Produtos.fromJson(e));
    });
    return list;
  }

  Future<String> updateProd(
    String id,
    String title,
    String type,
    String description,
    String filename,
    double price,
    double rating,
    File? imgFile,
  ) async {
    String res = await homeProvider.updateProd(id, title, type, description,
        imgFile != null ? imgFile : null, filename, price, rating);
    return res;
  }

  Future<String> deleteProd(id) async {
    var res = await homeProvider.deleteProd(id);
    return res;
  }

  /* Future<List<Produtos>> obterDados() async {
    List<Produtos> list = [];
    var dados = await homeProvider.obterDados();
    dados.forEach((e) {
      list.add(Produtos.fromJson(e));
    });
    return list;
  } */
}
