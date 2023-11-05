import 'package:flutter/material.dart';
import 'package:football/modules/live_score_detail/live_score_detail_controller.dart';
import 'package:football/style/app_colors.dart';
import 'package:football/widget/f_custom_progress_indicator_widget.dart';
import 'package:get/get.dart';

class LiveScoreDetailPage extends GetView<LiveScoreDetailController> {
  const LiveScoreDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    _header(context),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    final fixture = controller.fixtureRx.value;
    final startTime = DateTime.fromMillisecondsSinceEpoch(fixture!.fixture.timestamp * 1000);
    final currentTime = DateTime.now();
    final differenceInMinutes = currentTime.difference(startTime).inMinutes;
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
              '${controller.fixtureRx.value!.league.country}, ${controller.fixtureRx.value!.league.name}',
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
                    Text(
                      controller.fixtureRx.value!.teams.home!.name,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.fixtureRx.value!.goals.home == null
                          ? '-'
                          : controller.fixtureRx.value!.goals.home.toString(),
                      style: Get.theme.textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      ' : ',
                      style: Get.theme.textTheme.headlineSmall,
                    ),
                    Text(
                      controller.fixtureRx.value!.goals.away == null
                          ? ' - '
                          : controller.fixtureRx.value!.goals.away.toString(),
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
                    Text(
                      controller.fixtureRx.value!.teams.away!.name,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(
          '$differenceInMinutes minutes',
          style: Theme.of(context).textTheme.bodySmall,
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
                  child: _buildItem(index, homePercentage, awayPercentage),
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildItem(int index, double homePercentage, double awayPercentage) {
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
