import 'package:football/data/api_data_source.dart';
import 'package:football/data/model/league.dart';
import 'package:football/data/model/uefa_five_year_ranking.dart';
import 'package:get/get.dart';

class StatisticController extends GetxController {
  final ApiDataSource _apiDataSource = Get.find();
  final Rx<UefaFiveYearRanking?> uefaRanking = Rx(null);
  final Rx<LeagueData?> leagueData = Rx(null);

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    fetchLeagues();
    isLoading.value = false;

  }


  Future<void> fetchLeagues() async {
    leagueData.value = await _apiDataSource.fetchLeagues();

  }

}