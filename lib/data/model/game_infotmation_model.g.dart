// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_infotmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameInformationModel _$GameInformationModelFromJson(
        Map<String, dynamic> json) =>
    GameInformationModel(
      id: json['id'] as String,
      postponed: json['postponed'] as bool,
      hasMatchSheet: json['hasMatchSheet'] as bool,
      stadiumID: json['stadiumID'] as String,
      stadiumName: json['stadiumName'] as String,
      spectators: json['spectators'] as String,
      seasonID: json['seasonID'] as String,
      competitionID: json['competitionID'] as String,
      competitionName: json['competitionName'] as String,
      competitionRound: json['competitionRound'] as String,
      competitionImage: json['competitionImage'] as String,
      nationalTeamFlag: json['nationalTeamFlag'] as bool,
      refereeID: json['refereeID'] as dynamic,
      refereeName: json['refereeName'] as String,
      refereeImage: json['refereeImage'] as String,
      homeTeamID: json['homeTeamID'] as String,
      homeTeamName: json['homeTeamName'] as String,
      homeTeamShortName: json['homeTeamShortName'] as String,
      homeTeamImage: json['homeTeamImage'] as String,
      homeTeamColor: json['homeTeamColor'] as String,
      homeTeamFontColor: json['homeTeamFontColor'] as String,
      awayTeamID: json['awayTeamID'] as String,
      awayTeamName: json['awayTeamName'] as String,
      awayTeamShortName: json['awayTeamShortName'] as String,
      awayTeamImage: json['awayTeamImage'] as String,
      awayTeamColor: json['awayTeamColor'] as String,
      awayTeamFontColor: json['awayTeamFontColor'] as String,
      date: json['date'] as String,
      dateSmall: json['dateSmall'] as String,
      time: json['time'] as String,
      fulldate: json['fulldate'] as String,
      timestamp: json['timestamp'] as int,
      scoreradarID: json['scoreradarID'] as String,
      firstLeg: json['firstLeg'] as List<dynamic>,
      nextRound: json['nextRound'] as String,
    );

Map<String, dynamic> _$GameInformationModelToJson(
        GameInformationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postponed': instance.postponed,
      'hasMatchSheet': instance.hasMatchSheet,
      'stadiumID': instance.stadiumID,
      'stadiumName': instance.stadiumName,
      'spectators': instance.spectators,
      'seasonID': instance.seasonID,
      'competitionID': instance.competitionID,
      'competitionName': instance.competitionName,
      'competitionRound': instance.competitionRound,
      'competitionImage': instance.competitionImage,
      'nationalTeamFlag': instance.nationalTeamFlag,
      'refereeID': instance.refereeID,
      'refereeName': instance.refereeName,
      'refereeImage': instance.refereeImage,
      'homeTeamID': instance.homeTeamID,
      'homeTeamName': instance.homeTeamName,
      'homeTeamShortName': instance.homeTeamShortName,
      'homeTeamImage': instance.homeTeamImage,
      'homeTeamColor': instance.homeTeamColor,
      'homeTeamFontColor': instance.homeTeamFontColor,
      'awayTeamID': instance.awayTeamID,
      'awayTeamName': instance.awayTeamName,
      'awayTeamShortName': instance.awayTeamShortName,
      'awayTeamImage': instance.awayTeamImage,
      'awayTeamColor': instance.awayTeamColor,
      'awayTeamFontColor': instance.awayTeamFontColor,
      'date': instance.date,
      'dateSmall': instance.dateSmall,
      'time': instance.time,
      'fulldate': instance.fulldate,
      'timestamp': instance.timestamp,
      'scoreradarID': instance.scoreradarID,
      'firstLeg': instance.firstLeg,
      'nextRound': instance.nextRound,
    };
