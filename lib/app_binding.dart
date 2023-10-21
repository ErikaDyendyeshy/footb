import 'package:football/data/api_data_source.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiDataSource>(ApiDataSource(), permanent: true);

  }
}
