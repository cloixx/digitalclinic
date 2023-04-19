import '../database.dart';

class DACHIInterventionsTable extends SupabaseTable<DACHIInterventionsRow> {
  @override
  String get tableName => 'D_ACHI_Interventions';

  @override
  DACHIInterventionsRow createRow(Map<String, dynamic> data) =>
      DACHIInterventionsRow(data);
}

class DACHIInterventionsRow extends SupabaseDataRow {
  DACHIInterventionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DACHIInterventionsTable();

  String get code => getField<String>('code')!;
  set code(String value) => setField<String>('code', value);

  String? get codeNameUa => getField<String>('code_name_ua');
  set codeNameUa(String? value) => setField<String>('code_name_ua', value);

  String? get codeNameEn => getField<String>('code_name_en');
  set codeNameEn(String? value) => setField<String>('code_name_en', value);

  String? get classField => getField<String>('class');
  set classField(String? value) => setField<String>('class', value);

  String? get className => getField<String>('class_name');
  set className(String? value) => setField<String>('class_name', value);

  String? get anatomicLocalizationAxis =>
      getField<String>('anatomic_localization_axis');
  set anatomicLocalizationAxis(String? value) =>
      setField<String>('anatomic_localization_axis', value);

  String? get anatomicLocalizationName =>
      getField<String>('anatomic_localization_name');
  set anatomicLocalizationName(String? value) =>
      setField<String>('anatomic_localization_name', value);

  String? get procedureTypologyAxis =>
      getField<String>('procedure_typology_axis');
  set procedureTypologyAxis(String? value) =>
      setField<String>('procedure_typology_axis', value);

  String? get procedureTypologyName =>
      getField<String>('procedure_typology_name');
  set procedureTypologyName(String? value) =>
      setField<String>('procedure_typology_name', value);

  int? get blocksAxis => getField<int>('blocks_axis ');
  set blocksAxis(int? value) => setField<int>('blocks_axis ', value);

  String? get blocksName => getField<String>('blocks_name');
  set blocksName(String? value) => setField<String>('blocks_name', value);
}
