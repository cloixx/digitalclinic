// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProfilesDataStruct extends BaseStruct {
  UserProfilesDataStruct({
    String? id,
    String? createdAt,
    String? email,
    String? googleName,
    String? photoUrl,
    List<String>? roles,
    String? checkNumber,
  })  : _id = id,
        _createdAt = createdAt,
        _email = email,
        _googleName = googleName,
        _photoUrl = photoUrl,
        _roles = roles,
        _checkNumber = checkNumber;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "google_name" field.
  String? _googleName;
  String get googleName => _googleName ?? '';
  set googleName(String? val) => _googleName = val;

  bool hasGoogleName() => _googleName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "roles" field.
  List<String>? _roles;
  List<String> get roles => _roles ?? const [];
  set roles(List<String>? val) => _roles = val;

  void updateRoles(Function(List<String>) updateFn) {
    updateFn(_roles ??= []);
  }

  bool hasRoles() => _roles != null;

  // "check_number" field.
  String? _checkNumber;
  String get checkNumber => _checkNumber ?? '';
  set checkNumber(String? val) => _checkNumber = val;

  bool hasCheckNumber() => _checkNumber != null;

  static UserProfilesDataStruct fromMap(Map<String, dynamic> data) =>
      UserProfilesDataStruct(
        id: data['id'] as String?,
        createdAt: data['created_at'] as String?,
        email: data['email'] as String?,
        googleName: data['google_name'] as String?,
        photoUrl: data['photo_url'] as String?,
        roles: getDataList(data['roles']),
        checkNumber: data['check_number'] as String?,
      );

  static UserProfilesDataStruct? maybeFromMap(dynamic data) => data is Map
      ? UserProfilesDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'email': _email,
        'google_name': _googleName,
        'photo_url': _photoUrl,
        'roles': _roles,
        'check_number': _checkNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'google_name': serializeParam(
          _googleName,
          ParamType.String,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'roles': serializeParam(
          _roles,
          ParamType.String,
          isList: true,
        ),
        'check_number': serializeParam(
          _checkNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserProfilesDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserProfilesDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        googleName: deserializeParam(
          data['google_name'],
          ParamType.String,
          false,
        ),
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        roles: deserializeParam<String>(
          data['roles'],
          ParamType.String,
          true,
        ),
        checkNumber: deserializeParam(
          data['check_number'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserProfilesDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserProfilesDataStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        email == other.email &&
        googleName == other.googleName &&
        photoUrl == other.photoUrl &&
        listEquality.equals(roles, other.roles) &&
        checkNumber == other.checkNumber;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, createdAt, email, googleName, photoUrl, roles, checkNumber]);
}

UserProfilesDataStruct createUserProfilesDataStruct({
  String? id,
  String? createdAt,
  String? email,
  String? googleName,
  String? photoUrl,
  String? checkNumber,
}) =>
    UserProfilesDataStruct(
      id: id,
      createdAt: createdAt,
      email: email,
      googleName: googleName,
      photoUrl: photoUrl,
      checkNumber: checkNumber,
    );
