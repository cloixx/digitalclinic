// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PatientSearchDataStruct extends BaseStruct {
  PatientSearchDataStruct({
    String? id,
    String? patientLastName,
    String? patientFirstName,
    String? patientMiddleName,
    String? patientPhoneNumber,
    String? patientPhotoUrl,
    String? patientDateOfBirth,
    String? userProfileID,
    String? createdAt,
  })  : _id = id,
        _patientLastName = patientLastName,
        _patientFirstName = patientFirstName,
        _patientMiddleName = patientMiddleName,
        _patientPhoneNumber = patientPhoneNumber,
        _patientPhotoUrl = patientPhotoUrl,
        _patientDateOfBirth = patientDateOfBirth,
        _userProfileID = userProfileID,
        _createdAt = createdAt;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "patientLastName" field.
  String? _patientLastName;
  String get patientLastName => _patientLastName ?? '';
  set patientLastName(String? val) => _patientLastName = val;

  bool hasPatientLastName() => _patientLastName != null;

  // "patientFirstName" field.
  String? _patientFirstName;
  String get patientFirstName => _patientFirstName ?? '';
  set patientFirstName(String? val) => _patientFirstName = val;

  bool hasPatientFirstName() => _patientFirstName != null;

  // "patientMiddleName" field.
  String? _patientMiddleName;
  String get patientMiddleName => _patientMiddleName ?? '';
  set patientMiddleName(String? val) => _patientMiddleName = val;

  bool hasPatientMiddleName() => _patientMiddleName != null;

  // "patientPhoneNumber" field.
  String? _patientPhoneNumber;
  String get patientPhoneNumber => _patientPhoneNumber ?? '';
  set patientPhoneNumber(String? val) => _patientPhoneNumber = val;

  bool hasPatientPhoneNumber() => _patientPhoneNumber != null;

  // "patientPhotoUrl" field.
  String? _patientPhotoUrl;
  String get patientPhotoUrl => _patientPhotoUrl ?? '';
  set patientPhotoUrl(String? val) => _patientPhotoUrl = val;

  bool hasPatientPhotoUrl() => _patientPhotoUrl != null;

  // "patientDateOfBirth" field.
  String? _patientDateOfBirth;
  String get patientDateOfBirth => _patientDateOfBirth ?? '';
  set patientDateOfBirth(String? val) => _patientDateOfBirth = val;

  bool hasPatientDateOfBirth() => _patientDateOfBirth != null;

  // "user_profile_ID" field.
  String? _userProfileID;
  String get userProfileID => _userProfileID ?? '';
  set userProfileID(String? val) => _userProfileID = val;

  bool hasUserProfileID() => _userProfileID != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static PatientSearchDataStruct fromMap(Map<String, dynamic> data) =>
      PatientSearchDataStruct(
        id: data['id'] as String?,
        patientLastName: data['patientLastName'] as String?,
        patientFirstName: data['patientFirstName'] as String?,
        patientMiddleName: data['patientMiddleName'] as String?,
        patientPhoneNumber: data['patientPhoneNumber'] as String?,
        patientPhotoUrl: data['patientPhotoUrl'] as String?,
        patientDateOfBirth: data['patientDateOfBirth'] as String?,
        userProfileID: data['user_profile_ID'] as String?,
        createdAt: data['created_at'] as String?,
      );

  static PatientSearchDataStruct? maybeFromMap(dynamic data) => data is Map
      ? PatientSearchDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'patientLastName': _patientLastName,
        'patientFirstName': _patientFirstName,
        'patientMiddleName': _patientMiddleName,
        'patientPhoneNumber': _patientPhoneNumber,
        'patientPhotoUrl': _patientPhotoUrl,
        'patientDateOfBirth': _patientDateOfBirth,
        'user_profile_ID': _userProfileID,
        'created_at': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'patientLastName': serializeParam(
          _patientLastName,
          ParamType.String,
        ),
        'patientFirstName': serializeParam(
          _patientFirstName,
          ParamType.String,
        ),
        'patientMiddleName': serializeParam(
          _patientMiddleName,
          ParamType.String,
        ),
        'patientPhoneNumber': serializeParam(
          _patientPhoneNumber,
          ParamType.String,
        ),
        'patientPhotoUrl': serializeParam(
          _patientPhotoUrl,
          ParamType.String,
        ),
        'patientDateOfBirth': serializeParam(
          _patientDateOfBirth,
          ParamType.String,
        ),
        'user_profile_ID': serializeParam(
          _userProfileID,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static PatientSearchDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PatientSearchDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        patientLastName: deserializeParam(
          data['patientLastName'],
          ParamType.String,
          false,
        ),
        patientFirstName: deserializeParam(
          data['patientFirstName'],
          ParamType.String,
          false,
        ),
        patientMiddleName: deserializeParam(
          data['patientMiddleName'],
          ParamType.String,
          false,
        ),
        patientPhoneNumber: deserializeParam(
          data['patientPhoneNumber'],
          ParamType.String,
          false,
        ),
        patientPhotoUrl: deserializeParam(
          data['patientPhotoUrl'],
          ParamType.String,
          false,
        ),
        patientDateOfBirth: deserializeParam(
          data['patientDateOfBirth'],
          ParamType.String,
          false,
        ),
        userProfileID: deserializeParam(
          data['user_profile_ID'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PatientSearchDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PatientSearchDataStruct &&
        id == other.id &&
        patientLastName == other.patientLastName &&
        patientFirstName == other.patientFirstName &&
        patientMiddleName == other.patientMiddleName &&
        patientPhoneNumber == other.patientPhoneNumber &&
        patientPhotoUrl == other.patientPhotoUrl &&
        patientDateOfBirth == other.patientDateOfBirth &&
        userProfileID == other.userProfileID &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        patientLastName,
        patientFirstName,
        patientMiddleName,
        patientPhoneNumber,
        patientPhotoUrl,
        patientDateOfBirth,
        userProfileID,
        createdAt
      ]);
}

PatientSearchDataStruct createPatientSearchDataStruct({
  String? id,
  String? patientLastName,
  String? patientFirstName,
  String? patientMiddleName,
  String? patientPhoneNumber,
  String? patientPhotoUrl,
  String? patientDateOfBirth,
  String? userProfileID,
  String? createdAt,
}) =>
    PatientSearchDataStruct(
      id: id,
      patientLastName: patientLastName,
      patientFirstName: patientFirstName,
      patientMiddleName: patientMiddleName,
      patientPhoneNumber: patientPhoneNumber,
      patientPhotoUrl: patientPhotoUrl,
      patientDateOfBirth: patientDateOfBirth,
      userProfileID: userProfileID,
      createdAt: createdAt,
    );
