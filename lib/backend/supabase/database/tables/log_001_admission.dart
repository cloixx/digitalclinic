import '../database.dart';

class Log001AdmissionTable extends SupabaseTable<Log001AdmissionRow> {
  @override
  String get tableName => 'log_001_admission';

  @override
  Log001AdmissionRow createRow(Map<String, dynamic> data) =>
      Log001AdmissionRow(data);
}

class Log001AdmissionRow extends SupabaseDataRow {
  Log001AdmissionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => Log001AdmissionTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  PostgresTime? get time => getField<PostgresTime>('time');
  set time(PostgresTime? value) => setField<PostgresTime>('time', value);

  String? get patientLastFirstMiddleName =>
      getField<String>('patient_last_first_middle_name');
  set patientLastFirstMiddleName(String? value) =>
      setField<String>('patient_last_first_middle_name', value);

  DateTime? get patientDateOfBirth =>
      getField<DateTime>('patient_date_of_birth');
  set patientDateOfBirth(DateTime? value) =>
      setField<DateTime>('patient_date_of_birth', value);

  String? get patientAddress => getField<String>('patient_address');
  set patientAddress(String? value) =>
      setField<String>('patient_address', value);

  String? get patientPhoneNumber => getField<String>('patient_phone_number');
  set patientPhoneNumber(String? value) =>
      setField<String>('patient_phone_number', value);

  String? get confidantPersonName => getField<String>('confidant_person_name');
  set confidantPersonName(String? value) =>
      setField<String>('confidant_person_name', value);

  String? get confidantPhoneNumber =>
      getField<String>('confidant_phone_number');
  set confidantPhoneNumber(String? value) =>
      setField<String>('confidant_phone_number', value);

  String? get whoSent => getField<String>('who_sent');
  set whoSent(String? value) => setField<String>('who_sent', value);

  int? get admDepartment => getField<int>('adm_department');
  set admDepartment(int? value) => setField<int>('adm_department', value);

  int? get admId => getField<int>('adm_id');
  set admId(int? value) => setField<int>('adm_id', value);

  int? get preAdmDiagnosis => getField<int>('pre_adm_diagnosis');
  set preAdmDiagnosis(int? value) => setField<int>('pre_adm_diagnosis', value);

  int? get finalDiagnosis => getField<int>('final_diagnosis');
  set finalDiagnosis(int? value) => setField<int>('final_diagnosis', value);

  String? get dischargeStatus => getField<String>('discharge_status');
  set dischargeStatus(String? value) =>
      setField<String>('discharge_status', value);

  DateTime? get dischargeDate => getField<DateTime>('discharge_date');
  set dischargeDate(DateTime? value) =>
      setField<DateTime>('discharge_date', value);

  String? get transferDestination => getField<String>('transfer_destination');
  set transferDestination(String? value) =>
      setField<String>('transfer_destination', value);

  String? get disclaimerCause => getField<String>('disclaimer_cause');
  set disclaimerCause(String? value) =>
      setField<String>('disclaimer_cause', value);

  String? get disclaimerHelp => getField<String>('disclaimer_help');
  set disclaimerHelp(String? value) =>
      setField<String>('disclaimer_help', value);

  String? get notes => getField<String>('Notes');
  set notes(String? value) => setField<String>('Notes', value);
}
