import '/chat/patient_chat_doctor_side_com/patient_chat_doctor_side_com_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'patient_doctor_side_chat_widget.dart' show PatientDoctorSideChatWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PatientDoctorSideChatModel
    extends FlutterFlowModel<PatientDoctorSideChatWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for patient_Chat_DoctorSide_Com component.
  late PatientChatDoctorSideComModel patientChatDoctorSideComModel;

  @override
  void initState(BuildContext context) {
    patientChatDoctorSideComModel =
        createModel(context, () => PatientChatDoctorSideComModel());
  }

  @override
  void dispose() {
    patientChatDoctorSideComModel.dispose();
  }
}
