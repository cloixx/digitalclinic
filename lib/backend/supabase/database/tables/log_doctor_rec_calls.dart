import '../database.dart';

class LogDoctorRecCallsTable extends SupabaseTable<LogDoctorRecCallsRow> {
  @override
  String get tableName => 'log_doctor_rec_calls';

  @override
  LogDoctorRecCallsRow createRow(Map<String, dynamic> data) =>
      LogDoctorRecCallsRow(data);
}

class LogDoctorRecCallsRow extends SupabaseDataRow {
  LogDoctorRecCallsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LogDoctorRecCallsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get department => getField<int>('department');
  set department(int? value) => setField<int>('department', value);

  bool? get isCompleted => getField<bool>('is_completed');
  set isCompleted(bool? value) => setField<bool>('is_completed', value);

  DateTime? get completedAt => getField<DateTime>('completed_at');
  set completedAt(DateTime? value) => setField<DateTime>('completed_at', value);
}
