import '../database.dart';

class UsersIDsRolesTable extends SupabaseTable<UsersIDsRolesRow> {
  @override
  String get tableName => 'users_IDs_roles';

  @override
  UsersIDsRolesRow createRow(Map<String, dynamic> data) =>
      UsersIDsRolesRow(data);
}

class UsersIDsRolesRow extends SupabaseDataRow {
  UsersIDsRolesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersIDsRolesTable();

  String get firebaseUid => getField<String>('firebase_uid')!;
  set firebaseUid(String value) => setField<String>('firebase_uid', value);

  String? get ehealthId => getField<String>('ehealth_id');
  set ehealthId(String? value) => setField<String>('ehealth_id', value);

  List<String> get role => getListField<String>('role');
  set role(List<String>? value) => setListField<String>('role', value);
}
