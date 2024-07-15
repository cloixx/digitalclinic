import '../database.dart';

class DBedsTable extends SupabaseTable<DBedsRow> {
  @override
  String get tableName => 'd_beds';

  @override
  DBedsRow createRow(Map<String, dynamic> data) => DBedsRow(data);
}

class DBedsRow extends SupabaseDataRow {
  DBedsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DBedsTable();

  bool? get isFemale => getField<bool>('isFemale');
  set isFemale(bool? value) => setField<bool>('isFemale', value);

  bool? get ocupied => getField<bool>('ocupied');
  set ocupied(bool? value) => setField<bool>('ocupied', value);

  bool? get isWall => getField<bool>('isWall');
  set isWall(bool? value) => setField<bool>('isWall', value);

  bool? get isWindow => getField<bool>('isWindow');
  set isWindow(bool? value) => setField<bool>('isWindow', value);

  bool? get isVIP => getField<bool>('isVIP');
  set isVIP(bool? value) => setField<bool>('isVIP', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get chamberID => getField<String>('chamberID');
  set chamberID(String? value) => setField<String>('chamberID', value);
}
