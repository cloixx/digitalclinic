import '../database.dart';

class SetOverallStatesTable extends SupabaseTable<SetOverallStatesRow> {
  @override
  String get tableName => 'set_overall_states';

  @override
  SetOverallStatesRow createRow(Map<String, dynamic> data) =>
      SetOverallStatesRow(data);
}

class SetOverallStatesRow extends SupabaseDataRow {
  SetOverallStatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SetOverallStatesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get value => getField<String>('value');
  set value(String? value) => setField<String>('value', value);
}
