import '../database.dart';

class PatientsTable extends SupabaseTable<PatientsRow> {
  @override
  String get tableName => 'patients';

  @override
  PatientsRow createRow(Map<String, dynamic> data) => PatientsRow(data);
}

class PatientsRow extends SupabaseDataRow {
  PatientsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PatientsTable();

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  String? get patientFirstName => getField<String>('patientFirstName');
  set patientFirstName(String? value) =>
      setField<String>('patientFirstName', value);

  String? get patientLastName => getField<String>('patientLastName');
  set patientLastName(String? value) =>
      setField<String>('patientLastName', value);

  String? get patientMiddleName => getField<String>('patientMiddleName');
  set patientMiddleName(String? value) =>
      setField<String>('patientMiddleName', value);

  DateTime? get patientDateOfBirth => getField<DateTime>('patientDateOfBirth');
  set patientDateOfBirth(DateTime? value) =>
      setField<DateTime>('patientDateOfBirth', value);

  String? get credentialDocument => getField<String>('credentialDocument');
  set credentialDocument(String? value) =>
      setField<String>('credentialDocument', value);

  String? get credentialDocumentId => getField<String>('credentialDocumentId');
  set credentialDocumentId(String? value) =>
      setField<String>('credentialDocumentId', value);

  double? get citizenship => getField<double>('citizenship');
  set citizenship(double? value) => setField<double>('citizenship', value);

  String? get addressCity => getField<String>('addressCity');
  set addressCity(String? value) => setField<String>('addressCity', value);

  String? get addressFlat => getField<String>('addressFlat');
  set addressFlat(String? value) => setField<String>('addressFlat', value);

  String? get addressHouse => getField<String>('addressHouse');
  set addressHouse(String? value) => setField<String>('addressHouse', value);

  String? get addressOblast => getField<String>('addressOblast');
  set addressOblast(String? value) => setField<String>('addressOblast', value);

  String? get addressRegion => getField<String>('addressRegion');
  set addressRegion(String? value) => setField<String>('addressRegion', value);

  String? get addressStreet => getField<String>('addressStreet');
  set addressStreet(String? value) => setField<String>('addressStreet', value);

  String? get addressType => getField<String>('addressType');
  set addressType(String? value) => setField<String>('addressType', value);

  int? get addressPostIndex => getField<int>('addressPostIndex');
  set addressPostIndex(int? value) => setField<int>('addressPostIndex', value);

  String? get workPlace => getField<String>('workPlace');
  set workPlace(String? value) => setField<String>('workPlace', value);

  String? get workPosition => getField<String>('workPosition');
  set workPosition(String? value) => setField<String>('workPosition', value);

  bool? get isInvalid => getField<bool>('isInvalid');
  set isInvalid(bool? value) => setField<bool>('isInvalid', value);

  int? get invalidGroup => getField<int>('invalidGroup');
  set invalidGroup(int? value) => setField<int>('invalidGroup', value);

  String? get invalidType => getField<String>('invalidType ');
  set invalidType(String? value) => setField<String>('invalidType ', value);

  int? get bloodGroup => getField<int>('bloodGroup ');
  set bloodGroup(int? value) => setField<int>('bloodGroup ', value);

  bool? get bloodRhesusFactor => getField<bool>('bloodRhesusFactor');
  set bloodRhesusFactor(bool? value) =>
      setField<bool>('bloodRhesusFactor', value);

  bool? get isAllergyReactionMedicaments =>
      getField<bool>('isAllergyReactionMedicaments');
  set isAllergyReactionMedicaments(bool? value) =>
      setField<bool>('isAllergyReactionMedicaments', value);

  String? get allergyReactionMedicaments =>
      getField<String>('allergyReactionMedicaments');
  set allergyReactionMedicaments(String? value) =>
      setField<String>('allergyReactionMedicaments', value);

  bool? get isInsurance => getField<bool>('isInsurance');
  set isInsurance(bool? value) => setField<bool>('isInsurance', value);

  String? get insurancePoliceNumber =>
      getField<String>('insurancePoliceNumber');
  set insurancePoliceNumber(String? value) =>
      setField<String>('insurancePoliceNumber', value);

  String? get ehealthID => getField<String>('EhealthID');
  set ehealthID(String? value) => setField<String>('EhealthID', value);

  String? get patientPhoneNumber => getField<String>('patientPhoneNumber');
  set patientPhoneNumber(String? value) =>
      setField<String>('patientPhoneNumber', value);

  bool? get isHiv => getField<bool>('isHiv');
  set isHiv(bool? value) => setField<bool>('isHiv', value);

  DateTime? get hivExaminationDate => getField<DateTime>('hivExaminationDate');
  set hivExaminationDate(DateTime? value) =>
      setField<DateTime>('hivExaminationDate', value);

  bool? get isTobacco => getField<bool>('isTobacco');
  set isTobacco(bool? value) => setField<bool>('isTobacco', value);

  bool? get isElectronicCigarettes => getField<bool>('isElectronicCigarettes');
  set isElectronicCigarettes(bool? value) =>
      setField<bool>('isElectronicCigarettes', value);

  bool? get isAlcoholProblems => getField<bool>('isAlcoholProblems');
  set isAlcoholProblems(bool? value) =>
      setField<bool>('isAlcoholProblems', value);

  double? get patientHeight => getField<double>('patientHeight');
  set patientHeight(double? value) => setField<double>('patientHeight', value);

  dynamic? get patientWeightIn => getField<dynamic>('patientWeightIn');
  set patientWeightIn(dynamic? value) =>
      setField<dynamic>('patientWeightIn', value);

  dynamic? get coefficientHeightWeight =>
      getField<dynamic>('coefficientHeightWeight');
  set coefficientHeightWeight(dynamic? value) =>
      setField<dynamic>('coefficientHeightWeight', value);

  DateTime? get dateOfDeath => getField<DateTime>('dateOfDeath');
  set dateOfDeath(DateTime? value) => setField<DateTime>('dateOfDeath', value);

  String get subjectID => getField<String>('subjectID')!;
  set subjectID(String value) => setField<String>('subjectID', value);

  DateTime? get vasermanReactionDate =>
      getField<DateTime>('vasermanReactionDate');
  set vasermanReactionDate(DateTime? value) =>
      setField<DateTime>('vasermanReactionDate', value);

  bool? get vasermanReactionResult => getField<bool>('vasermanReactionResult');
  set vasermanReactionResult(bool? value) =>
      setField<bool>('vasermanReactionResult', value);

  int? get patientAge => getField<int>('patientAge');
  set patientAge(int? value) => setField<int>('patientAge', value);

  PostgresTime? get timeOfDeath => getField<PostgresTime>('timeOfDeath');
  set timeOfDeath(PostgresTime? value) =>
      setField<PostgresTime>('timeOfDeath', value);
}
