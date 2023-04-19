import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SignInEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? accessToken = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}",
  "access_token": "${accessToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignInEmail',
      apiUrl:
          'https://oglmkpwpiottypmzxnzu.supabase.co/auth/v1/token?grant_type=password',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SingUpEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SingUpEmail',
      apiUrl: 'https://oglmkpwpiottypmzxnzu.supabase.co/auth/v1/signup',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LogOutCall {
  static Future<ApiCallResponse> call({
    String? userToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'LogOut',
      apiUrl: 'https://oglmkpwpiottypmzxnzu.supabase.co/auth/v1/logout',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userToken}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GoogleAuthCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GoogleAuth',
      apiUrl: 'https://oglmkpwpiottypmzxnzu.supabase.co/?provider=google',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
      },
      params: {
        'provider': "google",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SuperbaseTestCall {
  static Future<ApiCallResponse> call({
    List<String>? namesList,
  }) {
    final names = _serializeList(namesList);

    return ApiManager.instance.makeApiCall(
      callName: 'SuperbaseTest',
      apiUrl:
          'https://oglmkpwpiottypmzxnzu.supabase.co/rest/v1/related_persons?select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

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
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
