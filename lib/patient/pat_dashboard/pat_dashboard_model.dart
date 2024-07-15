import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/forms/admission_data_info/admission_data_info_widget.dart';
import '/forms/patient_data_info/patient_data_info_widget.dart';
import '/patient/menus/pat_drawer/pat_drawer_widget.dart';
import '/patient/menus/pat_menu/pat_menu_widget.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:sticky_headers/sticky_headers.dart';
import 'pat_dashboard_widget.dart' show PatDashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class PatDashboardModel extends FlutterFlowModel<PatDashboardWidget> {
  ///  Local state fields for this page.

  Color? bellColor = Color(4294967295);

  int? bellIconSize = 28;

  bool isMyDataOn = true;

  bool isAdmissionOn = true;

  int? numOfMessages = 0;

  AdmissionsRow? admissionRow;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in pat_Dashboard widget.
  List<PatientsRow>? userDataRows;
  // Stores action output result for [Backend Call - Query Rows] action in pat_Dashboard widget.
  List<AdmissionsRow>? admissionRows;
  // Stores action output result for [Backend Call - Query Rows] action in pat_Dashboard widget.
  List<DDepartmentsRow>? departnentCurrentInfo;
  // Stores action output result for [Backend Call - Query Rows] action in pat_Dashboard widget.
  List<ChatMessagesViewRow>? messages;
  // Stores action output result for [Backend Call - Query Rows] action in pat_Dashboard widget.
  List<ChatMessagesViewRow>? messages1;
  // Model for pat_Drawer component.
  late PatDrawerModel patDrawerModel;
  // Model for pat_Menu component.
  late PatMenuModel patMenuModel;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  // Model for patientDataInfo component.
  late PatientDataInfoModel patientDataInfoModel;
  // Model for admissionDataInfo component.
  late AdmissionDataInfoModel admissionDataInfoModel;

  @override
  void initState(BuildContext context) {
    patDrawerModel = createModel(context, () => PatDrawerModel());
    patMenuModel = createModel(context, () => PatMenuModel());
    patientDataInfoModel = createModel(context, () => PatientDataInfoModel());
    admissionDataInfoModel =
        createModel(context, () => AdmissionDataInfoModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    patDrawerModel.dispose();
    patMenuModel.dispose();
    patientDataInfoModel.dispose();
    admissionDataInfoModel.dispose();
  }
}
