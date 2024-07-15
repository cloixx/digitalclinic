import '../database.dart';

class ChatMessagesTable extends SupabaseTable<ChatMessagesRow> {
  @override
  String get tableName => 'chat_messages';

  @override
  ChatMessagesRow createRow(Map<String, dynamic> data) => ChatMessagesRow(data);
}

class ChatMessagesRow extends SupabaseDataRow {
  ChatMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatMessagesTable();

  String? get patientId => getField<String>('patient_id');
  set patientId(String? value) => setField<String>('patient_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get doctorId => getField<String>('doctor_id');
  set doctorId(String? value) => setField<String>('doctor_id', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  bool? get isViewedByOpponent => getField<bool>('is_viewed_by_opponent');
  set isViewedByOpponent(bool? value) =>
      setField<bool>('is_viewed_by_opponent', value);
}
