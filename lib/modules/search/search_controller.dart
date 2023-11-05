import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football/data/api_data_source.dart';
import 'package:football/data/model/league.dart';

import 'package:get/get.dart';

class SearchAppController extends GetxController {
  final ApiDataSource _apiDataSource = Get.find();

  final TextEditingController searchController = TextEditingController();
  final RxBool isLast = false.obs;
  final RxBool isLoading = false.obs;
  final RxList<League> leagueList = RxList.empty();
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

    if (searchTextRx.value.length >= 3) {
      searchOnStoppedTyping = Timer(duration, () {
        searchMatch(searchText: searchText);
      });
    }
  }

  void searchMatch({required String searchText}) {
    Duration duration = const Duration(milliseconds: 800);

    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping!.cancel(); // clear timer
    }
    searchOnStoppedTyping = Timer(duration, () {
      getLeagueList(searchText: searchText);
    });
  }

  Future<void> getLeagueList({required String searchText}) async {
    isLoading.value = true;
  await _apiDataSource.fetchLeagues(search: searchText).then((List<League> response) {
      leagueList.value = response;
    });
  isLoading.value = false;

  }

  void getBack() {
    Get.back();
  }

 void getMatch(int? id) {
    _apiDataSource.fetchMatchesByDate();
 }
}
