import 'package:flutter/material.dart';
import 'package:football/data/model/uefa_five_year_ranking.dart';
import 'package:football/style/app_colors.dart';
import 'package:get/get.dart';

class CountryDetail extends StatelessWidget {
  final Team team;

  const CountryDetail({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(team.countryName),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                team.countryImage,
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Total Points: ${team.totalPoints}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                  color: AppColors.darkGray2, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  if (team.points2021 != null) Text('Points 2021: ${team.points2021}'),
                  const SizedBox(height: 5),
                  if (team.points2020 != null) Text('Points 2020: ${team.points2020}'),
                  const SizedBox(height: 5),
                  if (team.points2019 != null) Text('Points 2019: ${team.points2019}'),
                  const SizedBox(height: 5),
                  if (team.points2018 != null) Text('Points 2018: ${team.points2018}'),
                  const SizedBox(height: 5),
                  if (team.points2017 != null) Text('Points 2017: ${team.points2017}'),
                  const SizedBox(height: 16),
                  Text(
                    'Total Teams: ${team.totalTeams}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Teams in Champions League: ${team.teamsCl}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Teams in Europa League: ${team.teamsEl}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
