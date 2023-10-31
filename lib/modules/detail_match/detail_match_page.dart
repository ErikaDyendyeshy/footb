import 'package:flutter/material.dart';
import 'package:football/modules/detail_match/detail_match_controller.dart';
import 'package:football/style/app_colors.dart';
import 'package:football/widget/f_custom_progress_indicator_widget.dart';
import 'package:get/get.dart';

class DetailMatchPage extends GetView<DetailMatchController> {
  const DetailMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        elevation: 0,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _header(),
                  TabBar(
                    controller: controller.tabController,
                    tabs: [
                      Tab(text: 'Statistics'),
                      Tab(text: 'Linuaups'),
                      Tab(text: 'Tab 3'),

                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        _buildStatisticList(),
                        Placeholder(),
                        Placeholder(),

                      ],
                    ),
                  ),

                ],
              ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 25,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: AppColors.white.withOpacity(0.1),
            child: Text(
              controller.fixtureRx.value == null
                  ? ''
                  : controller.fixtureRx.value!.league.name.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      padding: const EdgeInsets.all(8),
                      child: Image.network(
                        controller.fixtureRx.value!.teams.home!.logo!,
                      ),
                    ),
                    Text(controller.fixtureRx.value!.teams.home!.name)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.fixtureRx.value!.score.fulltime!.home == null
                          ? ' - '
                          : controller.fixtureRx.value!.score.fulltime!.home.toString(),
                      style: Get.theme.textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      ' : ',
                      style: Get.theme.textTheme.headlineSmall,
                    ),
                    Text(
                      controller.fixtureRx.value!.score.fulltime!.away == null
                          ? ' - '
                          : controller.fixtureRx.value!.score.fulltime!.away.toString(),
                      style: Get.theme.textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                        width: 90,
                        height: 90,
                        padding: const EdgeInsets.all(8),
                        child: Image.network(controller.fixtureRx.value!.teams.away!.logo!)),
                    Text(controller.fixtureRx.value!.teams.away!.name)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatisticList() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.darkGray1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(
              20,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.fixtureRx.value!.teams.home!.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text(
                  controller.fixtureRx.value!.teams.away!.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemCount: controller.homeTeamStat.length,
              itemBuilder: (context, index) {
                double homeValue = _convertValueToDouble(controller.homeTeamStat[index].value);
                double awayValue = _convertValueToDouble(controller.awayTeamStat[index].value);

                double total = homeValue + awayValue;
                double homePercentage = (homeValue / (total == 0.0 ? 1.0 : total));
                double awayPercentage = (awayValue / (total == 0.0 ? 1.0 : total));

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: _buildtem(index, homePercentage, awayPercentage),
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildtem(int index, double homePercentage, double awayPercentage) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              controller.homeTeamStat[index].value == null
                  ? ' - '
                  : controller.homeTeamStat[index].value.toString(),
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        Expanded(
          child: FCustomProgressIndicator(
            value: homePercentage,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            controller.homeTeamStat[index].type ?? '',
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: FCustomProgressIndicator(
            value: awayPercentage,
            reverse: true,
          ),
        ),
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              controller.awayTeamStat[index].value == null
                  ? ' - '
                  : controller.awayTeamStat[index].value.toString(),
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }

  double _convertValueToDouble(dynamic value) {
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    } else if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else {
      return 0.0;
    }
  }
}
