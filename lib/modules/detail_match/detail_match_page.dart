import 'package:flutter/material.dart';
import 'package:football/modules/detail_match/detail_match_controller.dart';
import 'package:get/get.dart';

class DetailMatchPage extends GetView<DetailMatchController> {
  const DetailMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fixture Details'),
        ),
        body: Obx(
          () => controller.fixtureRx.value == null
              ? const CircularProgressIndicator()
              : ListView(padding: const EdgeInsets.all(16.0), children: [
                  Text('Fixture ID: ${controller.fixtureRx.value!.fixture.id}'),
                  Text('League Name: ${controller.fixtureRx.value!.league.name}'),
                  Divider(),
                  Text('Home Team: ${controller.fixtureRx.value!.teams.home!.name}'),
                  Text('Away Team: ${controller.fixtureRx.value!.teams.away!.name}'),
                  Divider(),
                  Text('Goals Home: ${controller.fixtureRx.value!.goals.home}'),
                  Text('Goals Away: ${controller.fixtureRx.value!.goals.away}'),
                  Divider(),
                  Text('Score Home: ${controller.fixtureRx.value!.score.fulltime!.home}'),
                  Text('Score Away: ${controller.fixtureRx.value!.score.fulltime!.away!}'),
                  Divider(),
                  Text('Events:'),
                ]),
        ));
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text("Detail"),
//       centerTitle: true,
//       elevation: 0,
//     ),
//     body: Obx(() {
//       if (gameController.gameInformation.value == null) {
//         return const Center(child: CircularProgressIndicator());
//       } else {
//         return SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: _buildTeamInfo(
//                         gameController.gameInformation.value!.homeTeamImage,
//                         gameController.gameInformation.value!.homeTeamName,
//                         gameController.gameInformation.value!.homeTeamColor,
//                         gameController.gameInformation.value!.homeTeamFontColor,
//                       ),
//                     ),
//                     Expanded(
//                         child: Text(
//                       gameController.matchRx.value!.result.toString(),
//                       style: Get.theme.textTheme.headlineMedium!.copyWith(letterSpacing: 4),
//                       textAlign: TextAlign.center,
//                     )),
//                     Expanded(
//                       flex: 2,
//                       child: _buildTeamInfo(
//                         gameController.gameInformation.value!.awayTeamImage,
//                         gameController.gameInformation.value!.awayTeamName,
//                         gameController.gameInformation.value!.awayTeamColor,
//                         gameController.gameInformation.value!.awayTeamFontColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 width: Get.width,
//                 height: Get.height,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20), color: AppColors.darkGray2),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Flexible(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                   'Stadium: ${gameController.gameInformation.value!.stadiumName}'),
//                               const SizedBox(height: 5),
//                               Text('Date: ${gameController.gameInformation.value!.fulldate}'),
//                               const SizedBox(height: 5),
//                               Text(
//                                   'Competition: ${gameController.gameInformation.value!.competitionName}'),
//                               const SizedBox(height: 5),
//                               Text(
//                                   'Round: ${gameController.gameInformation.value!.competitionRound}'),
//                               const SizedBox(height: 40),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Image.network(
//                           gameController.gameInformation.value!.refereeImage,
//                           height: 120,
//                         ),
//                         const SizedBox(width: 20),
//                         Text('Referee \n${gameController.gameInformation.value!.refereeName}',
//                             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       }
//     }),
//   );
// }
//
// Widget _buildTeamInfo(String imageUrl, String teamName, String bgColor, String fontColor) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Image.network(imageUrl),
//       Container(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           teamName,
//           style: const TextStyle(
//             fontSize: 16,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     ],
//   );
// }
