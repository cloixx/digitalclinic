import '/auth/firebase_auth/auth_util.dart';
import '/components/info_widget.dart';
import '/components/user_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageAdminModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for UserList component.
  late UserListModel userListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userListModel = createModel(context, () => UserListModel());
  }

  void dispose() {
    userListModel.dispose();
  }

  /// Additional helper methods are added here.

}
