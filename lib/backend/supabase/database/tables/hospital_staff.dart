import '../database.dart';

class HospitalStaffTable extends SupabaseTable<HospitalStaffRow> {
  @override
  String get tableName => 'hospital_staff';

  @override
  HospitalStaffRow createRow(Map<String, dynamic> data) =>
      HospitalStaffRow(data);
}

class HospitalStaffRow extends SupabaseDataRow {
  HospitalStaffRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HospitalStaffTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get firstName => getField<String>('firstName');
  set firstName(String? value) => setField<String>('firstName', value);

  String? get secondName => getField<String>('secondName');
  set secondName(String? value) => setField<String>('secondName', value);

  String? get middleName => getField<String>('middleName');
  set middleName(String? value) => setField<String>('middleName', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get position => getField<String>('position');
  set position(String? value) => setField<String>('position', value);

  double? get department => getField<double>('department');
  set department(double? value) => setField<double>('department', value);
}
