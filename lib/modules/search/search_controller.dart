import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchAppController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final RxBool isLast = false.obs;
  final RxBool isLoading = false.obs;

  final RxString searchTextRx = ''.obs;
  final FocusNode searchFocusNode = FocusNode();


  Timer? searchOnStoppedTyping;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  void clearSearchField() {
    if (searchTextRx.isNotEmpty) {
      searchController.clear();
      searchTextRx.value = '';
    }
  }


  void search(String searchText) {
    Duration duration = const Duration(milliseconds: 800);

    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping!.cancel();
    }
    searchTextRx.value = searchText;
    searchOnStoppedTyping = Timer(duration, () {
      // getUserList(search: searchText);
    });
  }

  void getBack() {
    Get.back();
  }
}
