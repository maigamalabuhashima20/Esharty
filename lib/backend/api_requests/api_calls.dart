import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start ApiVideoes Group Code

class ApiVideoesGroup {
  static String getBaseUrl() => 'https://tkmqqhaphdnfkicwqolx.supabase.co';
  static Map<String, String> headers = {};
  static LettersvideoCall lettersvideoCall = LettersvideoCall();
}

class LettersvideoCall {
  Future<ApiCallResponse> call({
    String? title = '',
  }) async {
    final baseUrl = ApiVideoesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Lettersvideo',
      apiUrl:
          '$baseUrl/rest/v1/Letters_video?or=(video_title.like.%$title%)',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRrbXFxaGFwaGRuZmtpY3dxb2x4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTAyODYwODUsImV4cCI6MjAyNTg2MjA4NX0.tWDV4Uk91OGDN2agiFqiwNWjjbc5KMQ6gE0DU_Q5RYc',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRrbXFxaGFwaGRuZmtpY3dxb2x4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTAyODYwODUsImV4cCI6MjAyNTg2MjA4NX0.tWDV4Uk91OGDN2agiFqiwNWjjbc5KMQ6gE0DU_Q5RYc',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ApiVideoes Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
