import 'package:flutter/material.dart';
import 'package:football/modules/statistic/statistic_controller.dart';
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
        title: const Text('Leagues'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _leagueList(),
          _list(),
        ],
      ),
    );
  }

  Widget _leagueList() {
    return Obx(
      () => SizedBox(
        height: 80,
        child: controller.leagueData.value == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.leagueData.value!.response.length,
                itemBuilder: (context, index) {
                  var item = controller.leagueData.value!.response[index];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 70,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.gray100,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.network(item.league.logo),
                    ),
                  );
                }),
      ),
    );
  }

  Widget _list() {
    return Expanded(
      child: Obx(() =>
         SizedBox(
           height: Get.height,
           child:     controller.leagueData.value == null ? const Center(child: CircularProgressIndicator(),) :
           ListView.builder(
               itemCount: controller.leagueData.value!.response.length,
               itemBuilder: (context, index) {
                 var item = controller.leagueData.value!.response[index];
                 return Column(
                   children: [
                     Container(
                       width: Get.width,
                       decoration: const BoxDecoration(
                         color: AppColors.primary,
                       ),
                       child: Row(
                         children: [
                           Image.network(item.league.logo, width: 40, height: 40,),
                           Column(
                             children: [
                               Text(item.league.name),
                               Text(item.league.type),
                               Text(item.country.name)
                             ],
                           ),
                         ],
                       ),


                     ),
                     SizedBox(
                       height: 200,

                       child: ListView.builder(
                         itemCount: item.seasons.length,
                           itemBuilder: (context, index) {
                           var season = item.seasons[index];
                          return  Column(
                            children: [
                              Text(season.start),
                              Text(season.end),
                              Text(season.year.toString()),

                            ],
                          );
                           }),
                     )
                   ],
                 );
               }),
         ),
      ),
    );
  }
}
