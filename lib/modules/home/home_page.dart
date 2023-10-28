import 'package:flutter/material.dart';
import 'package:football/data/model/fixture_response/fixture_response.dart';
import 'package:football/modules/home/home_controller.dart';
import 'package:football/modules/home/widget/search_button_widget.dart';
import 'package:football/style/app_colors.dart';
import 'package:get/get.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:lottie/lottie.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('txt_home'.tr.capitalizeFirst!),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SearchButtonWidget(),
              const SizedBox(height: 10),
              _calendar(),
              const SizedBox(height: 5),
              _list(),
            ],
          ),
        )
        //

        );
  }

  Widget _calendar() {
    return HorizontalWeekCalendar(
      onDateChange: (date) {
        controller.fetchMatches(date: date);
      },
      weekStartFrom: WeekStartFrom.Monday,
      activeBackgroundColor: Get.theme.colorScheme.primary,
      activeTextColor: Colors.white,
      inactiveBackgroundColor: Colors.transparent,
      inactiveTextColor: Colors.white,
      disabledTextColor: Colors.grey,
      disabledBackgroundColor: Colors.transparent,
      activeNavigatorColor: Get.theme.colorScheme.primary,
      inactiveNavigatorColor: AppColors.gray400,
      monthColor: Get.theme.colorScheme.primary,
    );
  }

  Widget _list() {
    return Expanded(
      child: Obx(
        () => controller.fixtures.isEmpty
            ? Center(
                child: Lottie.asset('assets/lottie/animation_lnupk0i3.json'),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.fixtures.length,
                itemBuilder: (BuildContext context, int index) {
                  return _item(controller.fixtures[index]);
                }),
      ),
    );
  }

  Widget _item(FixtureItem match) {
    return InkWell(
      onTap: () => Get.toNamed('/detail_match', arguments: match.fixture.id),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: Get.width,
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.darkGray2,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: AppColors.white, borderRadius: BorderRadius.circular(50)),
                    child: Image.network(match.teams.home!.logo ?? ''),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                      child: Text(
                    match.teams.home!.name,
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    match.score!.fulltime!.home == null
                        ? '-'
                        : match.score!.fulltime!.home.toString(),
                    style: Get.theme.textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  if (match.score!.fulltime!.home != null)
                    Text(
                      ' - ',
                      style: Get.theme.textTheme.headlineSmall,
                    ),
                  Text(
                    match.score!.fulltime!.away == null
                        ? '-'
                        : match.score!.fulltime!.away.toString(),
                    style: Get.theme.textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.network(match.teams.away!.logo ?? ''),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      match.teams.away!.name,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
