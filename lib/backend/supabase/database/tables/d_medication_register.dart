import '../database.dart';

class DMedicationRegisterTable extends SupabaseTable<DMedicationRegisterRow> {
  @override
  String get tableName => 'D_medication_register';

  @override
  DMedicationRegisterRow createRow(Map<String, dynamic> data) =>
      DMedicationRegisterRow(data);
}

class DMedicationRegisterRow extends SupabaseDataRow {
  DMedicationRegisterRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DMedicationRegisterTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get trademarkName => getField<String>('trademark_name');
  set trademarkName(String? value) => setField<String>('trademark_name', value);

  String? get iNNName => getField<String>('INN_name');
  set iNNName(String? value) => setField<String>('INN_name', value);

  String? get form => getField<String>('form');
  set form(String? value) => setField<String>('form', value);

  String? get leaveConditions => getField<String>('leave_conditions');
  set leaveConditions(String? value) =>
      setField<String>('leave_conditions', value);

  String? get composition => getField<String>('composition');
  set composition(String? value) => setField<String>('composition', value);

  String? get pharmTherapyGroup => getField<String>('pharm_therapy_group');
  set pharmTherapyGroup(String? value) =>
      setField<String>('pharm_therapy_group', value);

  String? get atc1Code => getField<String>('atc1_code');
  set atc1Code(String? value) => setField<String>('atc1_code', value);

  String? get atc2Code => getField<String>('atc2_code');
  set atc2Code(String? value) => setField<String>('atc2_code', value);

  String? get atc3Code => getField<String>('atc3_code');
  set atc3Code(String? value) => setField<String>('atc3_code', value);

  String? get applicantNameUa => getField<String>('applicant_name_ua');
  set applicantNameUa(String? value) =>
      setField<String>('applicant_name_ua', value);

  String? get applicantCountry => getField<String>('applicant_country');
  set applicantCountry(String? value) =>
      setField<String>('applicant_country', value);

  String? get applicantAddress => getField<String>('applicant_address');
  set applicantAddress(String? value) =>
      setField<String>('applicant_address', value);

  int? get manufacturersCount => getField<int>('manufacturers_count');
  set manufacturersCount(int? value) =>
      setField<int>('manufacturers_count', value);

  String? get manufacturer1NameUa => getField<String>('manufacturer1_name_ua');
  set manufacturer1NameUa(String? value) =>
      setField<String>('manufacturer1_name_ua', value);

  String? get manufacturer1Country => getField<String>('manufacturer1_country');
  set manufacturer1Country(String? value) =>
      setField<String>('manufacturer1_country', value);

  String? get manufacturer1Address => getField<String>('manufacturer1_address');
  set manufacturer1Address(String? value) =>
      setField<String>('manufacturer1_address', value);

  String? get manufacturer2NameUa => getField<String>('manufacturer2_name_ua');
  set manufacturer2NameUa(String? value) =>
      setField<String>('manufacturer2_name_ua', value);

  String? get manufacturer2Country => getField<String>('manufacturer2_country');
  set manufacturer2Country(String? value) =>
      setField<String>('manufacturer2_country', value);

  String? get manufacturer2Address => getField<String>('manufacturer2_address');
  set manufacturer2Address(String? value) =>
      setField<String>('manufacturer2_address', value);

  String? get manufacturer3NameUa => getField<String>('manufacturer3_name_ua');
  set manufacturer3NameUa(String? value) =>
      setField<String>('manufacturer3_name_ua', value);

  String? get manufacturer3Country => getField<String>('manufacturer3_country');
  set manufacturer3Country(String? value) =>
      setField<String>('manufacturer3_country', value);

  String? get manufacturer3Address => getField<String>('manufacturer3_address');
  set manufacturer3Address(String? value) =>
      setField<String>('manufacturer3_address', value);

  String? get manufacturer4NameUa => getField<String>('manufacturer4_name_ua');
  set manufacturer4NameUa(String? value) =>
      setField<String>('manufacturer4_name_ua', value);

  String? get manufacturer4Country => getField<String>('manufacturer4_country');
  set manufacturer4Country(String? value) =>
      setField<String>('manufacturer4_country', value);

  String? get manufacturer4Address => getField<String>('manufacturer4_address');
  set manufacturer4Address(String? value) =>
      setField<String>('manufacturer4_address', value);

  String? get manufacturer5NameUa => getField<String>('manufacturer5_name_ua');
  set manufacturer5NameUa(String? value) =>
      setField<String>('manufacturer5_name_ua', value);

  String? get manufacturer5Country => getField<String>('manufacturer5_country');
  set manufacturer5Country(String? value) =>
      setField<String>('manufacturer5_country', value);

  String? get manufacturer5Address => getField<String>('manufacturer5_address');
  set manufacturer5Address(String? value) =>
      setField<String>('manufacturer5_address', value);

  String? get registrationCertificateNumber =>
      getField<String>('registration_certificate_number');
  set registrationCertificateNumber(String? value) =>
      setField<String>('registration_certificate_number', value);

  String? get certificateBeginDate =>
      getField<String>('certificate_begin_date');
  set certificateBeginDate(String? value) =>
      setField<String>('certificate_begin_date', value);

  String? get certificateEndDate => getField<String>('certificate_end_date');
  set certificateEndDate(String? value) =>
      setField<String>('certificate_end_date', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get isBiologicalOrigin => getField<String>('is_biological_origin');
  set isBiologicalOrigin(String? value) =>
      setField<String>('is_biological_origin', value);

  String? get isPlantOrigin => getField<String>('is_plant_origin');
  set isPlantOrigin(String? value) =>
      setField<String>('is_plant_origin', value);

  String? get isOrphan => getField<String>('is_orphan');
  set isOrphan(String? value) => setField<String>('is_orphan', value);

  String? get isHomeopathic => getField<String>('is_homeopathic');
  set isHomeopathic(String? value) => setField<String>('is_homeopathic', value);

  String? get iNNType => getField<String>('INN_type');
  set iNNType(String? value) => setField<String>('INN_type', value);

  String? get isEarlyTermination => getField<String>('is_early_termination');
  set isEarlyTermination(String? value) =>
      setField<String>('is_early_termination', value);

  String? get earlyTerminationLastDay =>
      getField<String>('early_termination_last_day');
  set earlyTerminationLastDay(String? value) =>
      setField<String>('early_termination_last_day', value);

  String? get earlyTerminationCause =>
      getField<String>('early_termination_cause');
  set earlyTerminationCause(String? value) =>
      setField<String>('early_termination_cause', value);

  String? get instructionsUrl => getField<String>('instructions_url');
  set instructionsUrl(String? value) =>
      setField<String>('instructions_url', value);

  String? get expirationPeriod => getField<String>('expiration_period');
  set expirationPeriod(String? value) =>
      setField<String>('expiration_period', value);

  String? get expirationValue => getField<String>('expiration_value');
  set expirationValue(String? value) =>
      setField<String>('expiration_value', value);

  String? get expirationMeasurement =>
      getField<String>('expiration_measurement');
  set expirationMeasurement(String? value) =>
      setField<String>('expiration_measurement', value);
}
