// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixtureResponse _$FixtureResponseFromJson(Map<String, dynamic> json) =>
    FixtureResponse(
      results: json['results'] as int,
      paging: Paging.fromJson(json['paging'] as Map<String, dynamic>),
      response: (json['response'] as List<dynamic>)
          .map((e) => FixtureItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FixtureResponseToJson(FixtureResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'paging': instance.paging,
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

FixtureItem _$FixtureItemFromJson(Map<String, dynamic> json) => FixtureItem(
      fixture: Fixture.fromJson(json['fixture'] as Map<String, dynamic>),
      venue: json['venue'] == null
          ? null
          : Venue.fromJson(json['venue'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      league: json['league'] == null
          ? null
          : League.fromJson(json['league'] as Map<String, dynamic>),
      teams: Teams.fromJson(json['teams'] as Map<String, dynamic>),
      goals: json['goals'] == null
          ? null
          : Goals.fromJson(json['goals'] as Map<String, dynamic>),
      score: json['score'] == null
          ? null
          : Score.fromJson(json['score'] as Map<String, dynamic>),
      periods: json['periods'] == null
          ? null
          : Periods.fromJson(json['periods'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureItemToJson(FixtureItem instance) =>
    <String, dynamic>{
      'fixture': instance.fixture,
      'venue': instance.venue,
      'status': instance.status,
      'league': instance.league,
      'teams': instance.teams,
      'goals': instance.goals,
      'score': instance.score,
      'periods': instance.periods,
    };

Fixture _$FixtureFromJson(Map<String, dynamic> json) => Fixture(
      id: json['id'] as int,
      referee: json['referee'] as String?,
      timezone: json['timezone'] as String,
      date: json['date'] as String,
      timestamp: json['timestamp'] as int,
      periods: Periods.fromJson(json['periods'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureToJson(Fixture instance) => <String, dynamic>{
      'id': instance.id,
      'referee': instance.referee,
      'timezone': instance.timezone,
      'date': instance.date,
      'timestamp': instance.timestamp,
      'periods': instance.periods,
    };

Periods _$PeriodsFromJson(Map<String, dynamic> json) => Periods(
      first: json['first'] as int?,
      second: json['second'] as int?,
    );

Map<String, dynamic> _$PeriodsToJson(Periods instance) => <String, dynamic>{
      'first': instance.first,
      'second': instance.second,
    };

Venue _$VenueFromJson(Map<String, dynamic> json) => Venue(
      id: json['id'] as int?,
      name: json['name'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$VenueToJson(Venue instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      long: json['long'] as String,
      short: json['short'] as String,
      elapsed: json['elapsed'] as int,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'long': instance.long,
      'short': instance.short,
      'elapsed': instance.elapsed,
    };

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      id: json['id'] as int,
      name: json['name'] as String,
      country: json['country'] as String,
      logo: json['logo'] as String,
      flag: json['flag'],
      season: json['season'] as int,
      round: json['round'] as String,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'logo': instance.logo,
      'flag': instance.flag,
      'type': instance.type,
      'season': instance.season,
      'round': instance.round,
    };

Teams _$TeamsFromJson(Map<String, dynamic> json) => Teams(
      home: json['home'] == null
          ? null
          : Team.fromJson(json['home'] as Map<String, dynamic>),
      away: json['away'] == null
          ? null
          : Team.fromJson(json['away'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamsToJson(Teams instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String?,
      winner: json['winner'] as bool?,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'winner': instance.winner,
    };

Goals _$GoalsFromJson(Map<String, dynamic> json) => Goals(
      home: json['home'] as int?,
      away: json['away'] as int?,
    );

Map<String, dynamic> _$GoalsToJson(Goals instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

Score _$ScoreFromJson(Map<String, dynamic> json) => Score(
      halftime: json['halftime'] == null
          ? null
          : HalfTime.fromJson(json['halftime'] as Map<String, dynamic>),
      fulltime: json['fulltime'] == null
          ? null
          : FullTime.fromJson(json['fulltime'] as Map<String, dynamic>),
      extratime: json['extratime'],
      penalty: json['penalty'],
    );

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
      'halftime': instance.halftime,
      'fulltime': instance.fulltime,
      'extratime': instance.extratime,
      'penalty': instance.penalty,
    };

HalfTime _$HalfTimeFromJson(Map<String, dynamic> json) => HalfTime(
      home: json['home'] as int?,
      away: json['away'] as int?,
    );

Map<String, dynamic> _$HalfTimeToJson(HalfTime instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

FullTime _$FullTimeFromJson(Map<String, dynamic> json) => FullTime(
      home: json['home'] as int?,
      away: json['away'] as int?,
    );

Map<String, dynamic> _$FullTimeToJson(FullTime instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

FixtureDetailResponse _$FixtureDetailResponseFromJson(
        Map<String, dynamic> json) =>
    FixtureDetailResponse(
      response: (json['response'] as List<dynamic>)
          .map((e) => FixtureDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FixtureDetailResponseToJson(
        FixtureDetailResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
    };

FixtureDetail _$FixtureDetailFromJson(Map<String, dynamic> json) =>
    FixtureDetail(
      fixture: Fixture.fromJson(json['fixture'] as Map<String, dynamic>),
      league: League.fromJson(json['league'] as Map<String, dynamic>),
      teams: Teams.fromJson(json['teams'] as Map<String, dynamic>),
      goals: Goals.fromJson(json['goals'] as Map<String, dynamic>),
      score: Score.fromJson(json['score'] as Map<String, dynamic>),
      events: (json['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      statistics: (json['statistics'] as List<dynamic>)
          .map((e) => Statistics.fromJson(e as Map<String, dynamic>))
          .toList(),
      players: (json['players'] as List<dynamic>)
          .map((e) => PlayerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FixtureDetailToJson(FixtureDetail instance) =>
    <String, dynamic>{
      'fixture': instance.fixture,
      'league': instance.league,
      'teams': instance.teams,
      'goals': instance.goals,
      'score': instance.score,
      'events': instance.events,
      'statistics': instance.statistics,
      'players': instance.players,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      timeElapsed: json['timeElapsed'] as int?,
      teamId: json['teamId'] as int?,
      type: json['type'] as String?,
      detail: json['detail'] as String?,
      comments: json['comments'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'timeElapsed': instance.timeElapsed,
      'teamId': instance.teamId,
      'type': instance.type,
      'detail': instance.detail,
      'comments': instance.comments,
    };

Statistics _$StatisticsFromJson(Map<String, dynamic> json) => Statistics(
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      statistics: (json['statistics'] as List<dynamic>)
          .map((e) => StatisticDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatisticsToJson(Statistics instance) =>
    <String, dynamic>{
      'team': instance.team,
      'statistics': instance.statistics,
    };

StatisticDetail _$StatisticDetailFromJson(Map<String, dynamic> json) =>
    StatisticDetail(
      type: json['type'] as String,
      value: json['value'],
    );

Map<String, dynamic> _$StatisticDetailToJson(StatisticDetail instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };

PlayerData _$PlayerDataFromJson(Map<String, dynamic> json) => PlayerData(
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>)
          .map((e) => PlayerDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayerDataToJson(PlayerData instance) =>
    <String, dynamic>{
      'team': instance.team,
      'players': instance.players,
    };

PlayerDetail _$PlayerDetailFromJson(Map<String, dynamic> json) => PlayerDetail(
      player: Player.fromJson(json['player'] as Map<String, dynamic>),
      statistics: (json['statistics'] as List<dynamic>)
          .map((e) => PlayerStatistic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayerDetailToJson(PlayerDetail instance) =>
    <String, dynamic>{
      'player': instance.player,
      'statistics': instance.statistics,
    };

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
    };

PlayerStatistic _$PlayerStatisticFromJson(Map<String, dynamic> json) =>
    PlayerStatistic(
      games: Games.fromJson(json['games'] as Map<String, dynamic>),
      shots: json['shots'] == null
          ? null
          : Shots.fromJson(json['shots'] as Map<String, dynamic>),
      goals: Goals.fromJson(json['goals'] as Map<String, dynamic>),
      passes: Passes.fromJson(json['passes'] as Map<String, dynamic>),
      tackles: json['tackles'] == null
          ? null
          : Tackles.fromJson(json['tackles'] as Map<String, dynamic>),
      duels: Duels.fromJson(json['duels'] as Map<String, dynamic>),
      dribbles: json['dribbles'] == null
          ? null
          : Dribbles.fromJson(json['dribbles'] as Map<String, dynamic>),
      fouls: Fouls.fromJson(json['fouls'] as Map<String, dynamic>),
      cards: Cards.fromJson(json['cards'] as Map<String, dynamic>),
      penalty: json['penalty'] == null
          ? null
          : Penalty.fromJson(json['penalty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerStatisticToJson(PlayerStatistic instance) =>
    <String, dynamic>{
      'games': instance.games,
      'shots': instance.shots,
      'goals': instance.goals,
      'passes': instance.passes,
      'tackles': instance.tackles,
      'duels': instance.duels,
      'dribbles': instance.dribbles,
      'fouls': instance.fouls,
      'cards': instance.cards,
      'penalty': instance.penalty,
    };

Games _$GamesFromJson(Map<String, dynamic> json) => Games(
      minutes: json['minutes'] as int?,
      number: json['number'] as int?,
      position: json['position'] as String?,
      rating: json['rating'] as String?,
      captain: json['captain'] as bool?,
      substitute: json['substitute'] as bool?,
    );

Map<String, dynamic> _$GamesToJson(Games instance) => <String, dynamic>{
      'minutes': instance.minutes,
      'number': instance.number,
      'position': instance.position,
      'rating': instance.rating,
      'captain': instance.captain,
      'substitute': instance.substitute,
    };

Shots _$ShotsFromJson(Map<String, dynamic> json) => Shots(
      total: json['total'] as int?,
      on: json['on'] as int?,
    );

Map<String, dynamic> _$ShotsToJson(Shots instance) => <String, dynamic>{
      'total': instance.total,
      'on': instance.on,
    };

GoalsPlayer _$GoalsPlayerFromJson(Map<String, dynamic> json) => GoalsPlayer(
      total: json['total'] as int?,
      conceded: json['conceded'] as int?,
      assists: json['assists'] as int?,
      saves: json['saves'] as int?,
    );

Map<String, dynamic> _$GoalsPlayerToJson(GoalsPlayer instance) =>
    <String, dynamic>{
      'total': instance.total,
      'conceded': instance.conceded,
      'assists': instance.assists,
      'saves': instance.saves,
    };

Passes _$PassesFromJson(Map<String, dynamic> json) => Passes(
      total: json['total'] as int?,
      key: json['key'] as int?,
      accuracy: json['accuracy'] as String?,
    );

Map<String, dynamic> _$PassesToJson(Passes instance) => <String, dynamic>{
      'total': instance.total,
      'key': instance.key,
      'accuracy': instance.accuracy,
    };

Tackles _$TacklesFromJson(Map<String, dynamic> json) => Tackles(
      total: json['total'] as int?,
      blocks: json['blocks'] as int?,
      interceptions: json['interceptions'] as int?,
    );

Map<String, dynamic> _$TacklesToJson(Tackles instance) => <String, dynamic>{
      'total': instance.total,
      'blocks': instance.blocks,
      'interceptions': instance.interceptions,
    };

Duels _$DuelsFromJson(Map<String, dynamic> json) => Duels(
      total: json['total'] as int?,
      won: json['won'] as int?,
    );

Map<String, dynamic> _$DuelsToJson(Duels instance) => <String, dynamic>{
      'total': instance.total,
      'won': instance.won,
    };

Dribbles _$DribblesFromJson(Map<String, dynamic> json) => Dribbles(
      attempts: json['attempts'] as int?,
      success: json['success'] as int?,
      past: json['past'] as int?,
    );

Map<String, dynamic> _$DribblesToJson(Dribbles instance) => <String, dynamic>{
      'attempts': instance.attempts,
      'success': instance.success,
      'past': instance.past,
    };

Fouls _$FoulsFromJson(Map<String, dynamic> json) => Fouls(
      drawn: json['drawn'] as int?,
      committed: json['committed'] as int?,
    );

Map<String, dynamic> _$FoulsToJson(Fouls instance) => <String, dynamic>{
      'drawn': instance.drawn,
      'committed': instance.committed,
    };

Cards _$CardsFromJson(Map<String, dynamic> json) => Cards(
      yellow: json['yellow'] as int,
      red: json['red'] as int,
    );

Map<String, dynamic> _$CardsToJson(Cards instance) => <String, dynamic>{
      'yellow': instance.yellow,
      'red': instance.red,
    };

Penalty _$PenaltyFromJson(Map<String, dynamic> json) => Penalty(
      won: json['won'] as int?,
      committed: json['committed'] as int?,
      scored: json['scored'] as int?,
      missed: json['missed'] as int?,
      saved: json['saved'] as int?,
    );

Map<String, dynamic> _$PenaltyToJson(Penalty instance) => <String, dynamic>{
      'won': instance.won,
      'committed': instance.committed,
      'scored': instance.scored,
      'missed': instance.missed,
      'saved': instance.saved,
    };
