import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'set_user_name_phone_old_widget.dart' show SetUserNamePhoneOldWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SetUserNamePhoneOldModel
    extends FlutterFlowModel<SetUserNamePhoneOldWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // State field(s) for SecondName widget.
  FocusNode? secondNameFocusNode;
  TextEditingController? secondNameTextController;
  String? Function(BuildContext, String?)? secondNameTextControllerValidator;
  String? _secondNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введіть Ваше прізвище';
    }

    return null;
  }

  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введіть Ваше ім\'я';
    }

    return null;
  }

  // State field(s) for MiddleName widget.
  FocusNode? middleNameFocusNode;
  TextEditingController? middleNameTextController;
  String? Function(BuildContext, String?)? middleNameTextControllerValidator;
  String? _middleNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введіть Ваше ім\'я по батькові';
    }

    return null;
  }

  // State field(s) for youPhone widget.
  FocusNode? youPhoneFocusNode;
  TextEditingController? youPhoneTextController;
  final youPhoneMask = MaskTextInputFormatter(mask: '+38 (###) ###-##-##');
  String? Function(BuildContext, String?)? youPhoneTextControllerValidator;
  String? _youPhoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введіть Ваш номер телефону';
    }

    if (val.length < 19) {
      return 'Введіть вірний номер телефону';
    }
    if (val.length > 19) {
      return 'Введіть вірний номер телефону';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    secondNameTextControllerValidator = _secondNameTextControllerValidator;
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    middleNameTextControllerValidator = _middleNameTextControllerValidator;
    youPhoneTextControllerValidator = _youPhoneTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    secondNameFocusNode?.dispose();
    secondNameTextController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    middleNameFocusNode?.dispose();
    middleNameTextController?.dispose();

    youPhoneFocusNode?.dispose();
    youPhoneTextController?.dispose();
  }
}
