import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool passwordObscured = true.obs;
  final RxBool isLogin = false.obs;

  final RxString errorMessage = ''.obs;
  final RxBool isLoading = false.obs;

  AuthController(){
   isLogin.value = Get.arguments;
  }


  Future<void> signUp() async {
    isLoading.value = true;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAllNamed('/main');
    } catch (e) {
      if (e is FirebaseAuthException) {
        errorMessage.value = e.message ?? 'Unknown error occurred.';
        Get.snackbar('Error', errorMessage.value);
      }
    }
    isLoading.value = false;
  }

  Future<void> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential);

        Get.offAllNamed('/home');
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        errorMessage.value = e.message ?? 'Unknown error occurred.';
        Get.snackbar('Error', errorMessage.value);
      }
    }
  }
}
