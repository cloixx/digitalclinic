import '../database.dart';

class DepartmentsTable extends SupabaseTable<DepartmentsRow> {
  @override
  String get tableName => 'departments';

  @override
  DepartmentsRow createRow(Map<String, dynamic> data) => DepartmentsRow(data);
}

class DepartmentsRow extends SupabaseDataRow {
  DepartmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DepartmentsTable();

  double get id => getField<double>('id')!;
  set id(double value) => setField<double>('id', value);

  double? get buildingID => getField<double>('buildingID');
  set buildingID(double? value) => setField<double>('buildingID', value);

  double? get flour => getField<double>('flour');
  set flour(double? value) => setField<double>('flour', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  List<double> get anatomicLocalizationAxis =>
      getListField<double>('anatomicLocalizationAxis');
  set anatomicLocalizationAxis(List<double>? value) =>
      setListField<double>('anatomicLocalizationAxis', value);

  int? get chamberCount => getField<int>('chamberCount');
  set chamberCount(int? value) => setField<int>('chamberCount', value);

  int? get bedsCount => getField<int>('bedsCount');
  set bedsCount(int? value) => setField<int>('bedsCount', value);
}
