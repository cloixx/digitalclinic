import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/chat/chat_item/chat_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/patient/menus/pat_drawer/pat_drawer_widget.dart';
import '/patient/menus/pat_menu/pat_menu_widget.dart';
import 'dart:math';
import 'pat_chat_widget.dart' show PatChatWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class PatChatModel extends FlutterFlowModel<PatChatWidget> {
  ///  Local state fields for this page.

  Color? bellColor = Color(4294967295);

  int? bellIconSize = 28;

  AdmissionsRow? admissionRow;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in pat_Chat widget.
  List<PatientsRow>? userDataRows;
  // Stores action output result for [Backend Call - Query Rows] action in pat_Chat widget.
  List<AdmissionsRow>? admissionRows;
  // Stores action output result for [Backend Call - Query Rows] action in pat_Chat widget.
  List<DDepartmentsRow>? departnentCurrentInfo;
  // Model for pat_Drawer component.
  late PatDrawerModel patDrawerModel;
  // Model for pat_Menu component.
  late PatMenuModel patMenuModel;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;

  @override
  void initState(BuildContext context) {
    patDrawerModel = createModel(context, () => PatDrawerModel());
    patMenuModel = createModel(context, () => PatMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    patDrawerModel.dispose();
    patMenuModel.dispose();
  }
}
