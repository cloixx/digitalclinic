import '../database.dart';

class DChambersTable extends SupabaseTable<DChambersRow> {
  @override
  String get tableName => 'd_chambers';

  @override
  DChambersRow createRow(Map<String, dynamic> data) => DChambersRow(data);
}

class DChambersRow extends SupabaseDataRow {
  DChambersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DChambersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int? get chamberNumber => getField<int>('chamberNumber');
  set chamberNumber(int? value) => setField<int>('chamberNumber', value);

  int? get bedsCount => getField<int>('bedsCount');
  set bedsCount(int? value) => setField<int>('bedsCount', value);

  bool? get isFemale => getField<bool>('isFemale');
  set isFemale(bool? value) => setField<bool>('isFemale', value);

  int? get ocupation => getField<int>('ocupation');
  set ocupation(int? value) => setField<int>('ocupation', value);

  int? get flour => getField<int>('flour');
  set flour(int? value) => setField<int>('flour', value);

  bool? get isRefrigerator => getField<bool>('isRefrigerator');
  set isRefrigerator(bool? value) => setField<bool>('isRefrigerator', value);

  bool? get isAirConditioning => getField<bool>('isAirConditioning');
  set isAirConditioning(bool? value) =>
      setField<bool>('isAirConditioning', value);

  bool? get isTv => getField<bool>('isTv');
  set isTv(bool? value) => setField<bool>('isTv', value);

  bool? get isWifi => getField<bool>('isWifi');
  set isWifi(bool? value) => setField<bool>('isWifi', value);

  int? get buildingID => getField<int>('buildingID');
  set buildingID(int? value) => setField<int>('buildingID', value);

  int? get departmentID => getField<int>('departmentID');
  set departmentID(int? value) => setField<int>('departmentID', value);
}
