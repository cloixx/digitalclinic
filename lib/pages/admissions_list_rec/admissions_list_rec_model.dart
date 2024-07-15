import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/user_profile_list_searching/user_profile_list_searching_widget.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'admissions_list_rec_widget.dart' show AdmissionsListRecWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdmissionsListRecModel extends FlutterFlowModel<AdmissionsListRecWidget> {
  ///  Local state fields for this component.

  List<PatientSearchDataStruct> userData = [];
  void addToUserData(PatientSearchDataStruct item) => userData.add(item);
  void removeFromUserData(PatientSearchDataStruct item) =>
      userData.remove(item);
  void removeAtIndexFromUserData(int index) => userData.removeAt(index);
  void insertAtIndexInUserData(int index, PatientSearchDataStruct item) =>
      userData.insert(index, item);
  void updateUserDataAtIndex(
          int index, Function(PatientSearchDataStruct) updateFn) =>
      userData[index] = updateFn(userData[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (searchPatientByParam serviceRole secret RLS)] action in admissionsList_rec widget.
  ApiCallResponse? apiResultSearchRealtime;
  // Stores action output result for [Backend Call - API (searchPatientByParam serviceRole secret RLS)] action in admissionsList_rec widget.
  ApiCallResponse? apiResultjlf;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (searchPatientByParam serviceRole secret RLS)] action in DropDown widget.
  ApiCallResponse? apiResultPatientsReset;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (searchPatientByParam serviceRole secret RLS)] action in TextField widget.
  ApiCallResponse? apiResultPatSearch;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<PatientSearchDataStruct>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
