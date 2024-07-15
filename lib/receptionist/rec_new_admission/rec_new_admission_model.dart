import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/forms/new_admission_com_patient/new_admission_com_patient_widget.dart';
import 'rec_new_admission_widget.dart' show RecNewAdmissionWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecNewAdmissionModel extends FlutterFlowModel<RecNewAdmissionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for newAdmissionComPatient component.
  late NewAdmissionComPatientModel newAdmissionComPatientModel;

  @override
  void initState(BuildContext context) {
    newAdmissionComPatientModel =
        createModel(context, () => NewAdmissionComPatientModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    newAdmissionComPatientModel.dispose();
  }
}
