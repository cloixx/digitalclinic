import '../database.dart';

class InterventionsTable extends SupabaseTable<InterventionsRow> {
  @override
  String get tableName => 'interventions';

  @override
  InterventionsRow createRow(Map<String, dynamic> data) =>
      InterventionsRow(data);
}

class InterventionsRow extends SupabaseDataRow {
  InterventionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InterventionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get admissionID => getField<String>('admissionID');
  set admissionID(String? value) => setField<String>('admissionID', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  PostgresTime? get timeStart => getField<PostgresTime>('timeStart');
  set timeStart(PostgresTime? value) =>
      setField<PostgresTime>('timeStart', value);

  PostgresTime? get timeEnd => getField<PostgresTime>('timeEnd');
  set timeEnd(PostgresTime? value) => setField<PostgresTime>('timeEnd', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  String? get doctor => getField<String>('doctor');
  set doctor(String? value) => setField<String>('doctor', value);

  String? get complication => getField<String>('complication');
  set complication(String? value) => setField<String>('complication', value);

  String? get protocol => getField<String>('protocol');
  set protocol(String? value) => setField<String>('protocol', value);

  String? get assistant => getField<String>('assistant');
  set assistant(String? value) => setField<String>('assistant', value);

  String? get assistantNurse => getField<String>('assistantNurse');
  set assistantNurse(String? value) =>
      setField<String>('assistantNurse', value);

  String? get interventionCaseID => getField<String>('interventionCaseID');
  set interventionCaseID(String? value) =>
      setField<String>('interventionCaseID', value);
}
