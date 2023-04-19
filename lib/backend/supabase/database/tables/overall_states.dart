import '../database.dart';

class OverallStatesTable extends SupabaseTable<OverallStatesRow> {
  @override
  String get tableName => 'overall_states';

  @override
  OverallStatesRow createRow(Map<String, dynamic> data) =>
      OverallStatesRow(data);
}

class OverallStatesRow extends SupabaseDataRow {
  OverallStatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OverallStatesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
