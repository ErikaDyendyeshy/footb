import 'package:json_annotation/json_annotation.dart';

part 'lineups_response.g.dart';


@JsonSerializable()
class LineupResponse {
  final List<TeamLineup> lineups;

  LineupResponse({required this.lineups});

  factory LineupResponse.fromJson(Map<String, dynamic> json) => _$LineupResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LineupResponseToJson(this);
}

@JsonSerializable()
class TeamLineup {
  final Team team;
  final String formation;
  final List<PlayerInfo> startXI;
  final List<PlayerInfo> substitutes;
  final Coach coach;

  TeamLineup({required this.team, required this.formation, required this.startXI, required this.substitutes, required this.coach});

  factory TeamLineup.fromJson(Map<String, dynamic> json) => _$TeamLineupFromJson(json);
  Map<String, dynamic> toJson() => _$TeamLineupToJson(this);
}

@JsonSerializable()
class Team {
  final int id;
  final String name;
  final String logo;
  final TeamColors colors;

  Team({required this.id, required this.name, required this.logo, required this.colors});

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}

@JsonSerializable()
class TeamColors {
  final PlayerColors player;
  final PlayerColors goalkeeper;

  TeamColors({required this.player, required this.goalkeeper});

  factory TeamColors.fromJson(Map<String, dynamic> json) => _$TeamColorsFromJson(json);
  Map<String, dynamic> toJson() => _$TeamColorsToJson(this);
}

@JsonSerializable()
class PlayerColors {
  final String primary;
  final String number;
  final String border;

  PlayerColors({required this.primary, required this.number, required this.border});

  factory PlayerColors.fromJson(Map<String, dynamic> json) => _$PlayerColorsFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerColorsToJson(this);
}

@JsonSerializable()
class PlayerInfo {
  final Player player;

  PlayerInfo({required this.player});

  factory PlayerInfo.fromJson(Map<String, dynamic> json) => _$PlayerInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerInfoToJson(this);
}

@JsonSerializable()
class Player {
  final int id;
  final String name;
  final int number;
  final String pos;
  final String? grid;

  Player({required this.id, required this.name, required this.number, required this.pos, this.grid});

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}

@JsonSerializable()
class Coach {
  final int id;
  final String name;
  final String photo;

  Coach({required this.id, required this.name, required this.photo});

  factory Coach.fromJson(Map<String, dynamic> json) => _$CoachFromJson(json);
  Map<String, dynamic> toJson() => _$CoachToJson(this);
}

class FootballTeam {
  final String formation;
  final List<Player> startXI;
  final List<Player> substitutes;
  final Coach coach;

  FootballTeam({required this.formation, required this.startXI, required this.substitutes, required this.coach});

  factory FootballTeam.fromJson(Map<String, dynamic> json) {
    return FootballTeam(
      formation: json['formation'],
      startXI: (json['startXI'] as List).map((e) => Player.fromJson(e)).toList(),
      substitutes: (json['substitutes'] as List).map((e) => Player.fromJson(e)).toList(),
      coach: Coach.fromJson(json['coach']),
    );
  }
}



