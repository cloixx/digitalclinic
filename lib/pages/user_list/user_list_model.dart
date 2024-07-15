import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/registered_users/registered_users_widget.dart';
import 'user_list_widget.dart' show UserListWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserListModel extends FlutterFlowModel<UserListWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for registeredUsers dynamic component.
  late FlutterFlowDynamicModels<RegisteredUsersModel> registeredUsersModels;

  @override
  void initState(BuildContext context) {
    registeredUsersModels =
        FlutterFlowDynamicModels(() => RegisteredUsersModel());
  }

  @override
  void dispose() {
    registeredUsersModels.dispose();
  }
}
