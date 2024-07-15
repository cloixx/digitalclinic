import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_list_calls/empty_list_calls_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/doctor_calls_all_rec/doctor_calls_all_rec_widget.dart';
import '/pages/new_call_for_doctor/new_call_for_doctor_widget.dart';
import '/pages/patient_calls_nur_item/patient_calls_nur_item_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'patient_list_calls_nur_model.dart';
export 'patient_list_calls_nur_model.dart';

class PatientListCallsNurWidget extends StatefulWidget {
  const PatientListCallsNurWidget({
    super.key,
    required this.numOfCallsCallback,
    required this.nurDepartment,
  });

  final Future Function(int? numCalls)? numOfCallsCallback;
  final int? nurDepartment;

  @override
  State<PatientListCallsNurWidget> createState() =>
      _PatientListCallsNurWidgetState();
}

class _PatientListCallsNurWidgetState extends State<PatientListCallsNurWidget> {
  late PatientListCallsNurModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatientListCallsNurModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.calls = await PatientsCallsViewTable().queryRows(
        queryFn: (q) => q
            .eq(
              'is_completed',
              false,
            )
            .eq(
              'department',
              valueOrDefault<int>(
                widget!.nurDepartment,
                0,
              ),
            )
            .order('created_at'),
      );
      await widget.numOfCallsCallback?.call(
        _model.calls?.length,
      );
      await actions.unsubscribeRealtime(
        'log_patients_calls',
      );
      await actions.subscribeRealtimeDifferentCallsFilter(
        'log_patients_calls',
        'department',
        widget!.nurDepartment!.toString(),
        () async {
          setState(() => _model.requestCompleter1 = null);
          await _model.waitForRequestCompleted1();
          _model.calls11 = await PatientsCallsViewTable().queryRows(
            queryFn: (q) => q
                .eq(
                  'is_completed',
                  false,
                )
                .eq(
                  'department',
                  valueOrDefault<int>(
                    widget!.nurDepartment,
                    0,
                  ),
                )
                .order('created_at'),
          );
          await widget.numOfCallsCallback?.call(
            _model.calls11?.length,
          );
        },
        () async {
          setState(() => _model.requestCompleter1 = null);
          await _model.waitForRequestCompleted1();
          _model.calls22 = await PatientsCallsViewTable().queryRows(
            queryFn: (q) => q
                .eq(
                  'is_completed',
                  false,
                )
                .eq(
                  'department',
                  valueOrDefault<int>(
                    widget!.nurDepartment,
                    0,
                  ),
                )
                .order('created_at'),
          );
          await widget.numOfCallsCallback?.call(
            _model.calls22?.length,
          );
          _model.soundPlayer0 ??= AudioPlayer();
          if (_model.soundPlayer0!.playing) {
            await _model.soundPlayer0!.stop();
          }
          _model.soundPlayer0!.setVolume(1.0);
          _model.soundPlayer0!
              .setAsset('assets/audios/ringtone_minimal.wav')
              .then((_) => _model.soundPlayer0!.play());
        },
      );
      await actions.unsubscribeRealtime(
        'log_doctor_rec_calls',
      );
      await actions.subscribeRealtimeFilter(
        'log_doctor_rec_calls',
        'department',
        widget!.nurDepartment!.toString(),
        () async {
          setState(() => _model.requestCompleter2 = null);
          await _model.waitForRequestCompleted2();
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
          child: FutureBuilder<List<LogDoctorRecCallsRow>>(
            future: (_model.requestCompleter2 ??=
                    Completer<List<LogDoctorRecCallsRow>>()
                      ..complete(LogDoctorRecCallsTable().queryRows(
                        queryFn: (q) => q
                            .eq(
                              'department',
                              valueOrDefault<int>(
                                widget!.nurDepartment,
                                0,
                              ),
                            )
                            .order('created_at'),
                        limit: 20,
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
              List<LogDoctorRecCallsRow> doctorCallsLogDoctorRecCallsRowList =
                  snapshot.data!;

              return Container(
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
                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (doctorCallsLogDoctorRecCallsRowList.isNotEmpty)
                        Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 6.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          child: DoctorCallsAllRecWidget(
                                            department: widget!.nurDepartment!,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: DoctorCallsAllRecWidget(
                                            department: widget!.nurDepartment!,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.newCallForDoctorModel,
                                  updateCallback: () => setState(() {}),
                                  child: NewCallForDoctorWidget(
                                    callRow: doctorCallsLogDoctorRecCallsRowList
                                        .first,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: FutureBuilder<List<PatientsCallsViewRow>>(
            future: (_model.requestCompleter1 ??=
                    Completer<List<PatientsCallsViewRow>>()
                      ..complete(PatientsCallsViewTable().queryRows(
                        queryFn: (q) => q
                            .eq(
                              'department',
                              valueOrDefault<int>(
                                widget!.nurDepartment,
                                0,
                              ),
                            )
                            .order('created_at'),
                        limit: 200,
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
              List<PatientsCallsViewRow> patientCallsPatientsCallsViewRowList =
                  snapshot.data!;

              return Container(
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
                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 80.0,
                          ),
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData('Всі'),
                                            ChipData('Тільки нові')
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.choiceChipsValue =
                                                  val?.firstOrNull),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      letterSpacing: 0.0,
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            iconSize: 18.0,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 1.0, 8.0, 1.0),
                                            elevation: 2.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            iconSize: 18.0,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 1.0, 8.0, 1.0),
                                            elevation: 0.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            borderWidth: 0.5,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          chipSpacing: 16.0,
                                          rowSpacing: 12.0,
                                          multiselect: false,
                                          initialized:
                                              _model.choiceChipsValue != null,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                            ['Всі'],
                                          ),
                                          wrapped: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: (_model.checkedList.length ==
                                                0)
                                            ? null
                                            : () async {
                                                _model.counter = 0;
                                                setState(() {});
                                                while (
                                                    _model.checkedList.length >
                                                        _model.counter!) {
                                                  await LogPatientsCallsTable()
                                                      .update(
                                                    data: {
                                                      'is_completed': true,
                                                      'completed_at':
                                                          supaSerialize<
                                                                  DateTime>(
                                                              getCurrentTimestamp),
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'id',
                                                      _model.checkedList[
                                                          _model.counter!],
                                                    ),
                                                  );
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 300));
                                                  _model.counter =
                                                      _model.counter! + 1;
                                                  setState(() {});
                                                }
                                                _model.counter = 0;
                                                _model.checkedList = [];
                                                setState(() {});
                                              },
                                        text: 'Опрацьовано',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .otherBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                ))
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            ' ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 6.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final userDataCalls = (_model
                                                .choiceChipsValue ==
                                            'Тільки нові'
                                        ? patientCallsPatientsCallsViewRowList
                                            .where(
                                                (e) => e.isCompleted == false)
                                            .toList()
                                        : patientCallsPatientsCallsViewRowList)
                                    .toList()
                                    .take(50)
                                    .toList();
                                if (userDataCalls.isEmpty) {
                                  return EmptyListCallsWidget();
                                }

                                return RefreshIndicator(
                                  onRefresh: () async {
                                    setState(
                                        () => _model.requestCompleter1 = null);
                                    await _model.waitForRequestCompleted1();
                                  },
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: userDataCalls.length,
                                    itemBuilder: (context, userDataCallsIndex) {
                                      final userDataCallsItem =
                                          userDataCalls[userDataCallsIndex];
                                      return wrapWithModel(
                                        model: _model.patientCallsNurItemModels
                                            .getModel(
                                          userDataCallsIndex.toString(),
                                          userDataCallsIndex,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        child: PatientCallsNurItemWidget(
                                          key: Key(
                                            'Keyi46_${userDataCallsIndex.toString()}',
                                          ),
                                          userRow: userDataCallsItem,
                                          checkedListAdd: (id) async {
                                            _model.addToCheckedList(id!);
                                            setState(() {});
                                          },
                                          checkedListRem: (id) async {
                                            _model.removeFromCheckedList(id!);
                                            setState(() {});
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
