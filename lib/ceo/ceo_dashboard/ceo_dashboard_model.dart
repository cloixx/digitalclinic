import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/ceo/menus/ceo_drawer/ceo_drawer_widget.dart';
import '/ceo/menus/ceo_menu/ceo_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'ceo_dashboard_widget.dart' show CeoDashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CeoDashboardModel extends FlutterFlowModel<CeoDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in ceo_Dashboard widget.
  List<PCeoRow>? userDataRows;
  // Model for ceo_Drawer component.
  late CeoDrawerModel ceoDrawerModel;
  // Model for ceo_Menu component.
  late CeoMenuModel ceoMenuModel;

  @override
  void initState(BuildContext context) {
    ceoDrawerModel = createModel(context, () => CeoDrawerModel());
    ceoMenuModel = createModel(context, () => CeoMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    ceoDrawerModel.dispose();
    ceoMenuModel.dispose();
  }
}
