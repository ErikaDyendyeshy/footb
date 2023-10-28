import 'package:football/data/api_data_source.dart';
import 'package:football/data/model/uefa_five_year_ranking.dart';
import 'package:get/get.dart';

class StatisticController extends GetxController {
  final ApiDataSource _apiDataSource = Get.find();
  final Rx<UefaFiveYearRanking?> uefaRanking = Rx(null);
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUefaRanking();
  }

  void fetchUefaRanking() async {
    try {
      isLoading(true);
      // final ranking = await _apiDataSource.fetchDataFromAPI();
      // uefaRanking.value = ranking;
    } finally {
      isLoading(false);
    }
  }
}