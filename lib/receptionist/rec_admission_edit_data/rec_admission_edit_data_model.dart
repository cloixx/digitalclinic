import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/forms/admission_data_edit/admission_data_edit_widget.dart';
import '/forms/admission_data_info/admission_data_info_widget.dart';
import 'rec_admission_edit_data_widget.dart' show RecAdmissionEditDataWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecAdmissionEditDataModel
    extends FlutterFlowModel<RecAdmissionEditDataWidget> {
  ///  Local state fields for this page.

  bool isEditable = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for admissionDataInfo component.
  late AdmissionDataInfoModel admissionDataInfoModel;
  // Model for admissionDataEdit component.
  late AdmissionDataEditModel admissionDataEditModel;

  @override
  void initState(BuildContext context) {
    admissionDataInfoModel =
        createModel(context, () => AdmissionDataInfoModel());
    admissionDataEditModel =
        createModel(context, () => AdmissionDataEditModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    admissionDataInfoModel.dispose();
    admissionDataEditModel.dispose();
  }
}
