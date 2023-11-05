// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeagueData _$LeagueDataFromJson(Map<String, dynamic> json) => LeagueData(
      parameters: json['parameters'],
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
      response: (json['response'] as List<dynamic>)
          .map((e) => League.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeagueDataToJson(LeagueData instance) =>
    <String, dynamic>{
      'parameters': instance.parameters,
      'errors': instance.errors,
      'response': instance.response,
    };

Paging _$PagingFromJson(Map<String, dynamic> json) => Paging(
      current: json['current'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
    };

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      league: LeagueDetails.fromJson(json['league'] as Map<String, dynamic>),
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'league': instance.league,
      'country': instance.country,
      'seasons': instance.seasons,
    };

LeagueDetails _$LeagueDetailsFromJson(Map<String, dynamic> json) =>
    LeagueDetails(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$LeagueDetailsToJson(LeagueDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'logo': instance.logo,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String,
      code: json['code'] as String?,
      flag: json['flag'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
    };

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
      year: json['year'] as int,
      start: json['start'] as String,
      end: json['end'] as String,
      current: json['current'] as bool,
      coverage: Coverage.fromJson(json['coverage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
      'year': instance.year,
      'start': instance.start,
      'end': instance.end,
      'current': instance.current,
      'coverage': instance.coverage,
    };

Coverage _$CoverageFromJson(Map<String, dynamic> json) => Coverage(
      fixtures: Fixtures.fromJson(json['fixtures'] as Map<String, dynamic>),
      standings: json['standings'] as bool,
      players: json['players'] as bool,
      top_scorers: json['top_scorers'] as bool,
      top_assists: json['top_assists'] as bool,
      top_cards: json['top_cards'] as bool,
      injuries: json['injuries'] as bool,
      predictions: json['predictions'] as bool,
      odds: json['odds'] as bool,
    );

Map<String, dynamic> _$CoverageToJson(Coverage instance) => <String, dynamic>{
      'fixtures': instance.fixtures,
      'standings': instance.standings,
      'players': instance.players,
      'top_scorers': instance.top_scorers,
      'top_assists': instance.top_assists,
      'top_cards': instance.top_cards,
      'injuries': instance.injuries,
      'predictions': instance.predictions,
      'odds': instance.odds,
    };

Fixtures _$FixturesFromJson(Map<String, dynamic> json) => Fixtures(
      events: json['events'] as bool,
      lineups: json['lineups'] as bool,
      statistics_fixtures: json['statistics_fixtures'] as bool,
      statistics_players: json['statistics_players'] as bool,
    );

Map<String, dynamic> _$FixturesToJson(Fixtures instance) => <String, dynamic>{
      'events': instance.events,
      'lineups': instance.lineups,
      'statistics_fixtures': instance.statistics_fixtures,
      'statistics_players': instance.statistics_players,
    };
