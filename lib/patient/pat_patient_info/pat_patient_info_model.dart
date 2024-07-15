import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/forms/patient_data_info/patient_data_info_widget.dart';
import 'pat_patient_info_widget.dart' show PatPatientInfoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PatPatientInfoModel extends FlutterFlowModel<PatPatientInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for patientDataInfo component.
  late PatientDataInfoModel patientDataInfoModel;

  @override
  void initState(BuildContext context) {
    patientDataInfoModel = createModel(context, () => PatientDataInfoModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    patientDataInfoModel.dispose();
  }
}
