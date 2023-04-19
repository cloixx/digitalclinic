import '../database.dart';

class DICDDiagnosesTable extends SupabaseTable<DICDDiagnosesRow> {
  @override
  String get tableName => 'D_ICD_Diagnoses';

  @override
  DICDDiagnosesRow createRow(Map<String, dynamic> data) =>
      DICDDiagnosesRow(data);
}

class DICDDiagnosesRow extends SupabaseDataRow {
  DICDDiagnosesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DICDDiagnosesTable();

  String get level6Code => getField<String>('level6_code')!;
  set level6Code(String value) => setField<String>('level6_code', value);

  String? get level6DescriptionUa => getField<String>('level6_description_ua');
  set level6DescriptionUa(String? value) =>
      setField<String>('level6_description_ua', value);

  String? get level6DescriptionEn => getField<String>('level6_description_en');
  set level6DescriptionEn(String? value) =>
      setField<String>('level6_description_en', value);

  String? get level1Class => getField<String>('level1_class');
  set level1Class(String? value) => setField<String>('level1_class', value);

  String? get level1DescriptionUa => getField<String>('level1_description_ua');
  set level1DescriptionUa(String? value) =>
      setField<String>('level1_description_ua', value);

  String? get level2SubclassCode => getField<String>('level2_subclass_code');
  set level2SubclassCode(String? value) =>
      setField<String>('level2_subclass_code', value);

  String? get level2SubclassDescriptionUa =>
      getField<String>('level2_subclass_description_ua');
  set level2SubclassDescriptionUa(String? value) =>
      setField<String>('level2_subclass_description_ua', value);

  String? get level3Code => getField<String>('level3_code');
  set level3Code(String? value) => setField<String>('level3_code', value);

  String? get level3DescriptionUa => getField<String>('level3_description_ua');
  set level3DescriptionUa(String? value) =>
      setField<String>('level3_description_ua', value);

  String? get level3DescriptionEn => getField<String>('level3_description_en');
  set level3DescriptionEn(String? value) =>
      setField<String>('level3_description_en', value);

  String? get level4Code => getField<String>('level4_code');
  set level4Code(String? value) => setField<String>('level4_code', value);

  String? get level4DescriptionUa => getField<String>('level4_description_ua');
  set level4DescriptionUa(String? value) =>
      setField<String>('level4_description_ua', value);

  String? get level4DescriptionEn => getField<String>('level4_description_en');
  set level4DescriptionEn(String? value) =>
      setField<String>('level4_description_en', value);

  String? get level5Code => getField<String>('level5_code');
  set level5Code(String? value) => setField<String>('level5_code', value);

  String? get level5DescriptionUa => getField<String>('level5_description_ua');
  set level5DescriptionUa(String? value) =>
      setField<String>('level5_description_ua', value);

  String? get level5DescriptionEn => getField<String>('level5_description_en');
  set level5DescriptionEn(String? value) =>
      setField<String>('level5_description_en', value);
}
