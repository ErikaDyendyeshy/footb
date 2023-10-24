import 'package:football/data/model/match_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'uefa_five_year_ranking.g.dart';

@JsonSerializable()
class UefaFiveYearRanking {
  final Share share;
  final List<Team> teams;

  UefaFiveYearRanking({required this.share, required this.teams});

  factory UefaFiveYearRanking.fromJson(Map<String, dynamic> json) =>
      _$UefaFiveYearRankingFromJson(json);

  Map<String, dynamic> toJson() => _$UefaFiveYearRankingToJson(this);
}

@JsonSerializable()
class Team {
  final String id;
  final String countryImage;
  final String countryName;
  final int totalPoints;
  final String? points2021;
  final String? points2020;
  final String? points2019;
  final String? points2018;
  final String? points2017;
  final int totalTeams;
  final int teamsCl;
  final int teamsEl;

  Team({
    required this.id,
    required this.countryImage,
    required this.countryName,
    required this.totalPoints,
    required this.points2021,
    required this.points2020,
    required this.points2019,
    required this.points2018,
    required this.points2017,
    required this.totalTeams,
    required this.teamsCl,
    required this.teamsEl,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
