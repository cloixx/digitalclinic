// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatContentStruct extends BaseStruct {
  ChatContentStruct({
    String? type,
    String? text,
  })  : _type = type,
        _text = text;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  static ChatContentStruct fromMap(Map<String, dynamic> data) =>
      ChatContentStruct(
        type: data['type'] as String?,
        text: data['text'] as String?,
      );

  static ChatContentStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatContentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatContentStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatContentStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatContentStruct &&
        type == other.type &&
        text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([type, text]);
}

ChatContentStruct createChatContentStruct({
  String? type,
  String? text,
}) =>
    ChatContentStruct(
      type: type,
      text: text,
    );
