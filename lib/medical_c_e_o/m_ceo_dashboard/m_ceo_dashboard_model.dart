import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/medical_c_e_o/menus/m_ceo_drawer/m_ceo_drawer_widget.dart';
import '/medical_c_e_o/menus/m_ceo_menu/m_ceo_menu_widget.dart';
import 'dart:math';
import 'm_ceo_dashboard_widget.dart' show MCeoDashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MCeoDashboardModel extends FlutterFlowModel<MCeoDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in m_ceo_Dashboard widget.
  List<PCeoRow>? userDataRows;
  // Model for m_ceo_Drawer component.
  late MCeoDrawerModel mCeoDrawerModel;
  // Model for m_ceo_Menu component.
  late MCeoMenuModel mCeoMenuModel;

  @override
  void initState(BuildContext context) {
    mCeoDrawerModel = createModel(context, () => MCeoDrawerModel());
    mCeoMenuModel = createModel(context, () => MCeoMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mCeoDrawerModel.dispose();
    mCeoMenuModel.dispose();
  }
}
