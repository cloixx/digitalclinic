import '/chat/patient_chat_doctor_side_com/patient_chat_doctor_side_com_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'patient_doctor_side_chat_model.dart';
export 'patient_doctor_side_chat_model.dart';

class PatientDoctorSideChatWidget extends StatefulWidget {
  const PatientDoctorSideChatWidget({
    super.key,
    this.opponentID,
    required this.userID,
    required this.opponentPhoto,
    required this.opponentFirstName,
    required this.opponentLastName,
    required this.opponentMiddleName,
  });

  final String? opponentID;
  final String? userID;
  final String? opponentPhoto;
  final String? opponentFirstName;
  final String? opponentLastName;
  final String? opponentMiddleName;

  @override
  State<PatientDoctorSideChatWidget> createState() =>
      _PatientDoctorSideChatWidgetState();
}

class _PatientDoctorSideChatWidgetState
    extends State<PatientDoctorSideChatWidget> {
  late PatientDoctorSideChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatientDoctorSideChatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 45.0,
                borderWidth: 1.0,
                buttonSize: 45.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 28.0,
                ),
                onPressed: () async {
                  context.pushNamed('doc_Patients');
                },
              ),
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: Container(
                  width: 36.0,
                  height: 36.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget!.opponentPhoto,
                      'https://oglmkpwpiottypmzxnzu.supabase.co/storage/v1/object/sign/avatars/noPhoto.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL25vUGhvdG8ucG5nIiwiaWF0IjoxNzEyNTczNzE3LCJleHAiOjIzNDMyOTM3MTd9.l64qIP6u3XEMFbOYNNtOv4s-Yhqu75BgdA1N4l8ZYdE&t=2024-04-08T10%3A55%3A17.333Z',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '${valueOrDefault<String>(
                    widget!.opponentLastName,
                    '_',
                  )} ${valueOrDefault<String>(
                    widget!.opponentFirstName,
                    '_',
                  )} ${valueOrDefault<String>(
                    widget!.opponentMiddleName,
                    '_',
                  )}',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Rubik',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 45.0,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  icon: Icon(
                    Icons.more_vert,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
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
          padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
          child: wrapWithModel(
            model: _model.patientChatDoctorSideComModel,
            updateCallback: () => setState(() {}),
            updateOnChange: true,
            child: PatientChatDoctorSideComWidget(
              opponenttID: widget!.opponentID!,
              userID: widget!.userID!,
            ),
          ),
        ),
      ),
    );
  }
}
