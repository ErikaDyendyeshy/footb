import 'package:football/data/api_data_source.dart';
import 'package:football/data/model/fixture_response/fixture_response.dart';

import 'package:get/get.dart';

class LiveScoresController extends GetxController {
  final ApiDataSource _apiDataSource = Get.find();

  final RxList<FixtureItem> fixtureList = RxList.empty();
  final RxList<Fixture> fixture = RxList.empty();
  final RxInt scoreId = 0.obs;
  var isLoading = true.obs;


  @override
  void onInit() {
    fetchLiveFixtures();
    super.onInit();
  }

  Future<void> fetchLiveFixtures() async {
    isLoading(true);
    fixtureList.value = await _apiDataSource.fetchMatchesByDate(live: 'all');

    isLoading(false);
  }
}
