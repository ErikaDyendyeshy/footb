import 'package:flutter/material.dart';
import 'package:football/modules/home/home_binding.dart';
import 'package:football/modules/home/home_page.dart';
import 'package:football/modules/live_scores/live_scores_binding.dart';
import 'package:football/modules/live_scores/live_scores_page.dart';
import 'package:football/modules/main/main_controller.dart';
import 'package:football/modules/main/widget/bottom_bar/app_bottom_bar.dart';
import 'package:football/modules/profile/profile_binding.dart';
import 'package:football/modules/profile/profile_page.dart';
import 'package:football/style/app_colors.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _body(),
          Positioned(
            bottom: 0,
            child: Container(
              width: Get.width,
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.darkGray1,
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            )

          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AppBottomBar(),
          )
        ],
      ),
    );
  }

  Widget _body() {
    return Obx(() =>
       IndexedStack(
        index: controller.selectedPageIndex.value,
        children: [
          Navigator(
            onGenerateRoute: (routeSettings) {
              return GetPageRoute(
                routeName: '/home',
                page: () => const HomePage(),
                binding: HomeBinding(),
              );
            },
          ),  Navigator(
            onGenerateRoute: (routeSettings) {
              return GetPageRoute(
                routeName: '/live_scores',
                page: () => const LiveScoresPage(),
                binding: LiveScoresBinding(),
              );
            },
          )  ,
          Navigator(
            onGenerateRoute: (routeSettings) {
              return GetPageRoute(
                routeName: '/profile',
                page: () => const ProfilePage(),
                binding: ProfileBinding(),
              );
            },
          )
        ],
      ),
    );
  }
}
