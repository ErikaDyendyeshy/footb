import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:football/data/model/to_json_interface.dart';
import 'package:football/util/exeption/validator_exeption.dart';
import 'package:get/get.dart';

extension GetConnectExtension on GetConnect {
  Future<Response> getRequest({
    required String url,
    Map<String, dynamic>? query,
  }) {
    return get(
      url,
      query: query,
    ).then((value) {
      _hanldeResponseCode(value);
      return value;
    });
  }

  Future<Response> postRequest({
    required String url,
    required dynamic request,
    Map<String, dynamic>? query,
  }) {
    return post(
      url,
      request is List ? request.map((item) => item.toJson()).toList() : request.toJson(),
      query: query,
    ).then((value) {
      _hanldeResponseCode(value);
      return value;
    });
  }

  Future<Response> putRequest({required String url, required ToJsonInterface request}) {
    return put(url, request.toJson()).then((value) {
      _hanldeResponseCode(value);
      return value;
    });
  }

  Future<Response> patchRequest({required String url, required ToJsonInterface request}) {
    return patch(url, request.toJson()).then((value) {
      _hanldeResponseCode(value);
      return value;
    });
  }

  Future<Response> deleteRequest({required String url, required ToJsonInterface request}) {
    return delete(url).then((value) {
      _hanldeResponseCode(value);
      return value;
    });
  }

  void _hanldeResponseCode(Response response) {
    // TODO: handle http statuse
    _logResponse(response);
    switch (response.statusCode) {
      case HttpStatus.unauthorized:
        Map<String, dynamic> errorJson = jsonDecode(response.bodyString!);
        Map<String, dynamic> validationErrors = errorJson['error'];
        throw ValidationException(validationErrors);
    // Map json = jsonDecode(response.bodyString!);
    // String errorMessage = json.parseJsonAsString(key: 'detail');
    // throw UnAuthException(errorMessage);
      case HttpStatus.badRequest:
        Map<String, dynamic> errorJson = jsonDecode(response.bodyString!);
        Map<String, dynamic> validationErrors = errorJson['error'];
        throw ValidationException(validationErrors);
    }
  }

  void _logResponse(Response response) {
    // ignore: avoid_print
    print(
        '${response.request?.method.toUpperCase()} ${response.request?.url} ${response.statusCode}\n${response.bodyString}');
  }

  Uri get protocolInfo => Uri.parse(baseUrl!);
}