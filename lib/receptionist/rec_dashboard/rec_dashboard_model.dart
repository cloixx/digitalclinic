import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/patient_list_rec/patient_list_rec_widget.dart';
import '/pages/patient_list_searching/patient_list_searching_widget.dart';
import '/receptionist/menus/rec_drawer/rec_drawer_widget.dart';
import '/receptionist/menus/rec_menu/rec_menu_widget.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'rec_dashboard_widget.dart' show RecDashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecDashboardModel extends FlutterFlowModel<RecDashboardWidget> {
  ///  Local state fields for this page.

  WeigthStruct? weight;
  void updateWeightStruct(Function(WeigthStruct) updateFn) {
    updateFn(weight ??= WeigthStruct());
  }

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in rec_Dashboard widget.
  List<PReceptionistsRow>? userDataRows;
  Completer<List<PReceptionistsRow>>? requestCompleter;
  // Model for rec_Drawer component.
  late RecDrawerModel recDrawerModel;
  // Model for rec_Menu component.
  late RecMenuModel recMenuModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for patientList_rec component.
  late PatientListRecModel patientListRecModel;

  @override
  void initState(BuildContext context) {
    recDrawerModel = createModel(context, () => RecDrawerModel());
    recMenuModel = createModel(context, () => RecMenuModel());
    patientListRecModel = createModel(context, () => PatientListRecModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    recDrawerModel.dispose();
    recMenuModel.dispose();
    patientListRecModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
