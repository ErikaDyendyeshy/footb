import 'package:football/modules/live_scores/live_scores_controller.dart';
import 'package:get/get.dart';

class LiveScoresBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveScoresController>(() => LiveScoresController());
  }
}
