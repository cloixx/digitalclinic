// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PatientInDepartmentViewStruct extends BaseStruct {
  PatientInDepartmentViewStruct({
    String? hadmID,
    String? admitDate,
    String? patientID,
    int? departmentCurrent,
    String? patientFirstName,
    String? patientLastName,
    String? patientMiddleName,
    String? patientPhotoUrl,
    String? patientDateOfBirth,
    int? bedNumber,
    String? patientPhoneNumber,
    int? chamberNumber,
  })  : _hadmID = hadmID,
        _admitDate = admitDate,
        _patientID = patientID,
        _departmentCurrent = departmentCurrent,
        _patientFirstName = patientFirstName,
        _patientLastName = patientLastName,
        _patientMiddleName = patientMiddleName,
        _patientPhotoUrl = patientPhotoUrl,
        _patientDateOfBirth = patientDateOfBirth,
        _bedNumber = bedNumber,
        _patientPhoneNumber = patientPhoneNumber,
        _chamberNumber = chamberNumber;

  // "hadmID" field.
  String? _hadmID;
  String get hadmID => _hadmID ?? '';
  set hadmID(String? val) => _hadmID = val;

  bool hasHadmID() => _hadmID != null;

  // "admitDate" field.
  String? _admitDate;
  String get admitDate => _admitDate ?? '';
  set admitDate(String? val) => _admitDate = val;

  bool hasAdmitDate() => _admitDate != null;

  // "patientID" field.
  String? _patientID;
  String get patientID => _patientID ?? '';
  set patientID(String? val) => _patientID = val;

  bool hasPatientID() => _patientID != null;

  // "department_current" field.
  int? _departmentCurrent;
  int get departmentCurrent => _departmentCurrent ?? 0;
  set departmentCurrent(int? val) => _departmentCurrent = val;

  void incrementDepartmentCurrent(int amount) =>
      departmentCurrent = departmentCurrent + amount;

  bool hasDepartmentCurrent() => _departmentCurrent != null;

  // "patientFirstName" field.
  String? _patientFirstName;
  String get patientFirstName => _patientFirstName ?? '';
  set patientFirstName(String? val) => _patientFirstName = val;

  bool hasPatientFirstName() => _patientFirstName != null;

  // "patientLastName" field.
  String? _patientLastName;
  String get patientLastName => _patientLastName ?? '';
  set patientLastName(String? val) => _patientLastName = val;

  bool hasPatientLastName() => _patientLastName != null;

  // "patientMiddleName" field.
  String? _patientMiddleName;
  String get patientMiddleName => _patientMiddleName ?? '';
  set patientMiddleName(String? val) => _patientMiddleName = val;

  bool hasPatientMiddleName() => _patientMiddleName != null;

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

  // "bedNumber" field.
  int? _bedNumber;
  int get bedNumber => _bedNumber ?? 0;
  set bedNumber(int? val) => _bedNumber = val;

  void incrementBedNumber(int amount) => bedNumber = bedNumber + amount;

  bool hasBedNumber() => _bedNumber != null;

  // "patientPhoneNumber" field.
  String? _patientPhoneNumber;
  String get patientPhoneNumber => _patientPhoneNumber ?? '';
  set patientPhoneNumber(String? val) => _patientPhoneNumber = val;

  bool hasPatientPhoneNumber() => _patientPhoneNumber != null;

  // "chamberNumber" field.
  int? _chamberNumber;
  int get chamberNumber => _chamberNumber ?? 0;
  set chamberNumber(int? val) => _chamberNumber = val;

  void incrementChamberNumber(int amount) =>
      chamberNumber = chamberNumber + amount;

  bool hasChamberNumber() => _chamberNumber != null;

  static PatientInDepartmentViewStruct fromMap(Map<String, dynamic> data) =>
      PatientInDepartmentViewStruct(
        hadmID: data['hadmID'] as String?,
        admitDate: data['admitDate'] as String?,
        patientID: data['patientID'] as String?,
        departmentCurrent: castToType<int>(data['department_current']),
        patientFirstName: data['patientFirstName'] as String?,
        patientLastName: data['patientLastName'] as String?,
        patientMiddleName: data['patientMiddleName'] as String?,
        patientPhotoUrl: data['patientPhotoUrl'] as String?,
        patientDateOfBirth: data['patientDateOfBirth'] as String?,
        bedNumber: castToType<int>(data['bedNumber']),
        patientPhoneNumber: data['patientPhoneNumber'] as String?,
        chamberNumber: castToType<int>(data['chamberNumber']),
      );

  static PatientInDepartmentViewStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? PatientInDepartmentViewStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'hadmID': _hadmID,
        'admitDate': _admitDate,
        'patientID': _patientID,
        'department_current': _departmentCurrent,
        'patientFirstName': _patientFirstName,
        'patientLastName': _patientLastName,
        'patientMiddleName': _patientMiddleName,
        'patientPhotoUrl': _patientPhotoUrl,
        'patientDateOfBirth': _patientDateOfBirth,
        'bedNumber': _bedNumber,
        'patientPhoneNumber': _patientPhoneNumber,
        'chamberNumber': _chamberNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'hadmID': serializeParam(
          _hadmID,
          ParamType.String,
        ),
        'admitDate': serializeParam(
          _admitDate,
          ParamType.String,
        ),
        'patientID': serializeParam(
          _patientID,
          ParamType.String,
        ),
        'department_current': serializeParam(
          _departmentCurrent,
          ParamType.int,
        ),
        'patientFirstName': serializeParam(
          _patientFirstName,
          ParamType.String,
        ),
        'patientLastName': serializeParam(
          _patientLastName,
          ParamType.String,
        ),
        'patientMiddleName': serializeParam(
          _patientMiddleName,
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
        'bedNumber': serializeParam(
          _bedNumber,
          ParamType.int,
        ),
        'patientPhoneNumber': serializeParam(
          _patientPhoneNumber,
          ParamType.String,
        ),
        'chamberNumber': serializeParam(
          _chamberNumber,
          ParamType.int,
        ),
      }.withoutNulls;

  static PatientInDepartmentViewStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PatientInDepartmentViewStruct(
        hadmID: deserializeParam(
          data['hadmID'],
          ParamType.String,
          false,
        ),
        admitDate: deserializeParam(
          data['admitDate'],
          ParamType.String,
          false,
        ),
        patientID: deserializeParam(
          data['patientID'],
          ParamType.String,
          false,
        ),
        departmentCurrent: deserializeParam(
          data['department_current'],
          ParamType.int,
          false,
        ),
        patientFirstName: deserializeParam(
          data['patientFirstName'],
          ParamType.String,
          false,
        ),
        patientLastName: deserializeParam(
          data['patientLastName'],
          ParamType.String,
          false,
        ),
        patientMiddleName: deserializeParam(
          data['patientMiddleName'],
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
        bedNumber: deserializeParam(
          data['bedNumber'],
          ParamType.int,
          false,
        ),
        patientPhoneNumber: deserializeParam(
          data['patientPhoneNumber'],
          ParamType.String,
          false,
        ),
        chamberNumber: deserializeParam(
          data['chamberNumber'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PatientInDepartmentViewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PatientInDepartmentViewStruct &&
        hadmID == other.hadmID &&
        admitDate == other.admitDate &&
        patientID == other.patientID &&
        departmentCurrent == other.departmentCurrent &&
        patientFirstName == other.patientFirstName &&
        patientLastName == other.patientLastName &&
        patientMiddleName == other.patientMiddleName &&
        patientPhotoUrl == other.patientPhotoUrl &&
        patientDateOfBirth == other.patientDateOfBirth &&
        bedNumber == other.bedNumber &&
        patientPhoneNumber == other.patientPhoneNumber &&
        chamberNumber == other.chamberNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([
        hadmID,
        admitDate,
        patientID,
        departmentCurrent,
        patientFirstName,
        patientLastName,
        patientMiddleName,
        patientPhotoUrl,
        patientDateOfBirth,
        bedNumber,
        patientPhoneNumber,
        chamberNumber
      ]);
}

PatientInDepartmentViewStruct createPatientInDepartmentViewStruct({
  String? hadmID,
  String? admitDate,
  String? patientID,
  int? departmentCurrent,
  String? patientFirstName,
  String? patientLastName,
  String? patientMiddleName,
  String? patientPhotoUrl,
  String? patientDateOfBirth,
  int? bedNumber,
  String? patientPhoneNumber,
  int? chamberNumber,
}) =>
    PatientInDepartmentViewStruct(
      hadmID: hadmID,
      admitDate: admitDate,
      patientID: patientID,
      departmentCurrent: departmentCurrent,
      patientFirstName: patientFirstName,
      patientLastName: patientLastName,
      patientMiddleName: patientMiddleName,
      patientPhotoUrl: patientPhotoUrl,
      patientDateOfBirth: patientDateOfBirth,
      bedNumber: bedNumber,
      patientPhoneNumber: patientPhoneNumber,
      chamberNumber: chamberNumber,
    );
