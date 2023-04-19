import '../database.dart';

class CovidTestsTable extends SupabaseTable<CovidTestsRow> {
  @override
  String get tableName => 'covid_tests';

  @override
  CovidTestsRow createRow(Map<String, dynamic> data) => CovidTestsRow(data);
}

class CovidTestsRow extends SupabaseDataRow {
  CovidTestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CovidTestsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get subjectID => getField<String>('subjectID');
  set subjectID(String? value) => setField<String>('subjectID', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  PostgresTime? get time => getField<PostgresTime>('time');
  set time(PostgresTime? value) => setField<PostgresTime>('time', value);

  bool? get result => getField<bool>('result');
  set result(bool? value) => setField<bool>('result', value);

  String? get doctor => getField<String>('doctor');
  set doctor(String? value) => setField<String>('doctor', value);

  String? get nurse => getField<String>('nurse');
  set nurse(String? value) => setField<String>('nurse', value);

  double? get lot => getField<double>('lot');
  set lot(double? value) => setField<double>('lot', value);
}
