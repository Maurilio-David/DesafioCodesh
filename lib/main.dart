// ignore_for_file: use_key_in_widget_constructors

import 'package:desafio/app/routes/app_pages.dart';
import 'package:desafio/app/routes/app_routes.dart';
import 'package:desafio/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
  //await Firebase.initializeApp();
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        theme: appTheme(),
        defaultTransition: Transition.fade,
        getPages: AppPages.pages);
  }
}
