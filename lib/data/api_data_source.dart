import 'dart:convert';

import 'package:football/const.dart';
import 'package:football/data/model/fixture_response/fixture_response.dart';
import 'package:football/data/model/league.dart';
import 'package:football/util/http_extension.dart';
import 'package:get/get.dart';

class ApiDataSource {
  final GetConnect _getConnect = GetConnect();

  ApiDataSource() {
    _getConnect.baseUrl = apiUrl;

    _getConnect.httpClient.addRequestModifier<Object?>((request) async {
      request.headers['X-RapidAPI-Key'] = '237e224c91msh0b8e5c270bc8c58p1ee6afjsn6ff9f8d2276d';
      request.headers['X-RapidAPI-Host'] = 'api-football-v1.p.rapidapi.com';

      return request;
    });
  }

  Future<List<FixtureItem>> fetchMatchesByDate({String? date, String? live}) async {
    final Map<String, dynamic> query = {};
    query.addIf(
      date != null,
      "date",
      date,
    );

    query.addIf(
      live != null,
      "live",
      live,
    );

    final Response response = await _getConnect.getRequest(url: '/v3/fixtures', query: query);
    if (response.statusCode == 200) {
      final FixtureResponse fixtureResponse =
          FixtureResponse.fromJson(jsonDecode(response.bodyString!));
      return fixtureResponse.response;
    } else {
      throw Exception('Failed to load matches');
    }
  }

  Future<FixtureDetail?> getFixtureDetailById({required String fixtureId}) async {
    final Map<String, dynamic> query = {'id': fixtureId};

    final response = await _getConnect.getRequest(url: '/v3/fixtures', query: query);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      if (response.body != null) {
        final data = json.decode(response.bodyString!);
        return FixtureDetail.fromJson(data['response'][0]);
      }
    }
    return null;
  }

  Future<LeagueData?> fetchLeagues() async {
    final response = await _getConnect.getRequest(
      url: '/v3/leagues',
    );

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      if (response.body != null) {
        return LeagueData.fromJson(response.body);
      }
    }
    return null;
  }
}
