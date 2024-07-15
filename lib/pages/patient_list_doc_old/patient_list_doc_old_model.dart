import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/empty_lists/empty_list_search/empty_list_search_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/patient_item_doc_old/patient_item_doc_old_widget.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'patient_list_doc_old_widget.dart' show PatientListDocOldWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PatientListDocOldModel extends FlutterFlowModel<PatientListDocOldWidget> {
  ///  Local state fields for this component.

  List<PatientSearchDataStruct> usersData = [];
  void addToUsersData(PatientSearchDataStruct item) => usersData.add(item);
  void removeFromUsersData(PatientSearchDataStruct item) =>
      usersData.remove(item);
  void removeAtIndexFromUsersData(int index) => usersData.removeAt(index);
  void insertAtIndexInUsersData(int index, PatientSearchDataStruct item) =>
      usersData.insert(index, item);
  void updateUsersDataAtIndex(
          int index, Function(PatientSearchDataStruct) updateFn) =>
      usersData[index] = updateFn(usersData[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (searchPatientByParam serviceRole secret RLS)] action in patientList_doc_old widget.
  ApiCallResponse? apiResultSearchRealtime1;
  // Stores action output result for [Backend Call - API (searchPatientByParam serviceRole secret RLS)] action in patientList_doc_old widget.
  ApiCallResponse? apiResultSearchRealtime;
  // Stores action output result for [Backend Call - API (searchPatientByParam serviceRole secret RLS)] action in patientList_doc_old widget.
  ApiCallResponse? apiResultjl;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (searchPatientByParam serviceRole secret RLS)] action in DropDown widget.
  ApiCallResponse? apiResultPatientsReset1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (searchPatientByParam serviceRole secret RLS)] action in TextField widget.
  ApiCallResponse? apiResultPatSearching;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (searchPatientByParam serviceRole secret RLS)] action in ChoiceChips widget.
  ApiCallResponse? apiResultPatientsReset2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
