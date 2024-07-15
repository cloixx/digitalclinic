import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/forms/patient_data_info/patient_data_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pat_patient_info_model.dart';
export 'pat_patient_info_model.dart';

class PatPatientInfoWidget extends StatefulWidget {
  const PatPatientInfoWidget({
    super.key,
    this.patientID,
  });

  final String? patientID;

  @override
  State<PatPatientInfoWidget> createState() => _PatPatientInfoWidgetState();
}

class _PatPatientInfoWidgetState extends State<PatPatientInfoWidget> {
  late PatPatientInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatPatientInfoModel());

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
            title: Stack(
              alignment: AlignmentDirectional(-1.0, 0.0),
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 50.0,
                      borderWidth: 0.0,
                      buttonSize: 50.0,
                      hoverColor: FlutterFlowTheme.of(context).accent3,
                      hoverIconColor: FlutterFlowTheme.of(context).accent1,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).info,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 20.0, 0.0),
                    child: Text(
                      'Мої дані',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Rubik',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.patientDataInfoModel,
                    updateCallback: () => setState(() {}),
                    child: PatientDataInfoWidget(
                      patientID: widget!.patientID!,
                      setEditable: () async {},
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
