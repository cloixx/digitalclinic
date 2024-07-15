import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'patient_chat_patient_side_com_model.dart';
export 'patient_chat_patient_side_com_model.dart';

class PatientChatPatientSideComWidget extends StatefulWidget {
  const PatientChatPatientSideComWidget({
    super.key,
    required this.opponenttID,
    required this.userID,
  });

  final String? opponenttID;
  final String? userID;

  @override
  State<PatientChatPatientSideComWidget> createState() =>
      _PatientChatPatientSideComWidgetState();
}

class _PatientChatPatientSideComWidgetState
    extends State<PatientChatPatientSideComWidget>
    with TickerProviderStateMixin {
  late PatientChatPatientSideComModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatientChatPatientSideComModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.unsubscribeRealtime(
        'chat_messages',
      );
      await Future.delayed(const Duration(milliseconds: 500));
      await actions.subscribeRealtimeFilter(
        'chat_messages',
        'patient_id',
        widget!.userID!,
        () async {
          setState(() => _model.requestCompleter = null);
          await _model.waitForRequestCompleted();
          unawaited(
            () async {
              await _model.chatListView?.animateTo(
                0,
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              );
            }(),
          );
        },
      );
      unawaited(
        () async {
          await _model.chatListView?.animateTo(
            0,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        }(),
      );
    });

    _model.promptTextFieldTextController ??= TextEditingController();
    _model.promptTextFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: Offset(8.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      controller: _model.chatColumn,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
              child: FutureBuilder<List<ChatMessagesViewRow>>(
                future: (_model.requestCompleter ??=
                        Completer<List<ChatMessagesViewRow>>()
                          ..complete(ChatMessagesViewTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'patient_id',
                                  widget!.userID,
                                )
                                .eq(
                                  'doctor_id',
                                  widget!.opponenttID,
                                )
                                .order('created_at'),
                            limit: 50,
                          )))
                    .future,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<ChatMessagesViewRow>
                      chatContainerChatMessagesViewRowList = snapshot.data!;

                  return Container(
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Builder(
                      builder: (context) {
                        final chat =
                            chatContainerChatMessagesViewRowList.toList();

                        return ListView.builder(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            6.0,
                            0,
                            12.0,
                          ),
                          reverse: true,
                          scrollDirection: Axis.vertical,
                          itemCount: chat.length,
                          itemBuilder: (context, chatIndex) {
                            final chatItem = chat[chatIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (chatItem.createdBy == widget!.opponenttID)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 6.0, 0.0),
                                        child: Container(
                                          width: 36.0,
                                          height: 36.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              chatItem.photoUrl,
                                              'https://oglmkpwpiottypmzxnzu.supabase.co/storage/v1/object/sign/avatars/noPhoto.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL25vUGhvdG8ucG5nIiwiaWF0IjoxNzEyNTczNzE3LCJleHAiOjIzNDMyOTM3MTd9.l64qIP6u3XEMFbOYNNtOv4s-Yhqu75BgdA1N4l8ZYdE&t=2024-04-08T10%3A55%3A17.333Z',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(
                                                maxWidth: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width >=
                                                      1170.0) {
                                                    return 800.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <=
                                                      470.0) {
                                                    return 260.0;
                                                  } else {
                                                    return 530.0;
                                                  }
                                                }(),
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12.0),
                                                  bottomRight:
                                                      Radius.circular(12.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(12.0),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0x25007BBF),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12.0),
                                                    bottomRight:
                                                        Radius.circular(12.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(12.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 8.0, 10.0, 8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SelectionArea(
                                                          child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          chatItem.message,
                                                          'message',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: () {
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width >=
                                                        1170.0) {
                                                      return 800.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <=
                                                        470.0) {
                                                      return 260.0;
                                                    } else {
                                                      return 530.0;
                                                    }
                                                  }(),
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 2.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (false)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .clock,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 11.0,
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                            'd MMMM H:mm',
                                                            chatItem.createdAt!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                if (chatItem.createdBy == widget!.userID)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(
                                                maxWidth: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width >=
                                                      1170.0) {
                                                    return 800.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <=
                                                      470.0) {
                                                    return 260.0;
                                                  } else {
                                                    return 530.0;
                                                  }
                                                }(),
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12.0),
                                                  bottomRight:
                                                      Radius.circular(12.0),
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0x27FF715B),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12.0),
                                                    bottomRight:
                                                        Radius.circular(12.0),
                                                    topLeft:
                                                        Radius.circular(12.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          chatItem.message,
                                                          'message',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: () {
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width >=
                                                        1170.0) {
                                                      return 800.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <=
                                                        470.0) {
                                                      return 260.0;
                                                    } else {
                                                      return 530.0;
                                                    }
                                                  }(),
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 10.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      if (false)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .clock,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 11.0,
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                            'd MMMM H:mm',
                                                            chatItem.createdAt!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (false)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 36.0,
                                            height: 36.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              'https://picsum.photos/seed/712/600',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                              ],
                            );
                          },
                          controller: _model.chatListView,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    color: FlutterFlowTheme.of(context).shadow,
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                child: Stack(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  children: [
                    TextFormField(
                      controller: _model.promptTextFieldTextController,
                      focusNode: _model.promptTextFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.promptTextFieldTextController',
                        Duration(milliseconds: 50),
                        () => setState(() {}),
                      ),
                      autofocus: false,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.send,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: false,
                        hintText: 'Повідомлення...',
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        errorStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).error,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 70.0, 10.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Roboto',
                            letterSpacing: 0.0,
                          ),
                      maxLines: null,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator: _model.promptTextFieldTextControllerValidator
                          .asValidator(context),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 0.0,
                        buttonSize: 50.0,
                        disabledIconColor: FlutterFlowTheme.of(context).accent2,
                        icon: Icon(
                          Icons.send_rounded,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 30.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: (_model.promptTextFieldTextController.text ==
                                    null ||
                                _model.promptTextFieldTextController.text == '')
                            ? null
                            : () async {
                                await ChatMessagesTable().insert({
                                  'patient_id': widget!.userID,
                                  'doctor_id': widget!.opponenttID,
                                  'message':
                                      _model.promptTextFieldTextController.text,
                                  'created_by': widget!.userID,
                                });
                                setState(() {
                                  _model.promptTextFieldTextController?.clear();
                                });
                                await Future.delayed(
                                    const Duration(milliseconds: 600));
                                unawaited(
                                  () async {
                                    await _model.chatListView?.animateTo(
                                      0,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.ease,
                                    );
                                  }(),
                                );
                              },
                      ).animateOnPageLoad(
                          animationsMap['iconButtonOnPageLoadAnimation']!),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
