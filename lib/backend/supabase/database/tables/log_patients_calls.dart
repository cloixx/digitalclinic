import '../database.dart';

class LogPatientsCallsTable extends SupabaseTable<LogPatientsCallsRow> {
  @override
  String get tableName => 'log_patients_calls';

  @override
  LogPatientsCallsRow createRow(Map<String, dynamic> data) =>
      LogPatientsCallsRow(data);
}

class LogPatientsCallsRow extends SupabaseDataRow {
  LogPatientsCallsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LogPatientsCallsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get patientId => getField<String>('patient_id');
  set patientId(String? value) => setField<String>('patient_id', value);

  bool? get isCompleted => getField<bool>('is_completed');
  set isCompleted(bool? value) => setField<bool>('is_completed', value);

  DateTime? get completedAt => getField<DateTime>('completed_at');
  set completedAt(DateTime? value) => setField<DateTime>('completed_at', value);

  int? get department => getField<int>('department');
  set department(int? value) => setField<int>('department', value);

  int? get hamberNumber => getField<int>('сhamberNumber');
  set hamberNumber(int? value) => setField<int>('сhamberNumber', value);
}
