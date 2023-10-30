
import 'package:flutter/material.dart';
import 'package:football/modules/detail_match/detail_match_controller.dart';
import 'package:football/style/app_colors.dart';
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
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                            const SizedBox(height: 10),
                            Expanded(
                                child: ListView.builder(
                              itemCount: controller.homeTeamStat.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          controller.homeTeamStat[index].value == null
                                              ? ' - '
                                              : controller.homeTeamStat[index].value.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.homeTeamStat[index].type ?? '',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.awayTeamStat[index].value == null
                                              ? ' - '
                                              : controller.awayTeamStat[index].value.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ));
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
}
