import 'package:football/data/api_data_source.dart';
import 'package:football/data/model/fixture_response/fixture_response.dart';
import 'package:football/data/model/league.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final ApiDataSource _apiDataSource = Get.find();
  final RxList<FixtureItem> fixturesList = RxList.empty();
  final Rx<LeagueData?> leagueData = Rx(null);
  final DateTime dateTime = DateTime.now();
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    fetchMatches(date: dateTime);
    fetchLeagues();
    isLoading.value = false;
  }

  Future<void> fetchMatches({ DateTime? date, int? leagueId, }) async {
    date ??= dateTime;
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    final List<FixtureItem> fetchedFixtures =
        await _apiDataSource.fetchMatchesByDate(date: formattedDate,);
    fixturesList.value = fetchedFixtures;
    update();
  }

  Future<void> fetchLeagues() async {
    leagueData.value = await _apiDataSource.fetchLeagues();

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
