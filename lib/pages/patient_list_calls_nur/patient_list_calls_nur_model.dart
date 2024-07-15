import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_list_calls/empty_list_calls_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/doctor_calls_all_rec/doctor_calls_all_rec_widget.dart';
import '/pages/new_call_for_doctor/new_call_for_doctor_widget.dart';
import '/pages/patient_calls_nur_item/patient_calls_nur_item_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'patient_list_calls_nur_widget.dart' show PatientListCallsNurWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class PatientListCallsNurModel
    extends FlutterFlowModel<PatientListCallsNurWidget> {
  ///  Local state fields for this component.

  List<String> checkedList = [];
  void addToCheckedList(String item) => checkedList.add(item);
  void removeFromCheckedList(String item) => checkedList.remove(item);
  void removeAtIndexFromCheckedList(int index) => checkedList.removeAt(index);
  void insertAtIndexInCheckedList(int index, String item) =>
      checkedList.insert(index, item);
  void updateCheckedListAtIndex(int index, Function(String) updateFn) =>
      checkedList[index] = updateFn(checkedList[index]);

  int? counter = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in patientList_calls_nur widget.
  List<PatientsCallsViewRow>? calls;
  Completer<List<PatientsCallsViewRow>>? requestCompleter1;
  // Stores action output result for [Backend Call - Query Rows] action in patientList_calls_nur widget.
  List<PatientsCallsViewRow>? calls11;
  // Stores action output result for [Backend Call - Query Rows] action in patientList_calls_nur widget.
  List<PatientsCallsViewRow>? calls22;
  AudioPlayer? soundPlayer0;
  Completer<List<LogDoctorRecCallsRow>>? requestCompleter2;
  // Model for newCallForDoctor component.
  late NewCallForDoctorModel newCallForDoctorModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for patient_calls_nur_Item dynamic component.
  late FlutterFlowDynamicModels<PatientCallsNurItemModel>
      patientCallsNurItemModels;

  @override
  void initState(BuildContext context) {
    newCallForDoctorModel = createModel(context, () => NewCallForDoctorModel());
    patientCallsNurItemModels =
        FlutterFlowDynamicModels(() => PatientCallsNurItemModel());
  }

  @override
  void dispose() {
    newCallForDoctorModel.dispose();
    patientCallsNurItemModels.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
