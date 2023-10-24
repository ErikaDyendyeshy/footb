import 'package:football/data/api_data_source.dart';
import 'package:football/data/model/game_infotmation_model.dart';
import 'package:football/data/model/match_model.dart';
import 'package:get/get.dart';

class  DetailMatchController extends  GetxController {
  final ApiDataSource _apiDataSource = ApiDataSource();
  final Rx<GameInformationModel?> gameInformation = Rx(null) ;
  final Rx<MatchDetail?> matchRx = Rx(null);
  // final  RxString idTeam = ''.obs;
  var isLoading = true.obs;

  DetailMatchController(){
    if (Get.arguments != null) {
      matchRx.value  = Get.arguments;
    }

  }

  @override
  void onInit() {
    super.onInit();
    fetchGameInformation();
  }

  Future<void> fetchGameInformation() async {
    isLoading.value = true;

    _apiDataSource.fetchGameInformation(id: matchRx.value!.id).then((GameInformationModel newGameInformation) {
      gameInformation.value = newGameInformation;
    });
      isLoading.value = false;
  }
}