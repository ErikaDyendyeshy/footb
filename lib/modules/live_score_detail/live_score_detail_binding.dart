import 'package:football/modules/live_score_detail/live_score_detail_controller.dart';
import 'package:get/get.dart';

class LiveScoreDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveScoreDetailController>(() => LiveScoreDetailController());
  }
}
