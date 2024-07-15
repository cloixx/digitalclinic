import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admission_data_info_widget.dart' show AdmissionDataInfoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AdmissionDataInfoModel extends FlutterFlowModel<AdmissionDataInfoWidget> {
  ///  Local state fields for this component.

  bool isIncapacityCertificateNeed = false;

  bool isHospAgain = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in admissionDataInfo widget.
  List<AdmissionsRow>? admissionDataRowsByAction;
  // State field(s) for req widget.
  FocusNode? reqFocusNode;
  TextEditingController? reqTextController;
  final reqMask = MaskTextInputFormatter(mask: '####-####-####-####');
  String? Function(BuildContext, String?)? reqTextControllerValidator;
  // State field(s) for facilityCode widget.
  FocusNode? facilityCodeFocusNode1;
  TextEditingController? facilityCodeTextController1;
  String? Function(BuildContext, String?)? facilityCodeTextController1Validator;
  // State field(s) for facility widget.
  FocusNode? facilityFocusNode;
  TextEditingController? facilityTextController;
  String? Function(BuildContext, String?)? facilityTextControllerValidator;
  // State field(s) for facilityCode widget.
  FocusNode? facilityCodeFocusNode2;
  TextEditingController? facilityCodeTextController2;
  String? Function(BuildContext, String?)? facilityCodeTextController2Validator;
  // State field(s) for diagnosis widget.
  FocusNode? diagnosisFocusNode;
  TextEditingController? diagnosisTextController;
  String? Function(BuildContext, String?)? diagnosisTextControllerValidator;
  // State field(s) for diagnosisCode widget.
  FocusNode? diagnosisCodeFocusNode;
  TextEditingController? diagnosisCodeTextController;
  String? Function(BuildContext, String?)? diagnosisCodeTextControllerValidator;
  // State field(s) for departmentIn widget.
  FocusNode? departmentInFocusNode;
  TextEditingController? departmentInTextController;
  String? Function(BuildContext, String?)? departmentInTextControllerValidator;
  // State field(s) for departmentInCode widget.
  FocusNode? departmentInCodeFocusNode;
  TextEditingController? departmentInCodeTextController;
  String? Function(BuildContext, String?)?
      departmentInCodeTextControllerValidator;
  // State field(s) for departmentCurrent widget.
  FocusNode? departmentCurrentFocusNode;
  TextEditingController? departmentCurrentTextController;
  String? Function(BuildContext, String?)?
      departmentCurrentTextControllerValidator;
  // State field(s) for departmentCurrentCode widget.
  FocusNode? departmentCurrentCodeFocusNode;
  TextEditingController? departmentCurrentCodeTextController;
  String? Function(BuildContext, String?)?
      departmentCurrentCodeTextControllerValidator;
  // State field(s) for isHospFirstOrNot widget.
  FocusNode? isHospFirstOrNotFocusNode;
  TextEditingController? isHospFirstOrNotTextController;
  String? Function(BuildContext, String?)?
      isHospFirstOrNotTextControllerValidator;
  // State field(s) for isPlanOrUrgent widget.
  FocusNode? isPlanOrUrgentFocusNode;
  TextEditingController? isPlanOrUrgentTextController;
  String? Function(BuildContext, String?)?
      isPlanOrUrgentTextControllerValidator;
  // State field(s) for temperature widget.
  FocusNode? temperatureFocusNode;
  TextEditingController? temperatureTextController;
  String? Function(BuildContext, String?)? temperatureTextControllerValidator;
  // State field(s) for press widget.
  FocusNode? pressFocusNode;
  TextEditingController? pressTextController;
  String? Function(BuildContext, String?)? pressTextControllerValidator;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    reqFocusNode?.dispose();
    reqTextController?.dispose();

    facilityCodeFocusNode1?.dispose();
    facilityCodeTextController1?.dispose();

    facilityFocusNode?.dispose();
    facilityTextController?.dispose();

    facilityCodeFocusNode2?.dispose();
    facilityCodeTextController2?.dispose();

    diagnosisFocusNode?.dispose();
    diagnosisTextController?.dispose();

    diagnosisCodeFocusNode?.dispose();
    diagnosisCodeTextController?.dispose();

    departmentInFocusNode?.dispose();
    departmentInTextController?.dispose();

    departmentInCodeFocusNode?.dispose();
    departmentInCodeTextController?.dispose();

    departmentCurrentFocusNode?.dispose();
    departmentCurrentTextController?.dispose();

    departmentCurrentCodeFocusNode?.dispose();
    departmentCurrentCodeTextController?.dispose();

    isHospFirstOrNotFocusNode?.dispose();
    isHospFirstOrNotTextController?.dispose();

    isPlanOrUrgentFocusNode?.dispose();
    isPlanOrUrgentTextController?.dispose();

    temperatureFocusNode?.dispose();
    temperatureTextController?.dispose();

    pressFocusNode?.dispose();
    pressTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();
  }
}
