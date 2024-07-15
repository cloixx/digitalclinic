import '../database.dart';

class Set0032857TreatmentResultTable
    extends SupabaseTable<Set0032857TreatmentResultRow> {
  @override
  String get tableName => 'set_003_28_57_treatment_result';

  @override
  Set0032857TreatmentResultRow createRow(Map<String, dynamic> data) =>
      Set0032857TreatmentResultRow(data);
}

class Set0032857TreatmentResultRow extends SupabaseDataRow {
  Set0032857TreatmentResultRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => Set0032857TreatmentResultTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get value => getField<String>('value');
  set value(String? value) => setField<String>('value', value);
}
