import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/empty_lists/empty_list_search/empty_list_search_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/patient_item_searching/patient_item_searching_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'adoctor_calls_all_widget.dart' show AdoctorCallsAllWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdoctorCallsAllModel extends FlutterFlowModel<AdoctorCallsAllWidget> {
  ///  Local state fields for this component.

  List<PatientSearchDataStruct> userDataR = [];
  void addToUserDataR(PatientSearchDataStruct item) => userDataR.add(item);
  void removeFromUserDataR(PatientSearchDataStruct item) =>
      userDataR.remove(item);
  void removeAtIndexFromUserDataR(int index) => userDataR.removeAt(index);
  void insertAtIndexInUserDataR(int index, PatientSearchDataStruct item) =>
      userDataR.insert(index, item);
  void updateUserDataRAtIndex(
          int index, Function(PatientSearchDataStruct) updateFn) =>
      userDataR[index] = updateFn(userDataR[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (searchPatientByParam serviceRole secret RLS)] action in adoctorCallsAll widget.
  ApiCallResponse? apiResultInitiated;
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
  ApiCallResponse? apiResulttgd;
  // Models for patientItemSearching dynamic component.
  late FlutterFlowDynamicModels<PatientItemSearchingModel>
      patientItemSearchingModels;

  @override
  void initState(BuildContext context) {
    patientItemSearchingModels =
        FlutterFlowDynamicModels(() => PatientItemSearchingModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    patientItemSearchingModels.dispose();
  }
}
