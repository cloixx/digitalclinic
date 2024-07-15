// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoleStruct extends BaseStruct {
  RoleStruct({
    String? id,
    String? name,
    Color? color,
  })  : _id = id,
        _name = name,
        _color = color;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static RoleStruct fromMap(Map<String, dynamic> data) => RoleStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        color: getSchemaColor(data['color']),
      );

  static RoleStruct? maybeFromMap(dynamic data) =>
      data is Map ? RoleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static RoleStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoleStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'RoleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoleStruct &&
        id == other.id &&
        name == other.name &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, color]);
}

RoleStruct createRoleStruct({
  String? id,
  String? name,
  Color? color,
}) =>
    RoleStruct(
      id: id,
      name: name,
      color: color,
    );
