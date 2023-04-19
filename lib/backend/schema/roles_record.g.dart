// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RolesRecord> _$rolesRecordSerializer = new _$RolesRecordSerializer();

class _$RolesRecordSerializer implements StructuredSerializer<RolesRecord> {
  @override
  final Iterable<Type> types = const [RolesRecord, _$RolesRecord];
  @override
  final String wireName = 'RolesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RolesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Color)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  RolesRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RolesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(Color)) as Color?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$RolesRecord extends RolesRecord {
  @override
  final String? name;
  @override
  final Color? color;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RolesRecord([void Function(RolesRecordBuilder)? updates]) =>
      (new RolesRecordBuilder()..update(updates))._build();

  _$RolesRecord._({this.name, this.color, this.ffRef}) : super._();

  @override
  RolesRecord rebuild(void Function(RolesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RolesRecordBuilder toBuilder() => new RolesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RolesRecord &&
        name == other.name &&
        color == other.color &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RolesRecord')
          ..add('name', name)
          ..add('color', color)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RolesRecordBuilder implements Builder<RolesRecord, RolesRecordBuilder> {
  _$RolesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  Color? _color;
  Color? get color => _$this._color;
  set color(Color? color) => _$this._color = color;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RolesRecordBuilder() {
    RolesRecord._initializeBuilder(this);
  }

  RolesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _color = $v.color;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RolesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RolesRecord;
  }

  @override
  void update(void Function(RolesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RolesRecord build() => _build();

  _$RolesRecord _build() {
    final _$result =
        _$v ?? new _$RolesRecord._(name: name, color: color, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
