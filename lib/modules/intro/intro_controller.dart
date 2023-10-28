import 'package:firebase_auth/firebase_auth.dart';
import 'package:football/modules/auth/auth_binding.dart';
import 'package:football/modules/auth/auth_page.dart';
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

  void _redirectToProperPage()  {
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
    Get.to(
      () =>  AuthPage(),
      binding: AuthBinding(),
      arguments: false,
    );
  }

  void openLoginPage() {

    Get.to(
      () =>  AuthPage(),
      binding: AuthBinding(),
      arguments: true,
    );
  }
}
