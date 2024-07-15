import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_item_model.dart';
export 'chat_item_model.dart';

class ChatItemWidget extends StatefulWidget {
  const ChatItemWidget({
    super.key,
    required this.opponentID,
    required this.userID,
  });

  final String? opponentID;
  final String? userID;

  @override
  State<ChatItemWidget> createState() => _ChatItemWidgetState();
}

class _ChatItemWidgetState extends State<ChatItemWidget> {
  late ChatItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.unsubscribeRealtime(
        'chat_messages',
      );
      await Future.delayed(const Duration(milliseconds: 200));
      await actions.subscribeRealtimeFilter(
        'chat_messages',
        'patient_id',
        widget!.userID!,
        () async {
          setState(() => _model.requestCompleter = null);
          await _model.waitForRequestCompleted();
        },
      );
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
    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: FutureBuilder<List<ChatMessagesViewRow>>(
        future:
            (_model.requestCompleter ??= Completer<List<ChatMessagesViewRow>>()
                  ..complete(ChatMessagesViewTable().queryRows(
                    queryFn: (q) => q
                        .eq(
                          'patient_id',
                          widget!.userID,
                        )
                        .eq(
                          'doctor_id',
                          widget!.opponentID,
                        )
                        .order('created_at'),
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
          List<ChatMessagesViewRow> mouseRegionChatMessagesViewRowList =
              snapshot.data!;

          return MouseRegion(
            opaque: false,
            cursor: SystemMouseCursors.click ?? MouseCursor.defer,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
              child: FutureBuilder<List<PDoctorsRow>>(
                future: PDoctorsTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'id',
                    widget!.opponentID,
                  ),
                ),
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
                  List<PDoctorsRow> containerPDoctorsRowList = snapshot.data!;

                  final containerPDoctorsRow =
                      containerPDoctorsRowList.isNotEmpty
                          ? containerPDoctorsRowList.first
                          : null;
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await ChatMessagesTable().update(
                        data: {
                          'is_viewed_by_opponent': true,
                        },
                        matchingRows: (rows) => rows
                            .eq(
                              'patient_id',
                              widget!.userID,
                            )
                            .eq(
                              'doctor_id',
                              widget!.opponentID,
                            )
                            .eq(
                              'created_by',
                              widget!.opponentID,
                            )
                            .eq(
                              'is_viewed_by_opponent',
                              false,
                            ),
                      );

                      context.pushNamed(
                        'patient_PatientSide_Chat',
                        queryParameters: {
                          'opponentID': serializeParam(
                            widget!.opponentID,
                            ParamType.String,
                          ),
                          'userID': serializeParam(
                            widget!.userID,
                            ParamType.String,
                          ),
                          'opponentPhoto': serializeParam(
                            containerPDoctorsRow?.photoUrl,
                            ParamType.String,
                          ),
                          'opponentFirstName': serializeParam(
                            containerPDoctorsRow?.firstName,
                            ParamType.String,
                          ),
                          'opponentLastName': serializeParam(
                            containerPDoctorsRow?.lastName,
                            ParamType.String,
                          ),
                          'opponentMiddleName': serializeParam(
                            containerPDoctorsRow?.middleName,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );

                      setState(() {});
                    },
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: _model.mouseRegionHovered!
                            ? FlutterFlowTheme.of(context).otherBackground
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.0,
                            color: Color(0xFFF1F4F8),
                            offset: Offset(
                              0.0,
                              1.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            18.0, 0.0, 18.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 12,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.easeOut,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          containerPDoctorsRow?.photoUrl,
                                          'https://oglmkpwpiottypmzxnzu.supabase.co/storage/v1/object/sign/avatars/noPhoto.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL25vUGhvdG8ucG5nIiwiaWF0IjoxNzEyNTczNzE3LCJleHAiOjIzNDMyOTM3MTd9.l64qIP6u3XEMFbOYNNtOv4s-Yhqu75BgdA1N4l8ZYdE&t=2024-04-08T10%3A55%3A17.333Z',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 12.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 12.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 20.0;
                                              } else {
                                                return 20.0;
                                              }
                                            }(),
                                            0.0,
                                          ),
                                          0.0,
                                          0.0,
                                          0.0),
                                      child: Container(
                                        height: 60.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${valueOrDefault<String>(
                                                containerPDoctorsRow?.lastName,
                                                '_',
                                              )} ${valueOrDefault<String>(
                                                containerPDoctorsRow?.firstName,
                                                '_',
                                              )} ${valueOrDefault<String>(
                                                containerPDoctorsRow
                                                    ?.middleName,
                                                '_',
                                              )}',
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 6.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    mouseRegionChatMessagesViewRowList
                                                        .first.message,
                                                    '..',
                                                  ),
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
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
                            Flexible(
                              flex: 4,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 100.0,
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Text(
                                            dateTimeFormat(
                                              'd MMM H:mm',
                                              mouseRegionChatMessagesViewRowList
                                                  .first.createdAt!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        if (valueOrDefault<int>(
                                              mouseRegionChatMessagesViewRowList
                                                  .where((e) =>
                                                      (e.createdBy ==
                                                          widget!.opponentID) &&
                                                      (e.isViewedByOpponent ==
                                                          false))
                                                  .toList()
                                                  .length,
                                              0,
                                            ) !=
                                            0)
                                          Container(
                                            width: 24.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  mouseRegionChatMessagesViewRowList
                                                      .where((e) =>
                                                          (e.createdBy ==
                                                              widget!
                                                                  .opponentID) &&
                                                          (e.isViewedByOpponent ==
                                                              false))
                                                      .toList()
                                                      .length
                                                      .toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            onEnter: ((event) async {
              setState(() => _model.mouseRegionHovered = true);
            }),
            onExit: ((event) async {
              setState(() => _model.mouseRegionHovered = false);
            }),
          );
        },
      ),
    );
  }
}
