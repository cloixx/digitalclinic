import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/empty_lists/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/patient_item_doc/patient_item_doc_widget.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'patient_list_doc_widget.dart' show PatientListDocWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PatientListDocModel extends FlutterFlowModel<PatientListDocWidget> {
  ///  Local state fields for this component.

  List<PatientInDepartmentViewStruct> patientsList = [];
  void addToPatientsList(PatientInDepartmentViewStruct item) =>
      patientsList.add(item);
  void removeFromPatientsList(PatientInDepartmentViewStruct item) =>
      patientsList.remove(item);
  void removeAtIndexFromPatientsList(int index) => patientsList.removeAt(index);
  void insertAtIndexInPatientsList(
          int index, PatientInDepartmentViewStruct item) =>
      patientsList.insert(index, item);
  void updatePatientsListAtIndex(
          int index, Function(PatientInDepartmentViewStruct) updateFn) =>
      patientsList[index] = updateFn(patientsList[index]);

  List<int> chambers = [];
  void addToChambers(int item) => chambers.add(item);
  void removeFromChambers(int item) => chambers.remove(item);
  void removeAtIndexFromChambers(int index) => chambers.removeAt(index);
  void insertAtIndexInChambers(int index, int item) =>
      chambers.insert(index, item);
  void updateChambersAtIndex(int index, Function(int) updateFn) =>
      chambers[index] = updateFn(chambers[index]);

  int nullItem = 0;

  List<int> chambersWithNull = [];
  void addToChambersWithNull(int item) => chambersWithNull.add(item);
  void removeFromChambersWithNull(int item) => chambersWithNull.remove(item);
  void removeAtIndexFromChambersWithNull(int index) =>
      chambersWithNull.removeAt(index);
  void insertAtIndexInChambersWithNull(int index, int item) =>
      chambersWithNull.insert(index, item);
  void updateChambersWithNullAtIndex(int index, Function(int) updateFn) =>
      chambersWithNull[index] = updateFn(chambersWithNull[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (patientInViewByDepartment serviceRole secret RLS)] action in patientList_doc widget.
  ApiCallResponse? patientsData1;
  // Stores action output result for [Backend Call - API (patientInViewByDepartment serviceRole secret RLS)] action in patientList_doc widget.
  ApiCallResponse? patientsData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
