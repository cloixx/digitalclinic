import '../database.dart';

class UsersStatesTable extends SupabaseTable<UsersStatesRow> {
  @override
  String get tableName => 'users_states';

  @override
  UsersStatesRow createRow(Map<String, dynamic> data) => UsersStatesRow(data);
}

class UsersStatesRow extends SupabaseDataRow {
  UsersStatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersStatesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get roleState => getField<String>('role_state');
  set roleState(String? value) => setField<String>('role_state', value);

  String? get theme => getField<String>('theme');
  set theme(String? value) => setField<String>('theme', value);
}
