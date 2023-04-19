import '/components/e_mail_login_form_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EMailLoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for E-mailLoginForm component.
  late EMailLoginFormModel eMailLoginFormModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    eMailLoginFormModel = createModel(context, () => EMailLoginFormModel());
  }

  void dispose() {
    eMailLoginFormModel.dispose();
  }

  /// Additional helper methods are added here.

}
