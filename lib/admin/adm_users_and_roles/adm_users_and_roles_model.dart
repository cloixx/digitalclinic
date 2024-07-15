import '/admin/menus/adm_drawer/adm_drawer_widget.dart';
import '/admin/menus/adm_menu/adm_menu_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/user_profile_list_searching_admin/user_profile_list_searching_admin_widget.dart';
import 'dart:math';
import 'adm_users_and_roles_widget.dart' show AdmUsersAndRolesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdmUsersAndRolesModel extends FlutterFlowModel<AdmUsersAndRolesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in adm_UsersAndRoles widget.
  List<PAdminsRow>? userDataRows;
  // Model for adm_Drawer component.
  late AdmDrawerModel admDrawerModel;
  // Model for adm_Menu component.
  late AdmMenuModel admMenuModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for userProfileListSearchingAdmin component.
  late UserProfileListSearchingAdminModel userProfileListSearchingAdminModel;

  @override
  void initState(BuildContext context) {
    admDrawerModel = createModel(context, () => AdmDrawerModel());
    admMenuModel = createModel(context, () => AdmMenuModel());
    userProfileListSearchingAdminModel =
        createModel(context, () => UserProfileListSearchingAdminModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    admDrawerModel.dispose();
    admMenuModel.dispose();
    userProfileListSearchingAdminModel.dispose();
  }
}
