import '../database.dart';

class PatientsInDepartmentsViewTable
    extends SupabaseTable<PatientsInDepartmentsViewRow> {
  @override
  String get tableName => 'patients_in_departments_view';

  @override
  PatientsInDepartmentsViewRow createRow(Map<String, dynamic> data) =>
      PatientsInDepartmentsViewRow(data);
}

class PatientsInDepartmentsViewRow extends SupabaseDataRow {
  PatientsInDepartmentsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PatientsInDepartmentsViewTable();

  String? get hadmID => getField<String>('hadmID');
  set hadmID(String? value) => setField<String>('hadmID', value);

  DateTime? get admitDate => getField<DateTime>('admitDate');
  set admitDate(DateTime? value) => setField<DateTime>('admitDate', value);

  String? get patientID => getField<String>('patientID');
  set patientID(String? value) => setField<String>('patientID', value);

  int? get departmentCurrent => getField<int>('department_current');
  set departmentCurrent(int? value) =>
      setField<int>('department_current', value);

  int? get chamberNumber => getField<int>('chamberNumber');
  set chamberNumber(int? value) => setField<int>('chamberNumber', value);

  int? get bedNumber => getField<int>('bedNumber');
  set bedNumber(int? value) => setField<int>('bedNumber', value);

  String? get patientFirstName => getField<String>('patientFirstName');
  set patientFirstName(String? value) =>
      setField<String>('patientFirstName', value);

  String? get patientLastName => getField<String>('patientLastName');
  set patientLastName(String? value) =>
      setField<String>('patientLastName', value);

  String? get patientMiddleName => getField<String>('patientMiddleName');
  set patientMiddleName(String? value) =>
      setField<String>('patientMiddleName', value);

  String? get patientPhotoUrl => getField<String>('patientPhotoUrl');
  set patientPhotoUrl(String? value) =>
      setField<String>('patientPhotoUrl', value);

  String? get patientPhoneNumber => getField<String>('patientPhoneNumber');
  set patientPhoneNumber(String? value) =>
      setField<String>('patientPhoneNumber', value);

  DateTime? get patientDateOfBirth => getField<DateTime>('patientDateOfBirth');
  set patientDateOfBirth(DateTime? value) =>
      setField<DateTime>('patientDateOfBirth', value);
}
