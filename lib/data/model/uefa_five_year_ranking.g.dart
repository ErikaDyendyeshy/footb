// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uefa_five_year_ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UefaFiveYearRanking _$UefaFiveYearRankingFromJson(Map<String, dynamic> json) =>
    UefaFiveYearRanking(
      share: Share.fromJson(json['share'] as Map<String, dynamic>),
      teams: (json['teams'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UefaFiveYearRankingToJson(
        UefaFiveYearRanking instance) =>
    <String, dynamic>{
      'share': instance.share,
      'teams': instance.teams,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as String,
      countryImage: json['countryImage'] as String,
      countryName: json['countryName'] as String,
      totalPoints: json['totalPoints'] as int,
      points2021: json['points2021'] as String?,
      points2020: json['points2020'] as String?,
      points2019: json['points2019'] as String?,
      points2018: json['points2018'] as String?,
      points2017: json['points2017'] as String?,
      totalTeams: json['totalTeams'] as int,
      teamsCl: json['teamsCl'] as int,
      teamsEl: json['teamsEl'] as int,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'countryImage': instance.countryImage,
      'countryName': instance.countryName,
      'totalPoints': instance.totalPoints,
      'points2021': instance.points2021,
      'points2020': instance.points2020,
      'points2019': instance.points2019,
      'points2018': instance.points2018,
      'points2017': instance.points2017,
      'totalTeams': instance.totalTeams,
      'teamsCl': instance.teamsCl,
      'teamsEl': instance.teamsEl,
    };
