import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start eHealth API Group Code

class EHealthAPIGroup {
  static String getBaseUrl() => 'https://api-preprod.ehealth.gov.ua';
  static Map<String, String> headers = {};
}

/// End eHealth API Group Code

/// Start eHealth Dictionary Group Code

class EHealthDictionaryGroup {
  static String getBaseUrl() =>
      'https://api-preprod.ehealth.gov.ua/api/dictionaries';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static ObservationMethodsCall observationMethodsCall =
      ObservationMethodsCall();
  static ObservationStatusesCall observationStatusesCall =
      ObservationStatusesCall();
  static ObservationCategoriesCall observationCategoriesCall =
      ObservationCategoriesCall();
  static ObservationInterpretationsCall observationInterpretationsCall =
      ObservationInterpretationsCall();
  static ObservationInterpretationsCopyCall observationInterpretationsCopyCall =
      ObservationInterpretationsCopyCall();
}

class ObservationMethodsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = EHealthDictionaryGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObservationMethods',
      apiUrl: '${baseUrl}?',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'name': "eHealth/observation_methods",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? allObservationMethods(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].values[*]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  bool? isActive(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[:].is_active''',
      ));
  List<String>? labels(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].labels''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
}

class ObservationStatusesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = EHealthDictionaryGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObservationStatuses',
      apiUrl: '${baseUrl}?',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'name': "eHealth/observation_statuses",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? allObservationMethods(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].values[*]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  bool? isActive(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[:].is_active''',
      ));
  List<String>? labels(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].labels''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].name''',
      ));
}

class ObservationCategoriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = EHealthDictionaryGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObservationCategories',
      apiUrl: '${baseUrl}?',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'name': "eHealth/observation_categories",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? allObservationCategories(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].values[*]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  bool? isActive(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[:].is_active''',
      ));
  List<String>? labels(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].labels''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
}

class ObservationInterpretationsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = EHealthDictionaryGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObservationInterpretations',
      apiUrl: '${baseUrl}?',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'name': "eHealth/observation_interpretations",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? allObservationCategories(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].values[*]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  bool? isActive(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[:].is_active''',
      ));
  List<String>? labels(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].labels''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
}

class ObservationInterpretationsCopyCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = EHealthDictionaryGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObservationInterpretations Copy',
      apiUrl: '${baseUrl}?',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'name': "eHealth/observation_interpretations",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? allObservationCategories(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].values[*]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  bool? isActive(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[:].is_active''',
      ));
  List<String>? labels(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].labels''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
}

/// End eHealth Dictionary Group Code

/// Start eHealth OAuth Group Code

class EHealthOAuthGroup {
  static String getBaseUrl() => 'https://auth-preprod.ehealth.gov.ua';
  static Map<String, String> headers = {};
}

/// End eHealth OAuth Group Code

class RolesAllToDatatypeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'rolesAllToDatatype',
      apiUrl: 'https://oglmkpwpiottypmzxnzu.supabase.co/rest/v1/roles',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? allRoles(dynamic response) => (getJsonField(
        response,
        r'''$[*].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DepartmentsAllToDatatypeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'departmentsAllToDatatype',
      apiUrl: 'https://oglmkpwpiottypmzxnzu.supabase.co/rest/v1/d_departments',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserRolesFromListCall {
  static Future<ApiCallResponse> call({
    List<String>? idListList,
  }) async {
    final idList = _serializeList(idListList);

    return ApiManager.instance.makeApiCall(
      callName: 'userRolesFromList',
      apiUrl: 'https://oglmkpwpiottypmzxnzu.supabase.co/rest/v1/roles',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
      },
      params: {
        'select': "name",
        'id': "in.${idList}",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? namesList(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetPatientByIdCall {
  static Future<ApiCallResponse> call({
    String? subjectID = 'c4ab36ad-0423-4d60-af60-fa6b8f7e0a68',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPatientById',
      apiUrl: 'https://oglmkpwpiottypmzxnzu.supabase.co/rest/v1/patients',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
      },
      params: {
        'id': "eq.${subjectID}",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? namesList(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SearchUserProfileByParamCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
    String? columnName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchUserProfileByParam',
      apiUrl:
          'https://oglmkpwpiottypmzxnzu.supabase.co/rest/v1/users_profiles?${columnName}=ilike.*${searchString}*&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchPatientByParamServiceRoleSecretRLSCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
    String? columnName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchPatientByParam serviceRole secret RLS',
      apiUrl:
          'https://oglmkpwpiottypmzxnzu.supabase.co/rest/v1/patients?${columnName}=ilike.*${searchString}*&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3MjgyMzkzNSwiZXhwIjoxOTg4Mzk5OTM1fQ.b2kWZLf83sJvEYs5P1vsEOdOS_HJl8jwjjnDPJxZ0vo',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3MjgyMzkzNSwiZXhwIjoxOTg4Mzk5OTM1fQ.b2kWZLf83sJvEYs5P1vsEOdOS_HJl8jwjjnDPJxZ0vo',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPatientByIdServiceRoleSecretRLSCopyCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPatientById serviceRole secret RLS Copy',
      apiUrl: 'https://oglmkpwpiottypmzxnzu.supabase.co/rest/v1/patients',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3MjgyMzkzNSwiZXhwIjoxOTg4Mzk5OTM1fQ.b2kWZLf83sJvEYs5P1vsEOdOS_HJl8jwjjnDPJxZ0vo',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3MjgyMzkzNSwiZXhwIjoxOTg4Mzk5OTM1fQ.b2kWZLf83sJvEYs5P1vsEOdOS_HJl8jwjjnDPJxZ0vo',
      },
      params: {
        'id': "eq.${id}",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? namesList(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static bool? isInvalid(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].isInvalid''',
      ));
}

class PatientInViewByDepartmentServiceRoleSecretRLSCall {
  static Future<ApiCallResponse> call({
    String? department = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'patientInViewByDepartment serviceRole secret RLS',
      apiUrl:
          'https://oglmkpwpiottypmzxnzu.supabase.co/rest/v1/patients_in_departments_view',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3MjgyMzkzNSwiZXhwIjoxOTg4Mzk5OTM1fQ.b2kWZLf83sJvEYs5P1vsEOdOS_HJl8jwjjnDPJxZ0vo',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3MjgyMzkzNSwiZXhwIjoxOTg4Mzk5OTM1fQ.b2kWZLf83sJvEYs5P1vsEOdOS_HJl8jwjjnDPJxZ0vo',
      },
      params: {
        'department_current': "eq.${department}",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserRolesCall {
  static Future<ApiCallResponse> call({
    String? id = '11b86ed9-ff6d-4c20-915a-14afc1c59313',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserRoles',
      apiUrl: 'https://oglmkpwpiottypmzxnzu.supabase.co/rest/v1/users_profiles',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
      },
      params: {
        'select': "roles",
        'id': "eq.${id}",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? rolesPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].roles''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetColorOfRoleCall {
  static Future<ApiCallResponse> call({
    String? roleid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getColorOfRole',
      apiUrl: 'https://oglmkpwpiottypmzxnzu.supabase.co/rest/v1/roles',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4',
      },
      params: {
        'select': "color",
        'id': roleid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? color(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[*].color''',
      ));
}

class AlgoliaDiagnosesGETCall {
  static Future<ApiCallResponse> call({
    String? searchData = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Algolia diagnoses GET',
      apiUrl:
          'https://NCOYKVW5BE-dsn.algolia.net/1/indexes/DC_diagnoses?query=${searchData}',
      callType: ApiCallType.GET,
      headers: {
        'X-Algolia-API-Key': '650d59c9f93fb1d3858c4795e7a0b7e6',
        'X-Algolia-Application-Id': 'NCOYKVW5BE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? code(dynamic response) => (getJsonField(
        response,
        r'''$.hits[:].code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.hits[:].description_ua''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? hits(dynamic response) => getJsonField(
        response,
        r'''$.hits''',
        true,
      ) as List?;
}

class AlgoliaDiagnosesPOSTCall {
  static Future<ApiCallResponse> call({
    String? searchData = '',
  }) async {
    final ffApiRequestBody = '''
{
  "params": "query=${searchData}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Algolia diagnoses POST',
      apiUrl: 'https://NCOYKVW5BE-dsn.algolia.net/1/indexes/DC_diagnoses/query',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-API-Key': '650d59c9f93fb1d3858c4795e7a0b7e6',
        'X-Algolia-Application-Id': 'NCOYKVW5BE',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
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

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
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
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
