import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'roles_record.g.dart';

abstract class RolesRecord implements Built<RolesRecord, RolesRecordBuilder> {
  static Serializer<RolesRecord> get serializer => _$rolesRecordSerializer;

  String? get name;

  Color? get color;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RolesRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('roles');

  static Stream<RolesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RolesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RolesRecord._();
  factory RolesRecord([void Function(RolesRecordBuilder) updates]) =
      _$RolesRecord;

  static RolesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRolesRecordData({
  String? name,
  Color? color,
}) {
  final firestoreData = serializers.toFirestore(
    RolesRecord.serializer,
    RolesRecord(
      (r) => r
        ..name = name
        ..color = color,
    ),
  );

  return firestoreData;
}
