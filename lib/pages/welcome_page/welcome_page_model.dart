import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/backend/schema/structs/index.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'welcome_page_widget.dart' show WelcomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomePageModel extends FlutterFlowModel<WelcomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (departmentsAllToDatatype)] action in WelcomePage widget.
  ApiCallResponse? departments;
  // Stores action output result for [Backend Call - API (getUserRoles)] action in WelcomePage widget.
  ApiCallResponse? userRolesList;
  // Stores action output result for [Backend Call - API (rolesAllToDatatype)] action in WelcomePage widget.
  ApiCallResponse? apiResultAllRoles;
  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList = [
    'Animation 1',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];

  @override
  void initState(BuildContext context) {
    riveAnimationAnimationsList.forEach((name) {
      riveAnimationControllers.add(FlutterFlowRiveController(
        name,
      ));
    });
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
