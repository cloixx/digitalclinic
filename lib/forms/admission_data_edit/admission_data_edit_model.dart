import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/algolia_searching/searching_diagnoses/searching_diagnoses_widget.dart';
import 'admission_data_edit_widget.dart' show AdmissionDataEditWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AdmissionDataEditModel extends FlutterFlowModel<AdmissionDataEditWidget> {
  ///  Local state fields for this component.

  bool isIncapacityCertificateNeed = false;

  bool isHospAgain = false;

  String? diagnosis;

  String? diagCode;

  int? department;

  ///  State fields for stateful widgets in this component.

  final formKey5 = GlobalKey<FormState>();
  final formKey8 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey7 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in admissionDataEdit widget.
  List<AdmissionsRow>? admissionDataRowsByAction;
  // State field(s) for req widget.
  FocusNode? reqFocusNode;
  TextEditingController? reqTextController;
  final reqMask = MaskTextInputFormatter(mask: '####-####-####-####');
  String? Function(BuildContext, String?)? reqTextControllerValidator;
  // State field(s) for facility widget.
  FocusNode? facilityFocusNode;
  TextEditingController? facilityTextController;
  String? Function(BuildContext, String?)? facilityTextControllerValidator;
  // State field(s) for facilityCode widget.
  FocusNode? facilityCodeFocusNode;
  TextEditingController? facilityCodeTextController;
  String? Function(BuildContext, String?)? facilityCodeTextControllerValidator;
  // State field(s) for MRvasd widget.
  bool mRvasdHovered = false;
  // State field(s) for dia widget.
  bool diaHovered = false;
  // State field(s) for diagnosisCode widget.
  FocusNode? diagnosisCodeFocusNode;
  TextEditingController? diagnosisCodeTextController;
  String? Function(BuildContext, String?)? diagnosisCodeTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for DropDowDepartment widget.
  int? dropDowDepartmentValue;
  FormFieldController<int>? dropDowDepartmentValueController;
  // State field(s) for departmentCode widget.
  FocusNode? departmentCodeFocusNode;
  TextEditingController? departmentCodeTextController;
  String? Function(BuildContext, String?)?
      departmentCodeTextControllerValidator;
  String? _departmentCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Вкажіть відділення при госпіталізації';
    }

    return null;
  }

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for DropDowHospFirstOrNot widget.
  bool? dropDowHospFirstOrNotValue;
  FormFieldController<bool>? dropDowHospFirstOrNotValueController;
  // State field(s) for Mo widget.
  bool moHovered = false;
  // State field(s) for DropDowPlanOrUrgent widget.
  bool? dropDowPlanOrUrgentValue;
  FormFieldController<bool>? dropDowPlanOrUrgentValueController;
  // State field(s) for temperature widget.
  FocusNode? temperatureFocusNode;
  TextEditingController? temperatureTextController;
  final temperatureMask = MaskTextInputFormatter(mask: '##.#');
  String? Function(BuildContext, String?)? temperatureTextControllerValidator;
  // State field(s) for press widget.
  FocusNode? pressFocusNode;
  TextEditingController? pressTextController;
  final pressMask = MaskTextInputFormatter(mask: '###/###');
  String? Function(BuildContext, String?)? pressTextControllerValidator;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  final weightMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? weightTextControllerValidator;

  @override
  void initState(BuildContext context) {
    departmentCodeTextControllerValidator =
        _departmentCodeTextControllerValidator;
  }

  @override
  void dispose() {
    reqFocusNode?.dispose();
    reqTextController?.dispose();

    facilityFocusNode?.dispose();
    facilityTextController?.dispose();

    facilityCodeFocusNode?.dispose();
    facilityCodeTextController?.dispose();

    diagnosisCodeFocusNode?.dispose();
    diagnosisCodeTextController?.dispose();

    departmentCodeFocusNode?.dispose();
    departmentCodeTextController?.dispose();

    temperatureFocusNode?.dispose();
    temperatureTextController?.dispose();

    pressFocusNode?.dispose();
    pressTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();
  }
}
