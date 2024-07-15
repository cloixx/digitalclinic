import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/relative/menus/rel_drawer/rel_drawer_widget.dart';
import '/relative/menus/rel_menu/rel_menu_widget.dart';
import 'dart:math';
import 'rel_dashboard_widget.dart' show RelDashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RelDashboardModel extends FlutterFlowModel<RelDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in rel_Dashboard widget.
  List<RelativesRow>? userDataRows;
  // Model for rel_Drawer component.
  late RelDrawerModel relDrawerModel;
  // Model for rel_Menu component.
  late RelMenuModel relMenuModel;

  @override
  void initState(BuildContext context) {
    relDrawerModel = createModel(context, () => RelDrawerModel());
    relMenuModel = createModel(context, () => RelMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    relDrawerModel.dispose();
    relMenuModel.dispose();
  }
}
