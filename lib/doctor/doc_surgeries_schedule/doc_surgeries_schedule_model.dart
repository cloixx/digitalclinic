import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/doctor/menus/doc_drawer/doc_drawer_widget.dart';
import '/doctor/menus/doc_menu/doc_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'doc_surgeries_schedule_widget.dart' show DocSurgeriesScheduleWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DocSurgeriesScheduleModel
    extends FlutterFlowModel<DocSurgeriesScheduleWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in doc_SurgeriesSchedule widget.
  List<PDoctorsRow>? userDataRows;
  // Model for doc_Drawer component.
  late DocDrawerModel docDrawerModel;
  // Model for doc_Menu component.
  late DocMenuModel docMenuModel;

  @override
  void initState(BuildContext context) {
    docDrawerModel = createModel(context, () => DocDrawerModel());
    docMenuModel = createModel(context, () => DocMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    docDrawerModel.dispose();
    docMenuModel.dispose();
  }
}