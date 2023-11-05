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


  void openSearchPage() {
    Get.toNamed('/search');
  }
}
