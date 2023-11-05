import 'package:flutter/material.dart';
import 'package:football/data/api_data_source.dart';
import 'package:football/data/model/fixture_response/fixture_response.dart';
import 'package:football/data/model/game_infotmation_model.dart';
import 'package:get/get.dart';

class DetailMatchController extends GetxController {
  final ApiDataSource _apiDataSource = ApiDataSource();
  final Rx<GameInformationModel?> gameInformation = Rx(null);

  final Rx<FixtureDetail?> fixtureRx = Rx(null);
  final RxList<StatisticDetail> homeTeamStat = RxList.empty();
  final RxList<StatisticDetail> awayTeamStat = RxList.empty();
  final RxInt fixtureId = 0.obs;
  final RxBool isLoading = true.obs;
  final RxBool isLive = false.obs;

  DetailMatchController() {

      DetailMatchWrapper arg = Get.arguments;
      fixtureId.value = arg.matchId;
      isLive.value = arg.liveScore;
  }

  @override
  void onInit() {
    super.onInit();
    fetchGameInformation();
  }

  Future<void> fetchGameInformation() async {
    isLoading.value = true;

    try {
      final fixtureDetail =
          await _apiDataSource.getFixtureDetailById(fixtureId: fixtureId.value.toString());
      fixtureRx.value = fixtureDetail;
      if (fixtureDetail?.statistics != null && fixtureDetail!.statistics.length >= 2) {
        homeTeamStat.value = fixtureDetail.statistics[0].statistics;
        awayTeamStat.value = fixtureDetail.statistics[1].statistics;
      }
    } finally {
      isLoading.value = false;
    }
  }
}

class DetailMatchWrapper {
  final int matchId;
  final bool liveScore;

  DetailMatchWrapper({required this.matchId, required this.liveScore});
}
