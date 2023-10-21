import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxInt current = 0.obs;
  final RxBool isShowButtons = false.obs;
  final RxBool currentUser = false.obs;

  @override
  void onReady() {
    super.onReady();
    _redirectToProperPage();
  }

  void _redirectToProperPage() {
    currentUser.value = _auth.currentUser == null;
    Future.delayed(const Duration(seconds: 3), () {
      if (currentUser.value) {
        isShowButtons.value = true;
      } else {
        Get.offAllNamed('/main');
      }
    });
  }

  void openSignUpPage() {
    Get.toNamed(
      '/auth',
      arguments: false,
    );
  }

  void openLoginPage() {
    Get.toNamed(
      '/auth',
      arguments: true,
    );
  }
}
