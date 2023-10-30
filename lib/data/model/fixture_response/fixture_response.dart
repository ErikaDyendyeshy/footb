import 'package:json_annotation/json_annotation.dart';
part 'fixture_response.g.dart';

@JsonSerializable()
class FixtureResponse {
  final int results;
  final Paging paging;
  final List<FixtureItem> response;

  FixtureResponse({
    required this.results,
    required this.paging,
    required this.response,
  });

  factory FixtureResponse.fromJson(Map<String, dynamic> json) => _$FixtureResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FixtureResponseToJson(this);
}

@JsonSerializable()
class Paging {
  final int current;
  final int total;

  Paging({
    required this.current,
    required this.total,
  });

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);

  Map<String, dynamic> toJson() => _$PagingToJson(this);
}

@JsonSerializable()
class FixtureItem {
  final Fixture fixture;
  final Venue? venue;
  final Status? status;
  final League? league;
  final Teams teams;
  final Goals? goals;
  final Score? score;

  FixtureItem({
    required this.fixture,
    required this.venue,
    required this.status,
    required this.league,
    required this.teams,
    required this.goals,
    required this.score,
  });

  factory FixtureItem.fromJson(Map<String, dynamic> json) => _$FixtureItemFromJson(json);

  Map<String, dynamic> toJson() => _$FixtureItemToJson(this);
}

@JsonSerializable()
class Fixture {
  final int id;
  final String? referee;
  final String timezone;
  final String date;
  final int timestamp;
  final Periods periods;

  Fixture({
    required this.id,
    required this.referee,
    required this.timezone,
    required this.date,
    required this.timestamp,
    required this.periods,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) => _$FixtureFromJson(json);

  Map<String, dynamic> toJson() => _$FixtureToJson(this);
}

@JsonSerializable()
class Periods {
  final int? first;
  final int? second;

  Periods({
    required this.first,
    required this.second,
  });

  factory Periods.fromJson(Map<String, dynamic> json) => _$PeriodsFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodsToJson(this);
}

@JsonSerializable()
class Venue {
  final int? id;
  final String name;
  final String city;

  Venue({
    required this.id,
    required this.name,
    required this.city,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);

  Map<String, dynamic> toJson() => _$VenueToJson(this);
}

@JsonSerializable()
class Status {
  final String long;
  final String short;
  final int elapsed;

  Status({
    required this.long,
    required this.short,
    required this.elapsed,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class League {
  final int id;
  final String name;
  final String country;
  final String logo;
  final dynamic flag;
  final String? type;
  final int season;
  final String round;

  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.round,
    required this.type,
  });

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}

@JsonSerializable()
class Teams {
  final Team? home;
  final Team? away;

  Teams({
    required this.home,
    required this.away,
  });

  factory Teams.fromJson(Map<String, dynamic> json) => _$TeamsFromJson(json);

  Map<String, dynamic> toJson() => _$TeamsToJson(this);
}

@JsonSerializable()
class Team {
  final int id;
  final String name;
  final String? logo;
  final bool? winner;

  Team({
    required this.id,
    required this.name,
    required this.logo,
    this.winner,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}

@JsonSerializable()
class Goals {
  final int? home;
  final int? away;

  Goals({
    required this.home,
    required this.away,
  });

  factory Goals.fromJson(Map<String, dynamic> json) => _$GoalsFromJson(json);

  Map<String, dynamic> toJson() => _$GoalsToJson(this);
}

@JsonSerializable()
class Score {
  final HalfTime? halftime;
  final FullTime? fulltime;
  final dynamic extratime;
  final dynamic penalty;

  Score({
    required this.halftime,
    required this.fulltime,
    this.extratime,
    this.penalty,
  });

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreToJson(this);
}

@JsonSerializable()
class HalfTime {
  final int? home;
  final int? away;

  HalfTime({
    required this.home,
    required this.away,
  });

  factory HalfTime.fromJson(Map<String, dynamic> json) => _$HalfTimeFromJson(json);

  Map<String, dynamic> toJson() => _$HalfTimeToJson(this);
}

@JsonSerializable()
class FullTime {
  final int? home;
  final int? away;

  FullTime({
    required this.home,
    required this.away,
  });

  factory FullTime.fromJson(Map<String, dynamic> json) => _$FullTimeFromJson(json);

  Map<String, dynamic> toJson() => _$FullTimeToJson(this);
}

@JsonSerializable()
class FixtureDetailResponse {
  final List<FixtureDetail> response;

  FixtureDetailResponse({required this.response});

  factory FixtureDetailResponse.fromJson(Map<String, dynamic> json) => _$FixtureDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FixtureDetailResponseToJson(this);
}

@JsonSerializable()
class FixtureDetail {
  Fixture fixture;
  League league;
  Teams teams;
  Goals goals;
  Score score;
  List<Event> events;
  List<Statistics> statistics;
  List<PlayerData> players;

  FixtureDetail({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
    required this.score,
    required this.events,
    required this.statistics,
    required this.players,
  });

  factory FixtureDetail.fromJson(Map<String, dynamic> json) =>
      _$FixtureDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FixtureDetailToJson(this);
}



// @JsonSerializable()
// class Score {
//   String halftime;
//   String fulltime;
//   String extratime;
//   String penalty;
//
//   Score({required this.halftime, required this.fulltime, required this.extratime, required this.penalty});
//
//   factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ScoreToJson(this);
// }

@JsonSerializable()
class Event {
  int? timeElapsed;
  int? teamId;
  String? type;
  String? detail;
  String? comments;

  Event({
    required this.timeElapsed,
    required this.teamId,
    required this.type,
    required this.detail,
    required this.comments,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}


@JsonSerializable()
class Statistics {
  Team team;
  List<StatisticDetail> statistics;

  Statistics({required this.team, required this.statistics});

  factory Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsToJson(this);
}

@JsonSerializable()
class StatisticDetail {
  String type;
  dynamic value;

  StatisticDetail({required this.type, required this.value});

  factory StatisticDetail.fromJson(Map<String, dynamic> json) => _$StatisticDetailFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticDetailToJson(this);
}

@JsonSerializable()
class PlayerData {
  Team team;
  List<PlayerDetail> players;

  PlayerData({required this.team, required this.players});

  factory PlayerData.fromJson(Map<String, dynamic> json) => _$PlayerDataFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerDataToJson(this);
}

@JsonSerializable()
class PlayerDetail {
  Player player;
  List<PlayerStatistic> statistics;

  PlayerDetail({required this.player, required this.statistics});

  factory PlayerDetail.fromJson(Map<String, dynamic> json) => _$PlayerDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerDetailToJson(this);
}

@JsonSerializable()
class Player {
  int id;
  String name;
  String photo;

  Player({required this.id, required this.name, required this.photo});

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}

@JsonSerializable()
class PlayerStatistic {
  Games games;
  Shots? shots;
  Goals goals;
  Passes passes;
  Tackles? tackles;
  Duels duels;
  Dribbles? dribbles;
  Fouls fouls;
  Cards cards;
  Penalty? penalty;

  PlayerStatistic({
    required this.games,
    this.shots,
    required this.goals,
    required this.passes,
    this.tackles,
    required this.duels,
    this.dribbles,
    required this.fouls,
    required this.cards,
    this.penalty,
  });

  factory PlayerStatistic.fromJson(Map<String, dynamic> json) => _$PlayerStatisticFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerStatisticToJson(this);
}

@JsonSerializable()
class Games {
  int? minutes;
  int? number;
  String? position;
  String? rating;
  bool? captain;
  bool? substitute;

  Games({
    required this.minutes,
    required this.number,
    required this.position,
    required this.rating,
    required this.captain,
    required this.substitute,
  });

  factory Games.fromJson(Map<String, dynamic> json) => _$GamesFromJson(json);

  Map<String, dynamic> toJson() => _$GamesToJson(this);
}

@JsonSerializable()
class Shots {
  int? total;
  int? on;

  Shots({
    required this.total,
    required this.on,
  });

  factory Shots.fromJson(Map<String, dynamic> json) => _$ShotsFromJson(json);

  Map<String, dynamic> toJson() => _$ShotsToJson(this);
}

@JsonSerializable()
class GoalsPlayer {
  int? total;
  int? conceded;
  int? assists;
  int? saves;

  GoalsPlayer({
    this.total,
    this.conceded,
    this.assists,
    this.saves,
  });

  factory GoalsPlayer.fromJson(Map<String, dynamic> json) => _$GoalsPlayerFromJson(json);

  Map<String, dynamic> toJson() => _$GoalsPlayerToJson(this);
}

@JsonSerializable()
class Passes {
  int? total;
  int? key;
  String? accuracy;

  Passes({
    required this.total,
    required this.key,
    required this.accuracy,
  });

  factory Passes.fromJson(Map<String, dynamic> json) => _$PassesFromJson(json);

  Map<String, dynamic> toJson() => _$PassesToJson(this);
}

@JsonSerializable()
class Tackles {
  int? total;
  int? blocks;
  int? interceptions;

  Tackles({
    this.total,
    required this.blocks,
    required this.interceptions,
  });

  factory Tackles.fromJson(Map<String, dynamic> json) => _$TacklesFromJson(json);

  Map<String, dynamic> toJson() => _$TacklesToJson(this);
}

@JsonSerializable()
class Duels {
  int? total;
  int? won;

  Duels({
    required this.total,
    required this.won,
  });

  factory Duels.fromJson(Map<String, dynamic> json) => _$DuelsFromJson(json);

  Map<String, dynamic> toJson() => _$DuelsToJson(this);
}

@JsonSerializable()
class Dribbles {
  int? attempts;
  int? success;
  int? past;

  Dribbles({
    required this.attempts,
    required this.success,
    this.past,
  });

  factory Dribbles.fromJson(Map<String, dynamic> json) => _$DribblesFromJson(json);

  Map<String, dynamic> toJson() => _$DribblesToJson(this);
}

@JsonSerializable()
class Fouls {
  int? drawn;
  int? committed;

  Fouls({
    required this.drawn,
    required this.committed,
  });

  factory Fouls.fromJson(Map<String, dynamic> json) => _$FoulsFromJson(json);

  Map<String, dynamic> toJson() => _$FoulsToJson(this);
}

@JsonSerializable()
class Cards {
  int yellow;
  int red;

  Cards({
    required this.yellow,
    required this.red,
  });

  factory Cards.fromJson(Map<String, dynamic> json) => _$CardsFromJson(json);

  Map<String, dynamic> toJson() => _$CardsToJson(this);
}

@JsonSerializable()
class Penalty {
  int? won;
  int? committed;
  int? scored;
  int? missed;
  int? saved;

  Penalty({
    this.won,
    this.committed,
    required this.scored,
    required this.missed,
    required this.saved,
  });

  factory Penalty.fromJson(Map<String, dynamic> json) => _$PenaltyFromJson(json);

  Map<String, dynamic> toJson() => _$PenaltyToJson(this);
}






