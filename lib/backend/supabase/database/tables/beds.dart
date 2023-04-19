import '../database.dart';

class BedsTable extends SupabaseTable<BedsRow> {
  @override
  String get tableName => 'beds';

  @override
  BedsRow createRow(Map<String, dynamic> data) => BedsRow(data);
}

class BedsRow extends SupabaseDataRow {
  BedsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BedsTable();

  double get id => getField<double>('id')!;
  set id(double value) => setField<double>('id', value);

  double? get chamberID => getField<double>('chamberID');
  set chamberID(double? value) => setField<double>('chamberID', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  bool? get ocupied => getField<bool>('ocupied');
  set ocupied(bool? value) => setField<bool>('ocupied', value);

  bool? get isWall => getField<bool>('isWall');
  set isWall(bool? value) => setField<bool>('isWall', value);

  bool? get isWindow => getField<bool>('isWindow');
  set isWindow(bool? value) => setField<bool>('isWindow', value);
}
