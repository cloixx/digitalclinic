import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sanitar/menus/san_drawer/san_drawer_widget.dart';
import '/sanitar/menus/san_menu/san_menu_widget.dart';
import 'dart:math';
import 'san_dashboard_widget.dart' show SanDashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SanDashboardModel extends FlutterFlowModel<SanDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in san_Dashboard widget.
  List<PSanitarsRow>? userDataRows;
  // Model for san_Drawer component.
  late SanDrawerModel sanDrawerModel;
  // Model for san_Menu component.
  late SanMenuModel sanMenuModel;

  @override
  void initState(BuildContext context) {
    sanDrawerModel = createModel(context, () => SanDrawerModel());
    sanMenuModel = createModel(context, () => SanMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sanDrawerModel.dispose();
    sanMenuModel.dispose();
  }
}
