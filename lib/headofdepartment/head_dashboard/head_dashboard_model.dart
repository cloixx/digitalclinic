import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/headofdepartment/menus/head_drawer/head_drawer_widget.dart';
import '/headofdepartment/menus/head_menu/head_menu_widget.dart';
import 'dart:math';
import 'head_dashboard_widget.dart' show HeadDashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeadDashboardModel extends FlutterFlowModel<HeadDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in head_Dashboard widget.
  List<PDoctorsRow>? userDataRows;
  // Model for head_Drawer component.
  late HeadDrawerModel headDrawerModel;
  // Model for head_Menu component.
  late HeadMenuModel headMenuModel;

  @override
  void initState(BuildContext context) {
    headDrawerModel = createModel(context, () => HeadDrawerModel());
    headMenuModel = createModel(context, () => HeadMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headDrawerModel.dispose();
    headMenuModel.dispose();
  }
}
