import 'package:json_annotation/json_annotation.dart';

part 'game_infotmation_model.g.dart';

@JsonSerializable()
class GameInformationModel {
  final String id;
  final bool postponed;
  final bool hasMatchSheet;
  final String stadiumID;
  final String stadiumName;
  final String spectators;
  final String seasonID;
  final String competitionID;
  final String competitionName;
  final String competitionRound;
  final String competitionImage;
  final bool nationalTeamFlag;
  final dynamic refereeID;
  final String refereeName;
  final String refereeImage;
  final String homeTeamID;
  final String homeTeamName;
  final String homeTeamShortName;
  final String homeTeamImage;
  final String homeTeamColor;
  final String homeTeamFontColor;
  final String awayTeamID;
  final String awayTeamName;
  final String awayTeamShortName;
  final String awayTeamImage;
  final String awayTeamColor;
  final String awayTeamFontColor;
  final String date;
  final String dateSmall;
  final String time;
  final String fulldate;
  final int timestamp;
  final String scoreradarID;
  final List<dynamic> firstLeg; // Тип може бути іншим, залежно від того, які дані очікуєте тут
  final String nextRound;

  GameInformationModel({
    required this.id,
    required this.postponed,
    required this.hasMatchSheet,
    required this.stadiumID,
    required this.stadiumName,
    required this.spectators,
    required this.seasonID,
    required this.competitionID,
    required this.competitionName,
    required this.competitionRound,
    required this.competitionImage,
    required this.nationalTeamFlag,
    required this.refereeID,
    required this.refereeName,
    required this.refereeImage,
    required this.homeTeamID,
    required this.homeTeamName,
    required this.homeTeamShortName,
    required this.homeTeamImage,
    required this.homeTeamColor,
    required this.homeTeamFontColor,
    required this.awayTeamID,
    required this.awayTeamName,
    required this.awayTeamShortName,
    required this.awayTeamImage,
    required this.awayTeamColor,
    required this.awayTeamFontColor,
    required this.date,
    required this.dateSmall,
    required this.time,
    required this.fulldate,
    required this.timestamp,
    required this.scoreradarID,
    required this.firstLeg,
    required this.nextRound,
  });

  factory GameInformationModel.fromJson(Map<String, dynamic> json) => _$GameInformationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameInformationModelToJson(this);
}
