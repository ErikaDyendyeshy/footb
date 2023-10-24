import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:football/modules/auth/auth_controller.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfileController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<File?> avatarRx = Rx(null);
  final RxBool isLoading = false.obs;
  final RxBool isNotification = false.obs;
  final RxBool isDarkTheme = true.obs;

  Rx<User?> firebaseUser = Rx<User?>(null);
  Rx<Map<String, dynamic>?> userData = Rx<Map<String, dynamic>?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  void fetchUserData() async {
    String? uid = authController.user?.uid;
    if (uid != null) {
      userData.value = await getUserData(uid);
      if (userData.value != null) {
        String? name = userData.value?['name'];
        String? email = userData.value?['email'];
        String? avatar = userData.value?['avatar'];

        print('Name: $name');
        print('Email: $email');
        print('Avatar: $avatar');
      }
    }
  }

  Future uploadPhoto() async {
    isLoading.value = true;
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      _cropImage(
        File(result.files.single.path!),
      ).then((cropedFile) {
        if (cropedFile != null) {
          avatarRx.value = File(cropedFile);
        }
      });
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  Future<String?> _cropImage(
    File? pickedFile,
  ) async {
    if (pickedFile != null) {
      final cropedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(
          ratioX: 1,
          ratioY: 1,
        ),
        aspectRatioPresets: [CropAspectRatioPreset.ratio4x3],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'txt_edit_your_image'.tr,
            hideBottomControls: true,
          ),
          IOSUiSettings(
            title: 'txt_edit_your_image'.tr,
            hidesNavigationBar: true,
          ),
        ],
      );
      if (cropedFile != null) {
        return cropedFile.path;
      }
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();

      Get.offAllNamed('/auth', arguments: true);
    } catch (e) {
      print('Error signing out: $e');
      Get.snackbar('Error', 'Error signing out');
    }
  }
}
