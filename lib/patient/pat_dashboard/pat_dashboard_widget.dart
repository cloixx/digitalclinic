import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/forms/admission_data_info/admission_data_info_widget.dart';
import '/forms/patient_data_info/patient_data_info_widget.dart';
import '/patient/menus/pat_drawer/pat_drawer_widget.dart';
import '/patient/menus/pat_menu/pat_menu_widget.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'pat_dashboard_model.dart';
export 'pat_dashboard_model.dart';

class PatDashboardWidget extends StatefulWidget {
  const PatDashboardWidget({super.key});

  @override
  State<PatDashboardWidget> createState() => _PatDashboardWidgetState();
}

class _PatDashboardWidgetState extends State<PatDashboardWidget>
    with TickerProviderStateMixin {
  late PatDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatDashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().idsList = [];
      setState(() {});
      _model.userDataRows = await PatientsTable().queryRows(
        queryFn: (q) => q.eq(
          'user_profile_ID',
          currentUserUid,
        ),
      );
      _model.admissionRows = await AdmissionsTable().queryRows(
        queryFn: (q) => q
            .eq(
              'patientID',
              _model.userDataRows?.first?.id,
            )
            .eq(
              'isClosed',
              false,
            )
            .order('admitDate'),
      );
      _model.departnentCurrentInfo = await DDepartmentsTable().queryRows(
        queryFn: (q) => q.eq(
          'id',
          valueOrDefault<int>(
            _model.admissionRows?.first?.departmentCurrent,
            0,
          ),
        ),
      );
      FFAppState().idsList = _model.userDataRows!
          .map((e) => e.userProfileID)
          .withoutNulls
          .toList()
          .toList()
          .cast<String>();
      FFAppState().departmentCurrent = valueOrDefault<int>(
        _model.admissionRows?.first?.departmentCurrent,
        0,
      );
      FFAppState().departmentCurrentName =
          _model.departnentCurrentInfo!.first.name!;
      setState(() {});
      _model.admissionRow = _model.admissionRows?.first;
      setState(() {});
      if (FFAppState().idsList.contains(currentUserUid)) {
        _model.messages = await ChatMessagesViewTable().queryRows(
          queryFn: (q) => q
              .eq(
                'patient_id',
                _model.userDataRows?.first?.id,
              )
              .in_(
                'doctor_id',
                _model.admissionRow!.doctorsInChat,
              )
              .in_(
                'created_by',
                _model.admissionRow!.doctorsInChat,
              )
              .eq(
                'is_viewed_by_opponent',
                false,
              ),
        );
        _model.numOfMessages = _model.messages?.length;
        setState(() {});
        await actions.unsubscribeRealtime(
          'chat_messages',
        );
        await actions.subscribeRealtimeFilter(
          'chat_messages',
          'patient_id',
          _model.userDataRows!.first.id,
          () async {
            _model.messages1 = await ChatMessagesViewTable().queryRows(
              queryFn: (q) => q
                  .eq(
                    'patient_id',
                    _model.userDataRows?.first?.id,
                  )
                  .in_(
                    'doctor_id',
                    _model.admissionRow!.doctorsInChat,
                  )
                  .in_(
                    'created_by',
                    _model.admissionRow!.doctorsInChat,
                  )
                  .eq(
                    'is_viewed_by_opponent',
                    false,
                  ),
            );
            _model.numOfMessages = valueOrDefault<int>(
              _model.messages1?.length,
              0,
            );
            setState(() {});
          },
        );
      } else {
        context.pushNamed('NoRolePage');
      }
    });

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.5,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            hz: 10,
            offset: Offset(1.0, 0.0),
            rotation: 0.14,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.13, 1.13),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1400.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.13, 1.13),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<PatientsRow>>(
      future: PatientsTable().querySingleRow(
        queryFn: (q) => q.eq(
          'user_profile_ID',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<PatientsRow> patDashboardPatientsRowList = snapshot.data!;

        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final patDashboardPatientsRow = patDashboardPatientsRowList.isNotEmpty
            ? patDashboardPatientsRowList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Container(
              width: () {
                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                  return (MediaQuery.sizeOf(context).width * 0.8);
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointMedium) {
                  return (MediaQuery.sizeOf(context).width * 0.8);
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointLarge) {
                  return (MediaQuery.sizeOf(context).width * 0.5);
                } else {
                  return (MediaQuery.sizeOf(context).width * 0.3);
                }
              }(),
              child: Drawer(
                elevation: 16.0,
                child: wrapWithModel(
                  model: _model.patDrawerModel,
                  updateCallback: () => setState(() {}),
                  child: PatDrawerWidget(
                    selectedPage: 2,
                    patientData: patDashboardPatientsRow!,
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.patMenuModel,
                          updateCallback: () => setState(() {}),
                          child: PatMenuWidget(
                            selectedPage: 2,
                            patientData: patDashboardPatientsRow!,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 7.0, 20.0, 0.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      desktop: false,
                                                    ))
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 40.0,
                                                        buttonSize: 52.0,
                                                        icon: Icon(
                                                          Icons.menu_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 40.0,
                                                        ),
                                                        onPressed: () async {
                                                          scaffoldKey
                                                              .currentState!
                                                              .openDrawer();
                                                        },
                                                      ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      desktop: false,
                                                    ))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Меню',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                ))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  7.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (FFAppState()
                                                                  .navOpen ==
                                                              true) {
                                                            // closeNav
                                                            FFAppState()
                                                                    .navOpen =
                                                                false;
                                                            setState(() {});
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                          } else {
                                                            // openNav
                                                            FFAppState()
                                                                .navOpen = true;
                                                            setState(() {});
                                                            if (animationsMap[
                                                                    'iconOnActionTriggerAnimation'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'iconOnActionTriggerAnimation']!
                                                                  .controller
                                                                  .reverse();
                                                            }
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .menu_open_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 36.0,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'iconOnActionTriggerAnimation']!,
                                                      ),
                                                    ),
                                                  ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  18.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                  'pat_Chat');
                                                            },
                                                            child: Container(
                                                              width: 36.0,
                                                              height: 28.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .message_outlined,
                                                                      color: _model.numOfMessages == 0
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .tertiary,
                                                                      size:
                                                                          26.0,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: valueOrDefault<int>(
                                                                                  _model.numOfMessages,
                                                                                  0,
                                                                                ) ==
                                                                                0
                                                                            ? FlutterFlowTheme.of(context).secondaryBackground
                                                                            : FlutterFlowTheme.of(context).primary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            _model.numOfMessages?.toString(),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: 'Rubik',
                                                                                color: valueOrDefault<int>(
                                                                                          _model.numOfMessages,
                                                                                          0,
                                                                                        ) ==
                                                                                        0
                                                                                    ? FlutterFlowTheme.of(context).secondaryText
                                                                                    : FlutterFlowTheme.of(context).white,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      4.0,
                                                                      14.0),
                                                          child: Text(
                                                            'info',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .info_outline_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 6.0, 20.0, 14.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Медична карта пацієнта',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Rubik',
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
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 20.0, 0.0),
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(60.0),
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 60.0,
                                            buttonSize: 60.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: FaIcon(
                                              FontAwesomeIcons.solidBell,
                                              color: _model.bellColor,
                                              size: _model.bellIconSize
                                                  ?.toDouble(),
                                            ),
                                            onPressed: () async {
                                              _model.soundPlayer1 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer1!.playing) {
                                                await _model.soundPlayer1!
                                                    .stop();
                                              }
                                              _model.soundPlayer1!
                                                  .setVolume(1.0);
                                              _model.soundPlayer1!
                                                  .setAsset(
                                                      'assets/audios/hero_decorative-celebration-01.wav')
                                                  .then((_) => _model
                                                      .soundPlayer1!
                                                      .play());

                                              _model.bellColor =
                                                  FlutterFlowTheme.of(context)
                                                      .secondary;
                                              setState(() {});
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation'] !=
                                                  null) {
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              _model.bellColor =
                                                  FlutterFlowTheme.of(context)
                                                      .error;
                                              setState(() {});
                                              _model.soundPlayer2 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer2!.playing) {
                                                await _model.soundPlayer2!
                                                    .stop();
                                              }
                                              _model.soundPlayer2!
                                                  .setVolume(1.0);
                                              _model.soundPlayer2!
                                                  .setAsset(
                                                      'assets/audios/hero_decorative-celebration-01.wav')
                                                  .then((_) => _model
                                                      .soundPlayer2!
                                                      .play());

                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation'] !=
                                                  null) {
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              _model.bellColor =
                                                  Color(4294967295);
                                              setState(() {});
                                              await LogPatientsCallsTable()
                                                  .insert({
                                                'patient_id':
                                                    patDashboardPatientsRow?.id,
                                                'department': _model
                                                    .admissionRows
                                                    ?.first
                                                    ?.departmentCurrent,
                                                'сhamberNumber': _model
                                                    .admissionRows
                                                    ?.first
                                                    ?.chamberNumber,
                                              });
                                            },
                                          ),
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'containerOnActionTriggerAnimation']!,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 6.0, 20.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: StickyHeader(
                                              overlapHeaders: false,
                                              header: Material(
                                                color: Colors.transparent,
                                                elevation: 0.1,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .otherBackground,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      topRight:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Мої дані',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Stack(
                                                        children: [
                                                          if (!_model
                                                              .isMyDataOn)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_drop_down,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 26.0,
                                                              ),
                                                            ),
                                                          if (_model.isMyDataOn)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_drop_up,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              content: Visibility(
                                                visible: _model.isMyDataOn,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .patientDataInfoModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            PatientDataInfoWidget(
                                                          patientID:
                                                              patDashboardPatientsRow!
                                                                  .id,
                                                          setEditable:
                                                              () async {},
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: StickyHeader(
                                              overlapHeaders: false,
                                              header: Material(
                                                color: Colors.transparent,
                                                elevation: 0.1,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .otherBackground,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      topRight:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Дані госпіталізації',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Stack(
                                                        children: [
                                                          if (!_model
                                                              .isAdmissionOn)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_drop_down,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 26.0,
                                                              ),
                                                            ),
                                                          if (_model
                                                              .isAdmissionOn)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_drop_up,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              content: Visibility(
                                                visible: _model.isAdmissionOn,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .admissionDataInfoModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            AdmissionDataInfoWidget(
                                                          admissionID: _model
                                                              .admissionRows!
                                                              .first
                                                              .hadmID,
                                                          setEditable:
                                                              () async {},
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
                                  ),
                                ),
                              ],
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
        );
      },
    );
  }
}
