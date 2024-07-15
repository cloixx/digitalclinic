// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeigthStruct extends BaseStruct {
  WeigthStruct({
    DateTime? date,
    String? value,
  })  : _date = date,
        _value = value;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  static WeigthStruct fromMap(Map<String, dynamic> data) => WeigthStruct(
        date: data['date'] as DateTime?,
        value: data['value'] as String?,
      );

  static WeigthStruct? maybeFromMap(dynamic data) =>
      data is Map ? WeigthStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static WeigthStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeigthStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WeigthStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeigthStruct && date == other.date && value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([date, value]);
}

WeigthStruct createWeigthStruct({
  DateTime? date,
  String? value,
}) =>
    WeigthStruct(
      date: date,
      value: value,
    );
