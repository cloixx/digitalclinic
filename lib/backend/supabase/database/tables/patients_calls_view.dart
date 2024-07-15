import '../database.dart';

class PatientsCallsViewTable extends SupabaseTable<PatientsCallsViewRow> {
  @override
  String get tableName => 'patients_calls_view';

  @override
  PatientsCallsViewRow createRow(Map<String, dynamic> data) =>
      PatientsCallsViewRow(data);
}

class PatientsCallsViewRow extends SupabaseDataRow {
  PatientsCallsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PatientsCallsViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get patientId => getField<String>('patient_id');
  set patientId(String? value) => setField<String>('patient_id', value);

  bool? get isCompleted => getField<bool>('is_completed');
  set isCompleted(bool? value) => setField<bool>('is_completed', value);

  int? get department => getField<int>('department');
  set department(int? value) => setField<int>('department', value);

  int? get hamberNumber => getField<int>('сhamberNumber');
  set hamberNumber(int? value) => setField<int>('сhamberNumber', value);

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
}
