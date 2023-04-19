import '../database.dart';

class ChambersTable extends SupabaseTable<ChambersRow> {
  @override
  String get tableName => 'chambers';

  @override
  ChambersRow createRow(Map<String, dynamic> data) => ChambersRow(data);
}

class ChambersRow extends SupabaseDataRow {
  ChambersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChambersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int? get chamberNumber => getField<int>('chamberNumber');
  set chamberNumber(int? value) => setField<int>('chamberNumber', value);

  int? get chamberCount => getField<int>('chamberCount');
  set chamberCount(int? value) => setField<int>('chamberCount', value);

  bool? get sexStatus => getField<bool>('sexStatus');
  set sexStatus(bool? value) => setField<bool>('sexStatus', value);

  double? get ocupation => getField<double>('ocupation');
  set ocupation(double? value) => setField<double>('ocupation', value);

  int? get buildingID => getField<int>('buildingID');
  set buildingID(int? value) => setField<int>('buildingID', value);

  int? get flour => getField<int>('flour');
  set flour(int? value) => setField<int>('flour', value);

  double? get departmentID => getField<double>('departmentID');
  set departmentID(double? value) => setField<double>('departmentID', value);

  bool? get isRefrigerator => getField<bool>('isRefrigerator');
  set isRefrigerator(bool? value) => setField<bool>('isRefrigerator', value);

  bool? get isAirConditioning => getField<bool>('isAirConditioning');
  set isAirConditioning(bool? value) =>
      setField<bool>('isAirConditioning', value);

  bool? get isTv => getField<bool>('isTv');
  set isTv(bool? value) => setField<bool>('isTv', value);

  bool? get isWifi => getField<bool>('isWifi');
  set isWifi(bool? value) => setField<bool>('isWifi', value);
}
