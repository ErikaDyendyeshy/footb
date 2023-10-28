import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final RxBool passwordObscured = true.obs;
  final RxBool isLogin = false.obs;
  final Rx<User?> _firebaseUser = Rx<User?>(null);

  final RxString errorMessage = ''.obs;
  final RxBool isLoading = false.obs;

  AuthController() {
    if (Get.arguments != null) {
      isLogin.value = Get.arguments as bool;
    }
  }

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void _updateUserData(User user, String name) {
    FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'email': user.email,
      'displayName': name,
    });
  }

  Future<void> signUp() async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,

      );
      await Future.delayed(const Duration(seconds: 2));
      _updateUserData(userCredential.user!, emailController.text);
      Get.offAllNamed('/main');
    } catch (e) {
      if (e is FirebaseAuthException) {
        errorMessage.value = e.message ?? 'Unknown error occurred.';
        Get.snackbar('Error', errorMessage.value);
      }
    }
    isLoading.value = false;
  }

  Future<void> signIn() async {
    isLoading.value = true;
    try {
   await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed('/main');
    } catch (e) {
      if (e is FirebaseAuthException) {
        errorMessage.value = e.message ?? 'Unknown error occurred.';
        Get.snackbar('Error', 'Invalid login credentials');
      }
    }
    isLoading.value = false;
  }


  User? get user => _firebaseUser.value;
}
