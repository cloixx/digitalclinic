import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/backend/schema/structs/index.dart';
import 'welcome_page_with_a_p_i_old_widget.dart'
    show WelcomePageWithAPIOldWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomePageWithAPIOldModel
    extends FlutterFlowModel<WelcomePageWithAPIOldWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getUserRoles)] action in WelcomePage_WithAPI_old widget.
  ApiCallResponse? userRolesList;
  // Stores action output result for [Backend Call - API (rolesAllToDatatype)] action in WelcomePage_WithAPI_old widget.
  ApiCallResponse? apiResultRoles;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
