import 'package:flutter/material.dart';
import 'package:football/data/api_data_source.dart';
import 'package:football/data/model/fixture_response/fixture_response.dart';
import 'package:football/data/model/game_infotmation_model.dart';
import 'package:get/get.dart';

class DetailMatchController extends GetxController with GetSingleTickerProviderStateMixin {
  final ApiDataSource _apiDataSource = ApiDataSource();
  final Rx<GameInformationModel?> gameInformation = Rx(null);

  final Rx<FixtureDetail?> fixtureRx = Rx(null);
  final RxList<StatisticDetail> homeTeamStat = RxList.empty();
  final RxList<StatisticDetail> awayTeamStat = RxList.empty();
  final RxList<PlayerStatistic> playerStatisticList = RxList.empty();
  late TabController tabController;
  final RxInt fixtureId = 0.obs;
  final RxBool isLoading = true.obs;

  DetailMatchController() {
    if (Get.arguments != null) {
      fixtureId.value = Get.arguments;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchGameInformation();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  Future<void> fetchGameInformation() async {
    isLoading.value = true;

    try {
      print('Fetching details for fixtureId: $fixtureId');
      final fixtureDetail =
          await _apiDataSource.getFixtureDetailById(fixtureId: fixtureId.value.toString());
      print('Fetched statistics: ${fixtureDetail?.statistics}');
      fixtureRx.value = fixtureDetail;
      if (fixtureDetail?.statistics != null && fixtureDetail!.statistics.length >= 2) {
        homeTeamStat.value = fixtureDetail.statistics[0].statistics;
        awayTeamStat.value = fixtureDetail.statistics[1].statistics;
      }
    } catch (e) {
      print('Error fetching game information: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
