import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/senior_nurse/menus/s_nur_drawer/s_nur_drawer_widget.dart';
import '/senior_nurse/menus/s_nur_menu/s_nur_menu_widget.dart';
import 'dart:math';
import 's_nur_dashboard_widget.dart' show SNurDashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SNurDashboardModel extends FlutterFlowModel<SNurDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in s_nur_Dashboard widget.
  List<PNursesRow>? userDataRows;
  // Model for s_nur_Drawer component.
  late SNurDrawerModel sNurDrawerModel;
  // Model for s_nur_Menu component.
  late SNurMenuModel sNurMenuModel;

  @override
  void initState(BuildContext context) {
    sNurDrawerModel = createModel(context, () => SNurDrawerModel());
    sNurMenuModel = createModel(context, () => SNurMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sNurDrawerModel.dispose();
    sNurMenuModel.dispose();
  }
}
