import 'package:football/modules/statistic/statistic_controller.dart';
import 'package:get/get.dart';

class StatisticBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticController>(() => StatisticController());
  }
}
