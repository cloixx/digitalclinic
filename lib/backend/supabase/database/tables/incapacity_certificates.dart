import '../database.dart';

class IncapacityCertificatesTable
    extends SupabaseTable<IncapacityCertificatesRow> {
  @override
  String get tableName => 'incapacity_certificates';

  @override
  IncapacityCertificatesRow createRow(Map<String, dynamic> data) =>
      IncapacityCertificatesRow(data);
}

class IncapacityCertificatesRow extends SupabaseDataRow {
  IncapacityCertificatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IncapacityCertificatesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get number => getField<String>('number');
  set number(String? value) => setField<String>('number', value);

  DateTime? get dateStart => getField<DateTime>('dateStart');
  set dateStart(DateTime? value) => setField<DateTime>('dateStart', value);

  DateTime? get dateEnd => getField<DateTime>('dateEnd');
  set dateEnd(DateTime? value) => setField<DateTime>('dateEnd', value);

  String? get admissionID => getField<String>('admissionID');
  set admissionID(String? value) => setField<String>('admissionID', value);
}
