import '../database.dart';

class DoctorsDiariesTable extends SupabaseTable<DoctorsDiariesRow> {
  @override
  String get tableName => 'doctors_diaries';

  @override
  DoctorsDiariesRow createRow(Map<String, dynamic> data) =>
      DoctorsDiariesRow(data);
}

class DoctorsDiariesRow extends SupabaseDataRow {
  DoctorsDiariesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DoctorsDiariesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  PostgresTime? get time => getField<PostgresTime>('time');
  set time(PostgresTime? value) => setField<PostgresTime>('time', value);

  int? get overallStateID => getField<int>('overallStateID');
  set overallStateID(int? value) => setField<int>('overallStateID', value);

  String? get admissionID => getField<String>('admissionID');
  set admissionID(String? value) => setField<String>('admissionID', value);

  String? get complaints => getField<String>('complaints');
  set complaints(String? value) => setField<String>('complaints', value);

  String? get objectiveState => getField<String>('objectiveState');
  set objectiveState(String? value) =>
      setField<String>('objectiveState', value);

  String? get localState => getField<String>('localState');
  set localState(String? value) => setField<String>('localState', value);

  String? get treatment => getField<String>('treatment');
  set treatment(String? value) => setField<String>('treatment', value);
}
