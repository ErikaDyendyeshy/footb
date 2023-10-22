import 'package:get/get.dart';

class MainController extends GetxController {
  final RxInt selectedPageIndex = 0.obs;

  void onChangePageIndex(int value) {
    selectedPageIndex.value = value;
  }
}
