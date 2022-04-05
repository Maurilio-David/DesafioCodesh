import 'package:desafio/app/bindings/home_binding.dart';
import 'package:desafio/app/modules/home/pages/home_page.dart';
import 'package:desafio/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    //Home
    GetPage(
        name: AppRoutes.home,
        page: () => HomePageView(),
        binding: HomeBinding())
  ];
}
