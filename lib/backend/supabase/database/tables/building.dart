import '../database.dart';

class BuildingTable extends SupabaseTable<BuildingRow> {
  @override
  String get tableName => 'building';

  @override
  BuildingRow createRow(Map<String, dynamic> data) => BuildingRow(data);
}

class BuildingRow extends SupabaseDataRow {
  BuildingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BuildingTable();

  double get id => getField<double>('id')!;
  set id(double value) => setField<double>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get flourCount => getField<int>('flourCount');
  set flourCount(int? value) => setField<int>('flourCount', value);

  int? get chamberCount => getField<int>('chamberCount');
  set chamberCount(int? value) => setField<int>('chamberCount', value);

  int? get bedsCount => getField<int>('bedsCount');
  set bedsCount(int? value) => setField<int>('bedsCount', value);
}
