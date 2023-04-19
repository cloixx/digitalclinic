import '../database.dart';

class InterventionCaseTable extends SupabaseTable<InterventionCaseRow> {
  @override
  String get tableName => 'intervention_case';

  @override
  InterventionCaseRow createRow(Map<String, dynamic> data) =>
      InterventionCaseRow(data);
}

class InterventionCaseRow extends SupabaseDataRow {
  InterventionCaseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InterventionCaseTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get postoperativeAppointment =>
      getField<String>('postoperativeAppointment');
  set postoperativeAppointment(String? value) =>
      setField<String>('postoperativeAppointment', value);

  String? get anesthetist => getField<String>('anesthetist');
  set anesthetist(String? value) => setField<String>('anesthetist', value);

  int? get anesthesiaType => getField<int>('anesthesiaType');
  set anesthesiaType(int? value) => setField<int>('anesthesiaType', value);
}
