import 'package:football/modules/detail_match/detail_match_controller.dart';
import 'package:get/get.dart';

class DetailMatchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMatchController>(() => DetailMatchController());
  }
}
