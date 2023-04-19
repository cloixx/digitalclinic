import '../database.dart';

class AppointedResearchesTable extends SupabaseTable<AppointedResearchesRow> {
  @override
  String get tableName => 'appointed_researches';

  @override
  AppointedResearchesRow createRow(Map<String, dynamic> data) =>
      AppointedResearchesRow(data);
}

class AppointedResearchesRow extends SupabaseDataRow {
  AppointedResearchesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppointedResearchesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get appointmentDate => getField<DateTime>('appointment_date');
  set appointmentDate(DateTime? value) =>
      setField<DateTime>('appointment_date', value);

  PostgresTime? get appointmentTime =>
      getField<PostgresTime>('appointment_time');
  set appointmentTime(PostgresTime? value) =>
      setField<PostgresTime>('appointment_time', value);

  String? get researchID => getField<String>('researchID');
  set researchID(String? value) => setField<String>('researchID', value);

  String? get subjectID => getField<String>('subjectID');
  set subjectID(String? value) => setField<String>('subjectID', value);

  DateTime? get executionDate => getField<DateTime>('execution_date');
  set executionDate(DateTime? value) =>
      setField<DateTime>('execution_date', value);

  PostgresTime? get executionTime => getField<PostgresTime>('execution_time');
  set executionTime(PostgresTime? value) =>
      setField<PostgresTime>('execution_time', value);

  String? get executionDoctorID => getField<String>('execution_doctorID');
  set executionDoctorID(String? value) =>
      setField<String>('execution_doctorID', value);
}
