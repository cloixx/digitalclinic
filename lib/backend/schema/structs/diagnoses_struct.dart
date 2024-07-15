// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiagnosesStruct extends BaseStruct {
  DiagnosesStruct({
    String? code,
    String? descriptionUa,
  })  : _code = code,
        _descriptionUa = descriptionUa;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "description_ua" field.
  String? _descriptionUa;
  String get descriptionUa => _descriptionUa ?? '';
  set descriptionUa(String? val) => _descriptionUa = val;

  bool hasDescriptionUa() => _descriptionUa != null;

  static DiagnosesStruct fromMap(Map<String, dynamic> data) => DiagnosesStruct(
        code: data['code'] as String?,
        descriptionUa: data['description_ua'] as String?,
      );

  static DiagnosesStruct? maybeFromMap(dynamic data) => data is Map
      ? DiagnosesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'description_ua': _descriptionUa,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'description_ua': serializeParam(
          _descriptionUa,
          ParamType.String,
        ),
      }.withoutNulls;

  static DiagnosesStruct fromSerializableMap(Map<String, dynamic> data) =>
      DiagnosesStruct(
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        descriptionUa: deserializeParam(
          data['description_ua'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DiagnosesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DiagnosesStruct &&
        code == other.code &&
        descriptionUa == other.descriptionUa;
  }

  @override
  int get hashCode => const ListEquality().hash([code, descriptionUa]);
}

DiagnosesStruct createDiagnosesStruct({
  String? code,
  String? descriptionUa,
}) =>
    DiagnosesStruct(
      code: code,
      descriptionUa: descriptionUa,
    );
