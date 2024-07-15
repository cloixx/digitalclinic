import '../database.dart';

class PDoctorsTable extends SupabaseTable<PDoctorsRow> {
  @override
  String get tableName => 'p_doctors';

  @override
  PDoctorsRow createRow(Map<String, dynamic> data) => PDoctorsRow(data);
}

class PDoctorsRow extends SupabaseDataRow {
  PDoctorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PDoctorsTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get firstName => getField<String>('firstName');
  set firstName(String? value) => setField<String>('firstName', value);

  String? get userProfileID => getField<String>('user_profile_ID');
  set userProfileID(String? value) =>
      setField<String>('user_profile_ID', value);

  String? get lastName => getField<String>('lastName');
  set lastName(String? value) => setField<String>('lastName', value);

  String? get middleName => getField<String>('middleName');
  set middleName(String? value) => setField<String>('middleName', value);

  DateTime? get dateOfBirth => getField<DateTime>('dateOfBirth');
  set dateOfBirth(DateTime? value) => setField<DateTime>('dateOfBirth', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  String? get phoneNumber => getField<String>('phoneNumber');
  set phoneNumber(String? value) => setField<String>('phoneNumber', value);

  String? get photoUrl => getField<String>('photoUrl');
  set photoUrl(String? value) => setField<String>('photoUrl', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int? get departmentId => getField<int>('department_id');
  set departmentId(int? value) => setField<int>('department_id', value);
}
