import 'package:flutter/material.dart';
import 'package:football/modules/detail_match/detail_match_controller.dart';
import 'package:football/modules/live_scores/live_scores_controller.dart';
import 'package:get/get.dart';

class LiveScoresPage extends GetView<LiveScoresController> {
  const LiveScoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Scores'),
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.fixtureList.length,
            itemBuilder: (context, index) {
              final fixture = controller.fixtureList[index];
              final startTime =
                  DateTime.fromMillisecondsSinceEpoch(fixture.fixture.timestamp * 1000);
              final currentTime = DateTime.now();
              final differenceInMinutes = currentTime.difference(startTime).inMinutes;

              return ListTile(
                leading: Image.network(
                  fixture.league!.logo,
                  width: 40,
                ),
                title: Text('${fixture.teams.home!.name} vs ${fixture.teams.away!.name}'),
                subtitle: Text('$differenceInMinutes minutes'),
                trailing: Text('${fixture.goals!.home} - ${fixture.goals!.away}'),
                onTap: () => Get.toNamed(
                  '/detail_match',
                  arguments: DetailMatchWrapper(matchId: controller.fixtureList[index].fixture.id, liveScore: true),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
