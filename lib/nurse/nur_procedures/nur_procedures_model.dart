import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nurse/menus/nur_drawer/nur_drawer_widget.dart';
import '/nurse/menus/nur_menu/nur_menu_widget.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'nur_procedures_widget.dart' show NurProceduresWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NurProceduresModel extends FlutterFlowModel<NurProceduresWidget> {
  ///  Local state fields for this page.

  int? numOfCalls;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in nur_Procedures widget.
  List<PNursesRow>? userDataRows;
  // Stores action output result for [Backend Call - Query Rows] action in nur_Procedures widget.
  List<LogPatientsCallsRow>? calls;
  // Stores action output result for [Backend Call - Query Rows] action in nur_Procedures widget.
  List<LogPatientsCallsRow>? calls11;
  // Model for nur_Drawer component.
  late NurDrawerModel nurDrawerModel;
  // Model for nur_Menu component.
  late NurMenuModel nurMenuModel;

  @override
  void initState(BuildContext context) {
    nurDrawerModel = createModel(context, () => NurDrawerModel());
    nurMenuModel = createModel(context, () => NurMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nurDrawerModel.dispose();
    nurMenuModel.dispose();
  }
}
