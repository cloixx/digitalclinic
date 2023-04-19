import '../database.dart';

class RelatedPersonsTable extends SupabaseTable<RelatedPersonsRow> {
  @override
  String get tableName => 'related_persons';

  @override
  RelatedPersonsRow createRow(Map<String, dynamic> data) =>
      RelatedPersonsRow(data);
}

class RelatedPersonsRow extends SupabaseDataRow {
  RelatedPersonsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RelatedPersonsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get subjectID => getField<String>('subjectID');
  set subjectID(String? value) => setField<String>('subjectID', value);
}
