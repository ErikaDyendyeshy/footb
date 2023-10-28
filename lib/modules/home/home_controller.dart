import 'package:football/data/api_data_source.dart';
import 'package:football/data/model/fixture_response/fixture_response.dart';
import 'package:football/data/model/match_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final ApiDataSource _apiDataSource = Get.find();
  final RxList<FixtureItem> fixtures = RxList.empty();

  final RxList<MatchDetail> matchDetailList = RxList.empty();
  final DateTime dateTime = DateTime.now();

  final RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    fetchMatches(date: dateTime);
    isLoading.value = false;
  }

  Future<void> fetchMatches({required DateTime date}) async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

    final List<FixtureItem> fetchedFixtures = await _apiDataSource.fetchMatchesByDate(
        date: formattedDate);
    fixtures.value = fetchedFixtures;
  }


  // void fetchMatches(DateTime dateTime) {
  //   String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  //   _apiDataSource.fetchMatches(date: formattedDate).then((List<MatchDetail> matchDetail) {
  //     matchDetailList.value = matchDetail;
  //   });
  // }

  void openSearchPage() {
    Get.toNamed('/search');
  }
}
