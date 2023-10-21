import 'package:football/modules/favorites/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesController>(() => FavoritesController());
  }
}
