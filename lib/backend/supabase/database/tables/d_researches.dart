import '../database.dart';

class DResearchesTable extends SupabaseTable<DResearchesRow> {
  @override
  String get tableName => 'D_researches';

  @override
  DResearchesRow createRow(Map<String, dynamic> data) => DResearchesRow(data);
}

class DResearchesRow extends SupabaseDataRow {
  DResearchesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DResearchesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
