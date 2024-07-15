import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'e_mail_login_form_widget.dart' show EMailLoginFormWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EMailLoginFormModel extends FlutterFlowModel<EMailLoginFormWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for E-mailField widget.
  FocusNode? eMailFieldFocusNode;
  TextEditingController? eMailFieldTextController;
  String? Function(BuildContext, String?)? eMailFieldTextControllerValidator;
  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordFieldVisibility = false;
  }

  @override
  void dispose() {
    eMailFieldFocusNode?.dispose();
    eMailFieldTextController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();
  }
}
