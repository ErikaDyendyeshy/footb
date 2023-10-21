import 'dart:convert';

import 'package:football/const.dart';
import 'package:football/data/model/match_model.dart';
import 'package:football/util/http_extension.dart';
import 'package:get/get.dart';

class ApiDataSource {
  final GetConnect _getConnect = GetConnect();

  ApiDataSource() {
    _getConnect.baseUrl = apiUrl;

    _getConnect.httpClient.addRequestModifier<Object?>((request) async {
      request.headers['X-RapidAPI-Key'] =
      '237e224c91msh0b8e5c270bc8c58p1ee6afjsn6ff9f8d2276d';
      request.headers['X-RapidAPI-Host'] = 'transfermarket.p.rapidapi.com';

      return request;
    });
  }

  Future<List<MatchDetail>> fetchMatches({required String date}) async {
    final Map<String, dynamic> query = {};
    query['date'] = date;
    return _getConnect.getRequest(
      url: 'matches/list-by-date',
      query: query,
    ).then((Response response) {
      if (response.statusCode == 200) {
        MatchModel matchModel = MatchModel.fromJson(jsonDecode(response.bodyString!));
        return matchModel.liveMatches.values.expand((v) => v).toList();
      } else {
        throw Exception('Failed to load matches');
      }
    });
  }

}
