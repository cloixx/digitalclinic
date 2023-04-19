import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EMailLoginFormModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for E-mailField widget.
  TextEditingController? eMailFieldController;
  String? Function(BuildContext, String?)? eMailFieldControllerValidator;
  // State field(s) for PasswordField widget.
  TextEditingController? passwordFieldController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordFieldVisibility = false;
  }

  void dispose() {
    eMailFieldController?.dispose();
    passwordFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
