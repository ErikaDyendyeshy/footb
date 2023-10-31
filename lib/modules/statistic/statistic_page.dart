import 'package:flutter/material.dart';
import 'package:football/modules/statistic/statistic_controller.dart';
import 'package:football/modules/statistic/widget/country_detail.dart';
import 'package:football/style/app_colors.dart';
import 'package:get/get.dart';

class StatisticPage extends GetView<StatisticController> {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Statistic'),
      ),
      body: const SizedBox(),
    );
  }

  Widget _body() {
    return Obx(() => controller.isLoading.value
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'txt_the_list_is_empty_add_your_favorite_team_to_the_list'.tr,
                  style: Get.theme.textTheme.titleMedium!.copyWith(color: AppColors.gray300),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 100),
              ],
            ),
          )
        : ListView.builder(
            itemCount: controller.uefaRanking.value!.teams.length,
            itemBuilder: (context, index) {
              final team = controller.uefaRanking.value!.teams[index];
              return ListTile(
                leading: Image.network(team.countryImage),
                title: Text(team.countryName),
                subtitle: Text('Total Points: ${team.totalPoints}'),
                onTap: () => Get.to(() => CountryDetail(team: team)),
              );
            },
          ));
  }
}
