import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/forms/admission_data_edit/admission_data_edit_widget.dart';
import '/forms/admission_data_info/admission_data_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rec_admission_edit_data_model.dart';
export 'rec_admission_edit_data_model.dart';

class RecAdmissionEditDataWidget extends StatefulWidget {
  const RecAdmissionEditDataWidget({
    super.key,
    required this.admissionID,
  });

  final String? admissionID;

  @override
  State<RecAdmissionEditDataWidget> createState() =>
      _RecAdmissionEditDataWidgetState();
}

class _RecAdmissionEditDataWidgetState
    extends State<RecAdmissionEditDataWidget> {
  late RecAdmissionEditDataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecAdmissionEditDataModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: Text(
                'Випадок - дані при госпіталізації',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Rubik',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            actions: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: 50.0,
                    borderWidth: 0.0,
                    buttonSize: 50.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    hoverColor: FlutterFlowTheme.of(context).accent3,
                    hoverIconColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed('rec_Dashboard');
                    },
                  ),
                ),
              ),
            ],
            centerTitle: false,
            toolbarHeight: 65.0,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!_model.isEditable)
                    wrapWithModel(
                      model: _model.admissionDataInfoModel,
                      updateCallback: () => setState(() {}),
                      child: AdmissionDataInfoWidget(
                        admissionID: widget!.admissionID!,
                        setEditable: () async {
                          _model.isEditable = true;
                          setState(() {});
                        },
                      ),
                    ),
                  if (_model.isEditable)
                    wrapWithModel(
                      model: _model.admissionDataEditModel,
                      updateCallback: () => setState(() {}),
                      child: AdmissionDataEditWidget(
                        admissionID: widget!.admissionID!,
                        setNotEditable: () async {
                          _model.isEditable = false;
                          setState(() {});
                        },
                        reloadPage: () async {
                          context.pushNamed(
                            'rec_Admission-EditData',
                            queryParameters: {
                              'admissionID': serializeParam(
                                widget!.admissionID,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
