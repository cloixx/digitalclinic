import '../database.dart';

class DDepartmentsCodesTable extends SupabaseTable<DDepartmentsCodesRow> {
  @override
  String get tableName => 'D_departments_codes';

  @override
  DDepartmentsCodesRow createRow(Map<String, dynamic> data) =>
      DDepartmentsCodesRow(data);
}

class DDepartmentsCodesRow extends SupabaseDataRow {
  DDepartmentsCodesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DDepartmentsCodesTable();

  int get code => getField<int>('code')!;
  set code(int value) => setField<int>('code', value);

  String? get departmentName => getField<String>('department_name');
  set departmentName(String? value) =>
      setField<String>('department_name', value);
}
