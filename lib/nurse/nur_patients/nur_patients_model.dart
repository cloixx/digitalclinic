import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nurse/menus/nur_drawer/nur_drawer_widget.dart';
import '/nurse/menus/nur_menu/nur_menu_widget.dart';
import '/pages/patient_list_nur/patient_list_nur_widget.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'nur_patients_widget.dart' show NurPatientsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NurPatientsModel extends FlutterFlowModel<NurPatientsWidget> {
  ///  Local state fields for this page.

  int? numOfCalls;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in nur_Patients widget.
  List<PNursesRow>? userDataRows;
  // Stores action output result for [Backend Call - Query Rows] action in nur_Patients widget.
  List<PatientsCallsViewRow>? calls;
  // Stores action output result for [Backend Call - Query Rows] action in nur_Patients widget.
  List<PatientsCallsViewRow>? calls11Copy;
  // Model for nur_Drawer component.
  late NurDrawerModel nurDrawerModel;
  // Model for nur_Menu component.
  late NurMenuModel nurMenuModel;
  // Model for patientList_nur component.
  late PatientListNurModel patientListNurModel;

  @override
  void initState(BuildContext context) {
    nurDrawerModel = createModel(context, () => NurDrawerModel());
    nurMenuModel = createModel(context, () => NurMenuModel());
    patientListNurModel = createModel(context, () => PatientListNurModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nurDrawerModel.dispose();
    nurMenuModel.dispose();
    patientListNurModel.dispose();
  }
}
