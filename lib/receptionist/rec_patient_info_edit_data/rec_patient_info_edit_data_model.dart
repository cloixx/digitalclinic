import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/forms/patient_data_edit/patient_data_edit_widget.dart';
import '/forms/patient_data_info/patient_data_info_widget.dart';
import 'rec_patient_info_edit_data_widget.dart'
    show RecPatientInfoEditDataWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecPatientInfoEditDataModel
    extends FlutterFlowModel<RecPatientInfoEditDataWidget> {
  ///  Local state fields for this page.

  bool isEditable = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for patientDataInfo component.
  late PatientDataInfoModel patientDataInfoModel;
  // Model for patientDataEdit component.
  late PatientDataEditModel patientDataEditModel;

  @override
  void initState(BuildContext context) {
    patientDataInfoModel = createModel(context, () => PatientDataInfoModel());
    patientDataEditModel = createModel(context, () => PatientDataEditModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    patientDataInfoModel.dispose();
    patientDataEditModel.dispose();
  }
}
