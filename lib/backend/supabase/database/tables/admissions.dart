import '../database.dart';

class AdmissionsTable extends SupabaseTable<AdmissionsRow> {
  @override
  String get tableName => 'admissions';

  @override
  AdmissionsRow createRow(Map<String, dynamic> data) => AdmissionsRow(data);
}

class AdmissionsRow extends SupabaseDataRow {
  AdmissionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AdmissionsTable();

  DateTime? get admitDate => getField<DateTime>('admitDate');
  set admitDate(DateTime? value) => setField<DateTime>('admitDate', value);

  String? get patientID => getField<String>('patientID');
  set patientID(String? value) => setField<String>('patientID', value);

  DateTime? get dischDate => getField<DateTime>('dischDate');
  set dischDate(DateTime? value) => setField<DateTime>('dischDate', value);

  DateTime? get deathDate => getField<DateTime>('deathDate');
  set deathDate(DateTime? value) => setField<DateTime>('deathDate', value);

  bool? get isHospitalityThisYear => getField<bool>('isHospitalityThisYear');
  set isHospitalityThisYear(bool? value) =>
      setField<bool>('isHospitalityThisYear', value);

  bool? get isHospitality30Days => getField<bool>('isHospitality30Days');
  set isHospitality30Days(bool? value) =>
      setField<bool>('isHospitality30Days', value);

  String get hadmID => getField<String>('hadmID')!;
  set hadmID(String value) => setField<String>('hadmID', value);

  String? get referalClinicName => getField<String>('referalClinicName');
  set referalClinicName(String? value) =>
      setField<String>('referalClinicName', value);

  String? get dischargeLocation => getField<String>('dischargeLocation');
  set dischargeLocation(String? value) =>
      setField<String>('dischargeLocation', value);

  double? get referalClinicCode => getField<double>('referalClinicCode');
  set referalClinicCode(double? value) =>
      setField<double>('referalClinicCode', value);

  bool? get isInsurance => getField<bool>('isInsurance');
  set isInsurance(bool? value) => setField<bool>('isInsurance', value);

  String? get insurancePoliceNumber =>
      getField<String>('insurancePoliceNumber');
  set insurancePoliceNumber(String? value) =>
      setField<String>('insurancePoliceNumber', value);

  int? get patientWeightIn => getField<int>('patientWeightIn');
  set patientWeightIn(int? value) => setField<int>('patientWeightIn', value);

  bool? get isHospitalExpireFlag => getField<bool>('isHospitalExpireFlag');
  set isHospitalExpireFlag(bool? value) =>
      setField<bool>('isHospitalExpireFlag', value);

  String? get diagnosisInCode => getField<String>('diagnosisInCode');
  set diagnosisInCode(String? value) =>
      setField<String>('diagnosisInCode', value);

  int? get departmentIn => getField<int>('departmentIn');
  set departmentIn(int? value) => setField<int>('departmentIn', value);

  int? get departmentOut => getField<int>('departmentOut');
  set departmentOut(int? value) => setField<int>('departmentOut', value);

  double? get medicalDirectionNumber =>
      getField<double>('medicalDirectionNumber');
  set medicalDirectionNumber(double? value) =>
      setField<double>('medicalDirectionNumber', value);

  double? get patientBodyTemperatureIn =>
      getField<double>('patientBodyTemperatureIn');
  set patientBodyTemperatureIn(double? value) =>
      setField<double>('patientBodyTemperatureIn', value);

  String? get arterialPressureIn => getField<String>('arterialPressureIn');
  set arterialPressureIn(String? value) =>
      setField<String>('arterialPressureIn', value);

  int? get chamberNumber => getField<int>('chamberNumber');
  set chamberNumber(int? value) => setField<int>('chamberNumber', value);

  int? get bedNumber => getField<int>('bedNumber');
  set bedNumber(int? value) => setField<int>('bedNumber', value);

  int? get hospitalityDays => getField<int>('hospitalityDays');
  set hospitalityDays(int? value) => setField<int>('hospitalityDays', value);

  String? get diagnosisFinalMain => getField<String>('diagnosisFinalMain');
  set diagnosisFinalMain(String? value) =>
      setField<String>('diagnosisFinalMain', value);

  dynamic? get diagnosesFinalOther => getField<dynamic>('diagnosesFinalOther');
  set diagnosesFinalOther(dynamic? value) =>
      setField<dynamic>('diagnosesFinalOther', value);

  DateTime? get diagnosesFinalDate => getField<DateTime>('diagnosesFinalDate');
  set diagnosesFinalDate(DateTime? value) =>
      setField<DateTime>('diagnosesFinalDate', value);

  String? get diagnosesFinalDoctor => getField<String>('diagnosesFinalDoctor');
  set diagnosesFinalDoctor(String? value) =>
      setField<String>('diagnosesFinalDoctor', value);

  bool? get diagnosesFinalIsTuberculosis =>
      getField<bool>('diagnosesFinalIsTuberculosis');
  set diagnosesFinalIsTuberculosis(bool? value) =>
      setField<bool>('diagnosesFinalIsTuberculosis', value);

  String? get diagnosesFinalTuberculosisForm =>
      getField<String>('diagnosesFinalTuberculosisForm');
  set diagnosesFinalTuberculosisForm(String? value) =>
      setField<String>('diagnosesFinalTuberculosisForm', value);

  String? get otherTherapy => getField<String>('otherTherapy');
  set otherTherapy(String? value) => setField<String>('otherTherapy', value);

  int? get capacityRestoration => getField<int>('capacityRestoration');
  set capacityRestoration(int? value) =>
      setField<int>('capacityRestoration', value);

  String? get conclusionForExamination =>
      getField<String>('conclusionForExamination');
  set conclusionForExamination(String? value) =>
      setField<String>('conclusionForExamination', value);

  int? get therapyResult => getField<int>('therapyResult');
  set therapyResult(int? value) => setField<int>('therapyResult', value);

  DateTime? get chestCavityExaminationDate =>
      getField<DateTime>('chestCavityExaminationDate');
  set chestCavityExaminationDate(DateTime? value) =>
      setField<DateTime>('chestCavityExaminationDate', value);

  DateTime? get oncologicalPreventiveExaminationDate =>
      getField<DateTime>('oncologicalPreventiveExaminationDate');
  set oncologicalPreventiveExaminationDate(DateTime? value) =>
      setField<DateTime>('oncologicalPreventiveExaminationDate', value);

  String? get attendingDoctor => getField<String>('attendingDoctor');
  set attendingDoctor(String? value) =>
      setField<String>('attendingDoctor', value);

  String? get headOfDepartmentDoctor =>
      getField<String>('headOfDepartmentDoctor');
  set headOfDepartmentDoctor(String? value) =>
      setField<String>('headOfDepartmentDoctor', value);

  String? get emergencyNotesPatientComplaints =>
      getField<String>('emergencyNotesPatientComplaints');
  set emergencyNotesPatientComplaints(String? value) =>
      setField<String>('emergencyNotesPatientComplaints', value);

  String? get emergencyNotesAnamnesisDisease =>
      getField<String>('emergencyNotesAnamnesisDisease');
  set emergencyNotesAnamnesisDisease(String? value) =>
      setField<String>('emergencyNotesAnamnesisDisease', value);

  String? get emergencyNotesAnamnesisLife =>
      getField<String>('emergencyNotesAnamnesisLife');
  set emergencyNotesAnamnesisLife(String? value) =>
      setField<String>('emergencyNotesAnamnesisLife', value);

  String? get emergencyNotesObjectiveState =>
      getField<String>('emergencyNotesObjectiveState');
  set emergencyNotesObjectiveState(String? value) =>
      setField<String>('emergencyNotesObjectiveState', value);

  bool? get emergencyNotesIsScabiesExamination =>
      getField<bool>('emergencyNotesIsScabiesExamination');
  set emergencyNotesIsScabiesExamination(bool? value) =>
      setField<bool>('emergencyNotesIsScabiesExamination', value);

  bool? get emergencyNotesIsPediculosisExamination =>
      getField<bool>('emergencyNotesIsPediculosisExamination');
  set emergencyNotesIsPediculosisExamination(bool? value) =>
      setField<bool>('emergencyNotesIsPediculosisExamination', value);

  bool? get emergencyNotesIsHospitalRulesAgreed =>
      getField<bool>('emergencyNotesIsHospitalRulesAgreed');
  set emergencyNotesIsHospitalRulesAgreed(bool? value) =>
      setField<bool>('emergencyNotesIsHospitalRulesAgreed', value);

  DateTime? get emergencyNotesHospitalRulesAgreedDate =>
      getField<DateTime>('emergencyNotesHospitalRulesAgreedDate ');
  set emergencyNotesHospitalRulesAgreedDate(DateTime? value) =>
      setField<DateTime>('emergencyNotesHospitalRulesAgreedDate ', value);

  String? get emergencyNotesDoctor => getField<String>('emergencyNotesDoctor');
  set emergencyNotesDoctor(String? value) =>
      setField<String>('emergencyNotesDoctor', value);

  DateTime? get generalNotesDateAndTime =>
      getField<DateTime>('generalNotesDateAndTime');
  set generalNotesDateAndTime(DateTime? value) =>
      setField<DateTime>('generalNotesDateAndTime', value);

  String? get generalNotesPatientComplaints =>
      getField<String>('generalNotesPatientComplaints');
  set generalNotesPatientComplaints(String? value) =>
      setField<String>('generalNotesPatientComplaints', value);

  String? get generalNotesAnamnesisDisease =>
      getField<String>('generalNotesAnamnesisDisease');
  set generalNotesAnamnesisDisease(String? value) =>
      setField<String>('generalNotesAnamnesisDisease', value);

  String? get generalNotesAnamnesisLifeLocalState =>
      getField<String>('generalNotesAnamnesisLifeLocalState');
  set generalNotesAnamnesisLifeLocalState(String? value) =>
      setField<String>('generalNotesAnamnesisLifeLocalState', value);

  String? get generalNotesAnamnesisLifeObjectiveState =>
      getField<String>('generalNotesAnamnesisLifeObjectiveState');
  set generalNotesAnamnesisLifeObjectiveState(String? value) =>
      setField<String>('generalNotesAnamnesisLifeObjectiveState', value);

  String? get generalNotesAnamnesisLifeOverallStateID =>
      getField<String>('generalNotesAnamnesisLifeOverallStateID');
  set generalNotesAnamnesisLifeOverallStateID(String? value) =>
      setField<String>('generalNotesAnamnesisLifeOverallStateID', value);

  bool? get isDiseasesWasInfectiousHepatitis =>
      getField<bool>('isDiseasesWasInfectiousHepatitis');
  set isDiseasesWasInfectiousHepatitis(bool? value) =>
      setField<bool>('isDiseasesWasInfectiousHepatitis', value);

  String? get diseasesWasVenerealDiseases =>
      getField<String>('diseasesWasVenerealDiseases');
  set diseasesWasVenerealDiseases(String? value) =>
      setField<String>('diseasesWasVenerealDiseases', value);

  bool? get isDiseasesWasTuberculosis =>
      getField<bool>('isDiseasesWasTuberculosis');
  set isDiseasesWasTuberculosis(bool? value) =>
      setField<bool>('isDiseasesWasTuberculosis', value);

  bool? get isDiseasesWasMalaria => getField<bool>('isDiseasesWasMalaria');
  set isDiseasesWasMalaria(bool? value) =>
      setField<bool>('isDiseasesWasMalaria', value);

  List<String> get generalNotesDiagnoses =>
      getListField<String>('generalNotesDiagnoses');
  set generalNotesDiagnoses(List<String>? value) =>
      setListField<String>('generalNotesDiagnoses', value);

  String? get generalNotesTreatmentPlan =>
      getField<String>('generalNotesTreatmentPlan');
  set generalNotesTreatmentPlan(String? value) =>
      setField<String>('generalNotesTreatmentPlan', value);

  String? get generalNotesDoctor => getField<String>('generalNotesDoctor');
  set generalNotesDoctor(String? value) =>
      setField<String>('generalNotesDoctor', value);

  String? get generalNotesHeadOfDepartmentDoctor =>
      getField<String>('generalNotesHeadOfDepartmentDoctor');
  set generalNotesHeadOfDepartmentDoctor(String? value) =>
      setField<String>('generalNotesHeadOfDepartmentDoctor', value);

  String? get generalNotesExaminationPlan =>
      getField<String>('generalNotesExaminationPlan');
  set generalNotesExaminationPlan(String? value) =>
      setField<String>('generalNotesExaminationPlan', value);

  dynamic? get medicalAnalysisResults =>
      getField<dynamic>('medicalAnalysisResults');
  set medicalAnalysisResults(dynamic? value) =>
      setField<dynamic>('medicalAnalysisResults', value);

  dynamic? get diary => getField<dynamic>('diary');
  set diary(dynamic? value) => setField<dynamic>('diary', value);

  dynamic? get specialistsExamination =>
      getField<dynamic>('specialistsExamination');
  set specialistsExamination(dynamic? value) =>
      setField<dynamic>('specialistsExamination', value);

  DateTime? get epicrisisDate => getField<DateTime>('epicrisisDate');
  set epicrisisDate(DateTime? value) =>
      setField<DateTime>('epicrisisDate', value);

  String? get chronicalGeneticalDiseases =>
      getField<String>('chronicalGeneticalDiseases');
  set chronicalGeneticalDiseases(String? value) =>
      setField<String>('chronicalGeneticalDiseases', value);

  PostgresTime? get admitTime => getField<PostgresTime>('admitTime');
  set admitTime(PostgresTime? value) =>
      setField<PostgresTime>('admitTime', value);

  PostgresTime? get dischTime => getField<PostgresTime>('dischTime');
  set dischTime(PostgresTime? value) =>
      setField<PostgresTime>('dischTime', value);

  PostgresTime? get deathTime => getField<PostgresTime>('deathTime');
  set deathTime(PostgresTime? value) =>
      setField<PostgresTime>('deathTime', value);

  bool? get isAdmissionUrgent => getField<bool>('isAdmissionUrgent');
  set isAdmissionUrgent(bool? value) =>
      setField<bool>('isAdmissionUrgent', value);

  List<String> get relatedPersonsIDs =>
      getListField<String>('relatedPersonsIDs');
  set relatedPersonsIDs(List<String>? value) =>
      setListField<String>('relatedPersonsIDs', value);

  String? get epicrisisPatientComplaints =>
      getField<String>('epicrisisPatientComplaints');
  set epicrisisPatientComplaints(String? value) =>
      setField<String>('epicrisisPatientComplaints', value);

  String? get epicrisisGlobalBloodTest =>
      getField<String>('epicrisisGlobalBloodTest');
  set epicrisisGlobalBloodTest(String? value) =>
      setField<String>('epicrisisGlobalBloodTest', value);

  String? get epicrisisGlobalUrineTest =>
      getField<String>('epicrisisGlobalUrineTest');
  set epicrisisGlobalUrineTest(String? value) =>
      setField<String>('epicrisisGlobalUrineTest', value);

  String? get epicrisisLiverTests => getField<String>('epicrisisLiverTests');
  set epicrisisLiverTests(String? value) =>
      setField<String>('epicrisisLiverTests', value);

  String? get epicrisisCoprogram => getField<String>('epicrisisCoprogram');
  set epicrisisCoprogram(String? value) =>
      setField<String>('epicrisisCoprogram', value);

  String? get epicrisisBloodGlucoseAnalysis =>
      getField<String>('epicrisisBloodGlucoseAnalysis');
  set epicrisisBloodGlucoseAnalysis(String? value) =>
      setField<String>('epicrisisBloodGlucoseAnalysis', value);

  String? get epicrisisBloodAmylaseAnalysis =>
      getField<String>('epicrisisBloodAmylaseAnalysis');
  set epicrisisBloodAmylaseAnalysis(String? value) =>
      setField<String>('epicrisisBloodAmylaseAnalysis', value);

  String? get epicrisisUrineGlucoseAnalysis =>
      getField<String>('epicrisisUrineGlucoseAnalysis');
  set epicrisisUrineGlucoseAnalysis(String? value) =>
      setField<String>('epicrisisUrineGlucoseAnalysis', value);

  String? get epicrisisUrineDiastasisAnalysis =>
      getField<String>('epicrisisUrineDiastasisAnalysis');
  set epicrisisUrineDiastasisAnalysis(String? value) =>
      setField<String>('epicrisisUrineDiastasisAnalysis', value);

  String? get epicrisisDiagnosisMain =>
      getField<String>('epicrisisDiagnosisMain');
  set epicrisisDiagnosisMain(String? value) =>
      setField<String>('epicrisisDiagnosisMain', value);

  dynamic? get epicrisisDiagnosesOther =>
      getField<dynamic>('epicrisisDiagnosesOther');
  set epicrisisDiagnosesOther(dynamic? value) =>
      setField<dynamic>('epicrisisDiagnosesOther', value);

  String? get epicrisisTreatment => getField<String>('epicrisisTreatment');
  set epicrisisTreatment(String? value) =>
      setField<String>('epicrisisTreatment', value);

  String? get epicrisisTreatmentRecomendations =>
      getField<String>('epicrisisTreatmentRecomendations');
  set epicrisisTreatmentRecomendations(String? value) =>
      setField<String>('epicrisisTreatmentRecomendations', value);

  String? get epicrisisTreatmentResult =>
      getField<String>('epicrisisTreatmentResult');
  set epicrisisTreatmentResult(String? value) =>
      setField<String>('epicrisisTreatmentResult', value);

  String? get epicrisisDoctor => getField<String>('epicrisisDoctor');
  set epicrisisDoctor(String? value) =>
      setField<String>('epicrisisDoctor', value);

  String? get epicrisisHeadOfDepartmentDoctor =>
      getField<String>('epicrisisHeadOfDepartmentDoctor');
  set epicrisisHeadOfDepartmentDoctor(String? value) =>
      setField<String>('epicrisisHeadOfDepartmentDoctor', value);

  DateTime? get postMortemutopsyDate =>
      getField<DateTime>('postMortemАutopsyDate');
  set postMortemutopsyDate(DateTime? value) =>
      setField<DateTime>('postMortemАutopsyDate', value);

  String? get postMortemDoctor => getField<String>('postMortemDoctor');
  set postMortemDoctor(String? value) =>
      setField<String>('postMortemDoctor', value);

  String? get postMortemHeadOfDepartmentDoctor =>
      getField<String>('postMortemHeadOfDepartmentDoctor');
  set postMortemHeadOfDepartmentDoctor(String? value) =>
      setField<String>('postMortemHeadOfDepartmentDoctor', value);

  String? get postMortemDiagnosisMain1 =>
      getField<String>('postMortemDiagnosisMain1');
  set postMortemDiagnosisMain1(String? value) =>
      setField<String>('postMortemDiagnosisMain1', value);

  String? get incapacitySertificate =>
      getField<String>('incapacitySertificate');
  set incapacitySertificate(String? value) =>
      setField<String>('incapacitySertificate', value);

  List<String> get interventions => getListField<String>('interventions');
  set interventions(List<String>? value) =>
      setListField<String>('interventions', value);

  String? get diagnosisInName => getField<String>('diagnosisInName');
  set diagnosisInName(String? value) =>
      setField<String>('diagnosisInName', value);

  bool? get isClosed => getField<bool>('isClosed');
  set isClosed(bool? value) => setField<bool>('isClosed', value);

  int? get departmentCurrent => getField<int>('department_current');
  set departmentCurrent(int? value) =>
      setField<int>('department_current', value);

  String? get doctorCurrent => getField<String>('doctor_current');
  set doctorCurrent(String? value) => setField<String>('doctor_current', value);

  bool? get isIncapacityCertificateNeed =>
      getField<bool>('isIncapacityCertificateNeed');
  set isIncapacityCertificateNeed(bool? value) =>
      setField<bool>('isIncapacityCertificateNeed', value);

  List<String> get doctorsInChat => getListField<String>('doctors_in_chat');
  set doctorsInChat(List<String>? value) =>
      setListField<String>('doctors_in_chat', value);
}
