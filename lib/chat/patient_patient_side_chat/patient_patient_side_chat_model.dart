import '/chat/patient_chat_patient_side_com/patient_chat_patient_side_com_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'patient_patient_side_chat_widget.dart'
    show PatientPatientSideChatWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PatientPatientSideChatModel
    extends FlutterFlowModel<PatientPatientSideChatWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for patient_Chat_PatientSide_Com component.
  late PatientChatPatientSideComModel patientChatPatientSideComModel;

  @override
  void initState(BuildContext context) {
    patientChatPatientSideComModel =
        createModel(context, () => PatientChatPatientSideComModel());
  }

  @override
  void dispose() {
    patientChatPatientSideComModel.dispose();
  }
}
