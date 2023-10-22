import 'package:json_annotation/json_annotation.dart';

part 'match_model.g.dart';

@JsonSerializable()
class MatchModel {
  final Share share;
  final int totalMatches;
  final Map<String, List<MatchDetail>> liveMatches;

  MatchModel({
    required this.share,
    required this.totalMatches,
    required this.liveMatches,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}

@JsonSerializable()
class Share {
  final String title;
  final String url;
  final String description;

  Share({
    required this.title,
    required this.url,
    required this.description,
  });

  factory Share.fromJson(Map<String, dynamic> json) => _$ShareFromJson(json);
  Map<String, dynamic> toJson() => _$ShareToJson(this);
}

@JsonSerializable()
class MatchDetail {
  final dynamic id;
  final String? scoreradarID;
  final String competitionID;
  final String competitionName;
  final String competitionImage;
  final String tournamentFlag;
  final String? round;
  final String? group;
  final String? matchDay;
  final String? matchDate;
  final String? fullMatchDate;
  final String? matchTime;
  final int? timestamp;
  final String? homeClubID;
  final String? homeClubName;
  final String? homeClubImage;
  final String? awayClubID;
  final String? awayClubName;
  final String? awayClubImage;
  final String? result;
  @JsonKey(defaultValue: false)
  final bool postponed;
  final String? nextRound;
  final ResultObject? resultObject;

  MatchDetail({
    required this.id,
    this.scoreradarID,
    required this.competitionID,
    required this.competitionName,
    required this.competitionImage,
    required this.tournamentFlag,
    this.round,
    required this.group,
    required this.matchDay,
    required this.matchDate,
    required this.fullMatchDate,
    required this.matchTime,
    required this.timestamp,
    required this.homeClubID,
    required this.homeClubName,
    required this.homeClubImage,
    required this.awayClubID,
    required this.awayClubName,
    required this.awayClubImage,
    required this.result,
    required this.postponed,
    required this.nextRound,
    required this.resultObject,
  });

  factory MatchDetail.fromJson(Map<String, dynamic> json) => _$MatchDetailFromJson(json);
  Map<String, dynamic> toJson() => _$MatchDetailToJson(this);
}

@JsonSerializable()
class ResultObject {
  final String result;
  final String goalsHome;
  final String goalsAway;
  final dynamic minute;
  final String state;
  final int destinationValue;
  final String destinationDescription;

  ResultObject({
    required this.result,
    required this.goalsHome,
    required this.goalsAway,
    required this.minute,
    required this.state,
    required this.destinationValue,
    required this.destinationDescription,
  });

  factory ResultObject.fromJson(Map<String, dynamic> json) => _$ResultObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ResultObjectToJson(this);
}
