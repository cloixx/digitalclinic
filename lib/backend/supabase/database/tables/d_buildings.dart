import '../database.dart';

class DBuildingsTable extends SupabaseTable<DBuildingsRow> {
  @override
  String get tableName => 'd_buildings';

  @override
  DBuildingsRow createRow(Map<String, dynamic> data) => DBuildingsRow(data);
}

class DBuildingsRow extends SupabaseDataRow {
  DBuildingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DBuildingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get flourCount => getField<int>('flourCount');
  set flourCount(int? value) => setField<int>('flourCount', value);

  int? get chamberCount => getField<int>('chamberCount');
  set chamberCount(int? value) => setField<int>('chamberCount', value);

  int? get bedsCount => getField<int>('bedsCount');
  set bedsCount(int? value) => setField<int>('bedsCount', value);
}
