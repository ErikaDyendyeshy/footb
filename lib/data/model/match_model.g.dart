// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
      share: Share.fromJson(json['share'] as Map<String, dynamic>),
      totalMatches: json['totalMatches'] as int,
      liveMatches: (json['liveMatches'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => MatchDetail.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'share': instance.share,
      'totalMatches': instance.totalMatches,
      'liveMatches': instance.liveMatches,
    };

Share _$ShareFromJson(Map<String, dynamic> json) => Share(
      title: json['title'] as String,
      url: json['url'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ShareToJson(Share instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'description': instance.description,
    };

MatchDetail _$MatchDetailFromJson(Map<String, dynamic> json) => MatchDetail(
      id: json['id'],
      scoreradarID: json['scoreradarID'] as String?,
      competitionID: json['competitionID'] as String,
      competitionName: json['competitionName'] as String,
      competitionImage: json['competitionImage'] as String,
      tournamentFlag: json['tournamentFlag'] as String,
      round: json['round'] as String?,
      group: json['group'] as String?,
      matchDay: json['matchDay'] as String?,
      matchDate: json['matchDate'] as String?,
      fullMatchDate: json['fullMatchDate'] as String?,
      matchTime: json['matchTime'] as String?,
      timestamp: json['timestamp'] as int?,
      homeClubID: json['homeClubID'] as String?,
      homeClubName: json['homeClubName'] as String?,
      homeClubImage: json['homeClubImage'] as String?,
      awayClubID: json['awayClubID'] as String?,
      awayClubName: json['awayClubName'] as String?,
      awayClubImage: json['awayClubImage'] as String?,
      result: json['result'] as String?,
      postponed: json['postponed'] as bool? ?? false,
      nextRound: json['nextRound'] as String?,
      resultObject: json['resultObject'] == null
          ? null
          : ResultObject.fromJson(json['resultObject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchDetailToJson(MatchDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scoreradarID': instance.scoreradarID,
      'competitionID': instance.competitionID,
      'competitionName': instance.competitionName,
      'competitionImage': instance.competitionImage,
      'tournamentFlag': instance.tournamentFlag,
      'round': instance.round,
      'group': instance.group,
      'matchDay': instance.matchDay,
      'matchDate': instance.matchDate,
      'fullMatchDate': instance.fullMatchDate,
      'matchTime': instance.matchTime,
      'timestamp': instance.timestamp,
      'homeClubID': instance.homeClubID,
      'homeClubName': instance.homeClubName,
      'homeClubImage': instance.homeClubImage,
      'awayClubID': instance.awayClubID,
      'awayClubName': instance.awayClubName,
      'awayClubImage': instance.awayClubImage,
      'result': instance.result,
      'postponed': instance.postponed,
      'nextRound': instance.nextRound,
      'resultObject': instance.resultObject,
    };

ResultObject _$ResultObjectFromJson(Map<String, dynamic> json) => ResultObject(
      result: json['result'] as String,
      goalsHome: json['goalsHome'] as String,
      goalsAway: json['goalsAway'] as String,
      minute: json['minute'] as int,
      state: json['state'] as String,
      destinationValue: json['destinationValue'] as int,
      destinationDescription: json['destinationDescription'] as String,
    );

Map<String, dynamic> _$ResultObjectToJson(ResultObject instance) =>
    <String, dynamic>{
      'result': instance.result,
      'goalsHome': instance.goalsHome,
      'goalsAway': instance.goalsAway,
      'minute': instance.minute,
      'state': instance.state,
      'destinationValue': instance.destinationValue,
      'destinationDescription': instance.destinationDescription,
    };
