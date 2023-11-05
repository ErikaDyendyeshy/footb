import 'package:football/data/api_data_source.dart';
import 'package:football/data/model/fixture_response/fixture_response.dart';
import 'package:get/get.dart';

class LiveScoreDetailController extends GetxController {
  final ApiDataSource _apiDataSource = ApiDataSource();

  final Rx<FixtureDetail?> fixtureRx = Rx(null);
  final RxList<StatisticDetail> homeTeamStat = RxList.empty();
  final RxList<StatisticDetail> awayTeamStat = RxList.empty();
  final RxInt scoreId = 0.obs;
  final RxBool isLoading = true.obs;

  LiveScoreDetailController() {
    if (Get.arguments != null) {
      scoreId.value = Get.arguments as int;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchGameInformation();
  }

  Future<void> fetchGameInformation() async {
    isLoading.value = true;

    try {
      fixtureRx.value =
          await _apiDataSource.getFixtureDetailById(fixtureId: scoreId.value.toString(), );
      if (fixtureRx.value?.statistics != null && fixtureRx.value!.statistics.length >= 2) {
        homeTeamStat.value = fixtureRx.value!.statistics[0].statistics;
        awayTeamStat.value = fixtureRx.value!.statistics[1].statistics;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
