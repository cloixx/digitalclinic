import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/user_profile_item_searching_dark/user_profile_item_searching_dark_widget.dart';
import '/pages/user_profile_list_searching/user_profile_list_searching_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'user_to_patient_dialog_widget.dart' show UserToPatientDialogWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserToPatientDialogModel
    extends FlutterFlowModel<UserToPatientDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for userProfileItemSearchingDark component.
  late UserProfileItemSearchingDarkModel userProfileItemSearchingDarkModel;

  @override
  void initState(BuildContext context) {
    userProfileItemSearchingDarkModel =
        createModel(context, () => UserProfileItemSearchingDarkModel());
  }

  @override
  void dispose() {
    userProfileItemSearchingDarkModel.dispose();
  }
}
