import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/forms/new_admission_com_patient/new_admission_com_patient_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rec_new_admission_model.dart';
export 'rec_new_admission_model.dart';

class RecNewAdmissionWidget extends StatefulWidget {
  const RecNewAdmissionWidget({
    super.key,
    this.patientID,
  });

  final String? patientID;

  @override
  State<RecNewAdmissionWidget> createState() => _RecNewAdmissionWidgetState();
}

class _RecNewAdmissionWidgetState extends State<RecNewAdmissionWidget> {
  late RecNewAdmissionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecNewAdmissionModel());

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
                'Новий випадок',
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 50.0,
                    borderWidth: 0.0,
                    buttonSize: 50.0,
                    hoverColor: FlutterFlowTheme.of(context).accent3,
                    hoverIconColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.goNamed('rec_Dashboard');
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
                  wrapWithModel(
                    model: _model.newAdmissionComPatientModel,
                    updateCallback: () => setState(() {}),
                    child: NewAdmissionComPatientWidget(
                      patientID: widget!.patientID,
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
