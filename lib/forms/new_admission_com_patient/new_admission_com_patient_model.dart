import '/alert_dialogs/call_doctor_q/call_doctor_q_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/algolia_searching/searching_diagnoses/searching_diagnoses_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'new_admission_com_patient_widget.dart'
    show NewAdmissionComPatientWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class NewAdmissionComPatientModel
    extends FlutterFlowModel<NewAdmissionComPatientWidget> {
  ///  Local state fields for this component.

  bool isIdentified = true;

  bool isInvalid = false;

  bool isHospAgain = false;

  bool isAlergyReactions = false;

  bool isHIV = false;

  bool isVasermanReactionResult = false;

  DateTime? hivDate;

  DateTime? vassermanDate;

  String? diagnosis;

  String? diagCode;

  int? department;

  bool isDoctorCalled = false;

  int? departmentCall;

  bool isIncapacityCertificateNeed = false;

  ///  State fields for stateful widgets in this component.

  final formKey14 = GlobalKey<FormState>();
  final formKey8 = GlobalKey<FormState>();
  final formKey11 = GlobalKey<FormState>();
  final formKey22 = GlobalKey<FormState>();
  final formKey25 = GlobalKey<FormState>();
  final formKey23 = GlobalKey<FormState>();
  final formKey17 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey18 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey20 = GlobalKey<FormState>();
  final formKey26 = GlobalKey<FormState>();
  final formKey21 = GlobalKey<FormState>();
  final formKey12 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey19 = GlobalKey<FormState>();
  final formKey7 = GlobalKey<FormState>();
  final formKey16 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey13 = GlobalKey<FormState>();
  final formKey9 = GlobalKey<FormState>();
  final formKey24 = GlobalKey<FormState>();
  final formKey10 = GlobalKey<FormState>();
  final formKey27 = GlobalKey<FormState>();
  final formKey15 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in newAdmissionComPatient widget.
  List<PatientsRow>? userDataRowsByAction;
  // State field(s) for req widget.
  FocusNode? reqFocusNode;
  TextEditingController? reqTextController;
  final reqMask = MaskTextInputFormatter(mask: '####-####-####-####');
  String? Function(BuildContext, String?)? reqTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for DropDowDepartmentCall widget.
  int? dropDowDepartmentCallValue;
  FormFieldController<int>? dropDowDepartmentCallValueController;
  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введіть прізвище';
    }

    return null;
  }

  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введіть ім\'я';
    }

    return null;
  }

  // State field(s) for MiddleName widget.
  FocusNode? middleNameFocusNode;
  TextEditingController? middleNameTextController;
  String? Function(BuildContext, String?)? middleNameTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for DropDownGender widget.
  String? dropDownGenderValue;
  FormFieldController<String>? dropDownGenderValueController;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  DateTime? datePicked1;
  // State field(s) for youPhone widget.
  FocusNode? youPhoneFocusNode;
  TextEditingController? youPhoneTextController;
  final youPhoneMask = MaskTextInputFormatter(mask: '+38 (###) ###-##-##');
  String? Function(BuildContext, String?)? youPhoneTextControllerValidator;
  // State field(s) for credentialDocumentType widget.
  FocusNode? credentialDocumentTypeFocusNode;
  TextEditingController? credentialDocumentTypeTextController;
  String? Function(BuildContext, String?)?
      credentialDocumentTypeTextControllerValidator;
  // State field(s) for credentialDocument widget.
  FocusNode? credentialDocumentFocusNode;
  TextEditingController? credentialDocumentTextController;
  String? Function(BuildContext, String?)?
      credentialDocumentTextControllerValidator;
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  String? _cityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Вкажіть назву населеного пункту...';
    }

    return null;
  }

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered4 = false;
  // State field(s) for DropDowCityOrVil widget.
  String? dropDowCityOrVilValue;
  FormFieldController<String>? dropDowCityOrVilValueController;
  // State field(s) for index widget.
  FocusNode? indexFocusNode;
  TextEditingController? indexTextController;
  final indexMask = MaskTextInputFormatter(mask: '#####');
  String? Function(BuildContext, String?)? indexTextControllerValidator;
  // State field(s) for oblast widget.
  FocusNode? oblastFocusNode;
  TextEditingController? oblastTextController;
  String? Function(BuildContext, String?)? oblastTextControllerValidator;
  // State field(s) for region widget.
  FocusNode? regionFocusNode;
  TextEditingController? regionTextController;
  String? Function(BuildContext, String?)? regionTextControllerValidator;
  // State field(s) for street widget.
  FocusNode? streetFocusNode;
  TextEditingController? streetTextController;
  String? Function(BuildContext, String?)? streetTextControllerValidator;
  // State field(s) for buildNum widget.
  FocusNode? buildNumFocusNode;
  TextEditingController? buildNumTextController;
  String? Function(BuildContext, String?)? buildNumTextControllerValidator;
  // State field(s) for flat widget.
  FocusNode? flatFocusNode;
  TextEditingController? flatTextController;
  String? Function(BuildContext, String?)? flatTextControllerValidator;
  // State field(s) for workPlace widget.
  FocusNode? workPlaceFocusNode;
  TextEditingController? workPlaceTextController;
  String? Function(BuildContext, String?)? workPlaceTextControllerValidator;
  // State field(s) for workPosition widget.
  FocusNode? workPositionFocusNode;
  TextEditingController? workPositionTextController;
  String? Function(BuildContext, String?)? workPositionTextControllerValidator;
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
  bool mouseRegionHovered5 = false;
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
  bool mouseRegionHovered6 = false;
  // State field(s) for DropDowHospFirstOrNot widget.
  bool? dropDowHospFirstOrNotValue;
  FormFieldController<bool>? dropDowHospFirstOrNotValueController;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered7 = false;
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
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  final heightMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  final weightMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered8 = false;
  // State field(s) for DropDownBloodGroup widget.
  String? dropDownBloodGroupValue;
  FormFieldController<String>? dropDownBloodGroupValueController;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered9 = false;
  // State field(s) for DropDownBloodRh widget.
  String? dropDownBloodRhValue;
  FormFieldController<String>? dropDownBloodRhValueController;
  // State field(s) for allergyReactions widget.
  FocusNode? allergyReactionsFocusNode;
  TextEditingController? allergyReactionsTextController;
  String? Function(BuildContext, String?)?
      allergyReactionsTextControllerValidator;
  String? _allergyReactionsTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Вкажіть назва засобу, характер дії';
    }

    return null;
  }

  // State field(s) for MRhiv widget.
  bool mRhivHovered = false;
  DateTime? datePicked2;
  // State field(s) for MRvas widget.
  bool mRvasHovered = false;
  DateTime? datePicked3;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered10 = false;
  // State field(s) for DropDownInvalid widget.
  String? dropDownInvalidValue;
  FormFieldController<String>? dropDownInvalidValueController;
  // State field(s) for invalidType widget.
  FocusNode? invalidTypeFocusNode;
  TextEditingController? invalidTypeTextController;
  String? Function(BuildContext, String?)? invalidTypeTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<PatientsRow>? updatedPatient;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  PatientsRow? newPatient;

  @override
  void initState(BuildContext context) {
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    cityTextControllerValidator = _cityTextControllerValidator;
    departmentCodeTextControllerValidator =
        _departmentCodeTextControllerValidator;
    allergyReactionsTextControllerValidator =
        _allergyReactionsTextControllerValidator;
  }

  @override
  void dispose() {
    reqFocusNode?.dispose();
    reqTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    middleNameFocusNode?.dispose();
    middleNameTextController?.dispose();

    youPhoneFocusNode?.dispose();
    youPhoneTextController?.dispose();

    credentialDocumentTypeFocusNode?.dispose();
    credentialDocumentTypeTextController?.dispose();

    credentialDocumentFocusNode?.dispose();
    credentialDocumentTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    indexFocusNode?.dispose();
    indexTextController?.dispose();

    oblastFocusNode?.dispose();
    oblastTextController?.dispose();

    regionFocusNode?.dispose();
    regionTextController?.dispose();

    streetFocusNode?.dispose();
    streetTextController?.dispose();

    buildNumFocusNode?.dispose();
    buildNumTextController?.dispose();

    flatFocusNode?.dispose();
    flatTextController?.dispose();

    workPlaceFocusNode?.dispose();
    workPlaceTextController?.dispose();

    workPositionFocusNode?.dispose();
    workPositionTextController?.dispose();

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

    heightFocusNode?.dispose();
    heightTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();

    allergyReactionsFocusNode?.dispose();
    allergyReactionsTextController?.dispose();

    invalidTypeFocusNode?.dispose();
    invalidTypeTextController?.dispose();
  }
}
