import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/old/user_list1/user_list1_widget.dart';
import 'adm_dashboard_old_widget.dart' show AdmDashboardOldWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdmDashboardOldModel extends FlutterFlowModel<AdmDashboardOldWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UserList1 component.
  late UserList1Model userList1Model;

  @override
  void initState(BuildContext context) {
    userList1Model = createModel(context, () => UserList1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userList1Model.dispose();
  }
}
