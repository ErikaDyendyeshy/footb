
import 'package:football/data/api_data_source.dart';
import 'package:football/data/model/fixture_response/fixture_response.dart';
import 'package:football/data/model/game_infotmation_model.dart';
import 'package:get/get.dart';

class  DetailMatchController extends  GetxController {
  final ApiDataSource _apiDataSource = ApiDataSource();
  final Rx<GameInformationModel?> gameInformation = Rx(null) ;
  final Rx<FixtureDetail?> fixtureRx = Rx(null);
  final RxList<Event> eventList = RxList.empty();
  final RxList<PlayerStatistic> playerStatisticList = RxList.empty();
final RxInt fixtureId  = 0.obs;
  final RxBool isLoading = true.obs;

  DetailMatchController(){
    if (Get.arguments != null) {
      fixtureId.value  = Get.arguments;
    }

  }

  @override
  void onInit() {
    super.onInit();
    fetchGameInformation();
  }

  Future<void> fetchGameInformation() async {
    isLoading.value = true;

    final fixtureDetail = await _apiDataSource.getFixtureDetailById(fixtureId: fixtureId.value.toString());
    print(fixtureDetail);
    fixtureRx.value = fixtureDetail;
      isLoading.value = false;
  }
}