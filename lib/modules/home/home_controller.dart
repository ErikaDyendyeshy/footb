import 'package:firebase_auth/firebase_auth.dart';
import 'package:football/data/api_data_source.dart';
import 'package:football/data/model/match_model.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final ApiDataSource _apiDataSource = Get.find();

  final RxList<MatchDetail> matchDetailList = RxList.empty();
  final DateTime dateTime = DateTime.now();

  final RxBool isLoading = false.obs;



  @override
  void onInit(){
    super.onInit();
    isLoading.value = true;
    fetchMatches(dateTime);
    isLoading.value = false;
  }


  void fetchMatches(DateTime dateTime) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    _apiDataSource.fetchMatches(date: formattedDate).then((List<MatchDetail> matchDetail) {
      matchDetailList.value = matchDetail;

    });

  }


  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();

      Get.offAllNamed('/auth');
    } catch (e) {
      print('Error signing out: $e');
      Get.snackbar('Error', 'Error signing out');
    }
  }

  void openSearchPage() {
    Get.toNamed('/search');
  }





}