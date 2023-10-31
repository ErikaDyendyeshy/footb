// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lineups_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LineupResponse _$LineupResponseFromJson(Map<String, dynamic> json) =>
    LineupResponse(
      lineups: (json['lineups'] as List<dynamic>)
          .map((e) => TeamLineup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LineupResponseToJson(LineupResponse instance) =>
    <String, dynamic>{
      'lineups': instance.lineups,
    };

TeamLineup _$TeamLineupFromJson(Map<String, dynamic> json) => TeamLineup(
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      formation: json['formation'] as String,
      startXI: (json['startXI'] as List<dynamic>)
          .map((e) => PlayerInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      substitutes: (json['substitutes'] as List<dynamic>)
          .map((e) => PlayerInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      coach: Coach.fromJson(json['coach'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamLineupToJson(TeamLineup instance) =>
    <String, dynamic>{
      'team': instance.team,
      'formation': instance.formation,
      'startXI': instance.startXI,
      'substitutes': instance.substitutes,
      'coach': instance.coach,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
      colors: TeamColors.fromJson(json['colors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'colors': instance.colors,
    };

TeamColors _$TeamColorsFromJson(Map<String, dynamic> json) => TeamColors(
      player: PlayerColors.fromJson(json['player'] as Map<String, dynamic>),
      goalkeeper:
          PlayerColors.fromJson(json['goalkeeper'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamColorsToJson(TeamColors instance) =>
    <String, dynamic>{
      'player': instance.player,
      'goalkeeper': instance.goalkeeper,
    };

PlayerColors _$PlayerColorsFromJson(Map<String, dynamic> json) => PlayerColors(
      primary: json['primary'] as String,
      number: json['number'] as String,
      border: json['border'] as String,
    );

Map<String, dynamic> _$PlayerColorsToJson(PlayerColors instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'number': instance.number,
      'border': instance.border,
    };

PlayerInfo _$PlayerInfoFromJson(Map<String, dynamic> json) => PlayerInfo(
      player: Player.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerInfoToJson(PlayerInfo instance) =>
    <String, dynamic>{
      'player': instance.player,
    };

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      id: json['id'] as int,
      name: json['name'] as String,
      number: json['number'] as int,
      pos: json['pos'] as String,
      grid: json['grid'] as String?,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'pos': instance.pos,
      'grid': instance.grid,
    };

Coach _$CoachFromJson(Map<String, dynamic> json) => Coach(
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$CoachToJson(Coach instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
    };
