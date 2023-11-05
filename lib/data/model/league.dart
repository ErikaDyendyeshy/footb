import 'package:json_annotation/json_annotation.dart';

part 'league.g.dart';


@JsonSerializable()
class LeagueData {
  final dynamic parameters;
  final List<String> errors;


  final List<League> response;

  LeagueData({
    required this.parameters,
    required this.errors,

    required this.response,
  });

  factory LeagueData.fromJson(Map<String, dynamic> json) => _$LeagueDataFromJson(json);
  Map<String, dynamic> toJson() => _$LeagueDataToJson(this);
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
class League {
  final LeagueDetails league;
  final Country country;
  final List<Season> seasons;

  League({
    required this.league,
    required this.country,
    required this.seasons,
  });

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}

@JsonSerializable()
class LeagueDetails {
  final int? id;
  final String? name;
  final String? type;
  final String? logo;

  LeagueDetails({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });

  factory LeagueDetails.fromJson(Map<String, dynamic> json) => _$LeagueDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$LeagueDetailsToJson(this);
}

@JsonSerializable()
class Country {
  final String name;
  final String? code;
  final String? flag;

  Country({
    required this.name,
    this.code,
    this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Season {
  final int year;
  final String start;
  final String end;
  final bool current;
  final Coverage coverage;

  Season({
    required this.year,
    required this.start,
    required this.end,
    required this.current,
    required this.coverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}

@JsonSerializable()
class Coverage {
  final Fixtures fixtures;
  final bool standings;
  final bool players;
  final bool top_scorers;
  final bool top_assists;
  final bool top_cards;
  final bool injuries;
  final bool predictions;
  final bool odds;

  Coverage({
    required this.fixtures,
    required this.standings,
    required this.players,
    required this.top_scorers,
    required this.top_assists,
    required this.top_cards,
    required this.injuries,
    required this.predictions,
    required this.odds,
  });

  factory Coverage.fromJson(Map<String, dynamic> json) => _$CoverageFromJson(json);
  Map<String, dynamic> toJson() => _$CoverageToJson(this);
}

@JsonSerializable()
class Fixtures {
  final bool events;
  final bool lineups;
  final bool statistics_fixtures;
  final bool statistics_players;

  Fixtures({
    required this.events,
    required this.lineups,
    required this.statistics_fixtures,
    required this.statistics_players,
  });

  factory Fixtures.fromJson(Map<String, dynamic> json) => _$FixturesFromJson(json);
  Map<String, dynamic> toJson() => _$FixturesToJson(this);
}
