import '../database.dart';

class RolesTable extends SupabaseTable<RolesRow> {
  @override
  String get tableName => 'roles';

  @override
  RolesRow createRow(Map<String, dynamic> data) => RolesRow(data);
}

class RolesRow extends SupabaseDataRow {
  RolesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RolesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  bool get isInternal => getField<bool>('is_internal')!;
  set isInternal(bool value) => setField<bool>('is_internal', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
