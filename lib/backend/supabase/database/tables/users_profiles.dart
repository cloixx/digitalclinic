import '../database.dart';

class UsersProfilesTable extends SupabaseTable<UsersProfilesRow> {
  @override
  String get tableName => 'users_profiles';

  @override
  UsersProfilesRow createRow(Map<String, dynamic> data) =>
      UsersProfilesRow(data);
}

class UsersProfilesRow extends SupabaseDataRow {
  UsersProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersProfilesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  List<String> get roles => getListField<String>('roles');
  set roles(List<String>? value) => setListField<String>('roles', value);

  String? get googleName => getField<String>('google_name');
  set googleName(String? value) => setField<String>('google_name', value);

  String? get checkNumber => getField<String>('check_number');
  set checkNumber(String? value) => setField<String>('check_number', value);
}
