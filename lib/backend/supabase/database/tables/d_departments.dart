import '../database.dart';

class DDepartmentsTable extends SupabaseTable<DDepartmentsRow> {
  @override
  String get tableName => 'd_departments';

  @override
  DDepartmentsRow createRow(Map<String, dynamic> data) => DDepartmentsRow(data);
}

class DDepartmentsRow extends SupabaseDataRow {
  DDepartmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DDepartmentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get chambersCount => getField<int>('chambers_count');
  set chambersCount(int? value) => setField<int>('chambers_count', value);

  int? get bedsCount => getField<int>('beds_count');
  set bedsCount(int? value) => setField<int>('beds_count', value);

  int? get buildingId => getField<int>('building_id');
  set buildingId(int? value) => setField<int>('building_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
