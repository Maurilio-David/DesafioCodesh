import 'package:desafio/app/controllers/home_controller.dart';
import 'package:desafio/app/data/provider/home_provider.dart';
import 'package:desafio/app/data/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeProvider>(() => HomeProvider());
    Get.lazyPut(() => HomeRepository(Get.find<HomeProvider>()));
    Get.lazyPut<HomeController>(
        () => HomeController(Get.find<HomeRepository>()));
  }
}
