import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/patients/patients_widget.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'patient_list_old_widget.dart' show PatientListOldWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PatientListOldModel extends FlutterFlowModel<PatientListOldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for patients dynamic component.
  late FlutterFlowDynamicModels<PatientsModel> patientsModels;

  @override
  void initState(BuildContext context) {
    patientsModels = FlutterFlowDynamicModels(() => PatientsModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    patientsModels.dispose();
  }
}
