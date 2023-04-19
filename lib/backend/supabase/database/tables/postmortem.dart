import '../database.dart';

class PostmortemTable extends SupabaseTable<PostmortemRow> {
  @override
  String get tableName => 'postmortem';

  @override
  PostmortemRow createRow(Map<String, dynamic> data) => PostmortemRow(data);
}

class PostmortemRow extends SupabaseDataRow {
  PostmortemRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostmortemTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get subjectID => getField<String>('subjectID');
  set subjectID(String? value) => setField<String>('subjectID', value);

  String? get clinic => getField<String>('clinic');
  set clinic(String? value) => setField<String>('clinic', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get protocolNumber => getField<String>('protocolNumber');
  set protocolNumber(String? value) =>
      setField<String>('protocolNumber', value);

  String? get diagnosisMain => getField<String>('diagnosisMain');
  set diagnosisMain(String? value) => setField<String>('diagnosisMain', value);

  List<String> get diagnosesComplication =>
      getListField<String>('diagnosesComplication');
  set diagnosesComplication(List<String>? value) =>
      setListField<String>('diagnosesComplication', value);

  List<String> get concomitantDiseases =>
      getListField<String>('concomitantDiseases');
  set concomitantDiseases(List<String>? value) =>
      setListField<String>('concomitantDiseases', value);

  String? get postmortemEqualClinic =>
      getField<String>('postmortemEqualClinic');
  set postmortemEqualClinic(String? value) =>
      setField<String>('postmortemEqualClinic', value);

  String? get postmortemNotEqualClinicCauses =>
      getField<String>('postmortemNotEqualClinicCauses');
  set postmortemNotEqualClinicCauses(String? value) =>
      setField<String>('postmortemNotEqualClinicCauses', value);
}
