import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/my_profile_com/my_profile_com_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pat_drawer_model.dart';
export 'pat_drawer_model.dart';

class PatDrawerWidget extends StatefulWidget {
  const PatDrawerWidget({
    super.key,
    required this.selectedPage,
    required this.patientData,
  });

  final int? selectedPage;
  final PatientsRow? patientData;

  @override
  State<PatDrawerWidget> createState() => _PatDrawerWidgetState();
}

class _PatDrawerWidgetState extends State<PatDrawerWidget> {
  late PatDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatDrawerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.easeInOut,
                          width: FFAppState().navOpen == true ? 56.0 : 46.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).accent4,
                              width: 1.5,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                3.0, 3.0, 3.0, 3.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Logo.png',
                                fit: BoxFit.cover,
                                cacheWidth: 60,
                                cacheHeight: 60,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Святого Пантелеймона',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Rubik',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Text(
                          'Клінічна лікарня',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Rubik',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 42.0,
                      hoverColor: FlutterFlowTheme.of(context).accent3,
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 22.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              height: 40.0,
              thickness: 1.5,
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MouseRegion(
                                opaque: false,
                                cursor: SystemMouseCursors.click ??
                                    MouseCursor.defer,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('pat_Call');
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (_model.mouseRegionHovered1!) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else if (widget!.selectedPage == 1) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Icon(
                                              Icons.campaign,
                                              color: widget!.selectedPage == 1
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 26.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Виклик медсестри',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
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
                                onEnter: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered1 = true);
                                }),
                                onExit: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered1 = false);
                                }),
                              ),
                              MouseRegion(
                                opaque: false,
                                cursor: SystemMouseCursors.click ??
                                    MouseCursor.defer,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('pat_Dashboard');
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (_model.mouseRegionHovered2!) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else if (widget!.selectedPage == 2) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Icon(
                                              Icons.assignment_ind_outlined,
                                              color: widget!.selectedPage == 2
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 26.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Медична карта',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
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
                                onEnter: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered2 = true);
                                }),
                                onExit: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered2 = false);
                                }),
                              ),
                              MouseRegion(
                                opaque: false,
                                cursor: SystemMouseCursors.click ??
                                    MouseCursor.defer,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('pat_Examination');
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (_model.mouseRegionHovered3!) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else if (widget!.selectedPage == 3) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Icon(
                                              Icons.manage_search,
                                              color: widget!.selectedPage == 3
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 26.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Обстеження',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
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
                                onEnter: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered3 = true);
                                }),
                                onExit: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered3 = false);
                                }),
                              ),
                              MouseRegion(
                                opaque: false,
                                cursor: SystemMouseCursors.click ??
                                    MouseCursor.defer,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('pat_Prescriptions');
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (_model.mouseRegionHovered4!) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else if (widget!.selectedPage == 4) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Icon(
                                              Icons.assignment_outlined,
                                              color: widget!.selectedPage == 4
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 26.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Призначення',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
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
                                onEnter: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered4 = true);
                                }),
                                onExit: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered4 = false);
                                }),
                              ),
                              MouseRegion(
                                opaque: false,
                                cursor: SystemMouseCursors.click ??
                                    MouseCursor.defer,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('pat_Procedures');
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (_model.mouseRegionHovered5!) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else if (widget!.selectedPage == 5) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Icon(
                                              Icons.medication_outlined,
                                              color: widget!.selectedPage == 5
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 26.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Процедури та операції',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
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
                                onEnter: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered5 = true);
                                }),
                                onExit: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered5 = false);
                                }),
                              ),
                              MouseRegion(
                                opaque: false,
                                cursor: SystemMouseCursors.click ??
                                    MouseCursor.defer,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('pat_Chat');
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (_model.mouseRegionHovered6!) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else if (widget!.selectedPage == 6) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Icon(
                                              Icons.message_outlined,
                                              color: widget!.selectedPage == 6
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 26.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Чат з лікарем',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
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
                                onEnter: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered6 = true);
                                }),
                                onExit: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered6 = false);
                                }),
                              ),
                              MouseRegion(
                                opaque: false,
                                cursor: SystemMouseCursors.click ??
                                    MouseCursor.defer,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('pat_Diary');
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (_model.mouseRegionHovered7!) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else if (widget!.selectedPage == 7) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Icon(
                                              Icons.view_timeline_outlined,
                                              color: widget!.selectedPage == 7
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 26.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Щоденник пацієнта',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
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
                                onEnter: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered7 = true);
                                }),
                                onExit: ((event) async {
                                  setState(
                                      () => _model.mouseRegionHovered7 = false);
                                }),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Divider(
                            height: 40.0,
                            thickness: 1.5,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Builder(
                                builder: (context) => InkWell(
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
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.9,
                                              child: MyProfileComWidget(
                                                firstName:
                                                    valueOrDefault<String>(
                                                  widget!.patientData
                                                      ?.patientFirstName,
                                                  '_',
                                                ),
                                                lastName:
                                                    valueOrDefault<String>(
                                                  widget!.patientData
                                                      ?.patientLastName,
                                                  '_',
                                                ),
                                                middleName:
                                                    valueOrDefault<String>(
                                                  widget!.patientData
                                                      ?.patientMiddleName,
                                                  '_',
                                                ),
                                                email: valueOrDefault<String>(
                                                  widget!.patientData?.email,
                                                  'email',
                                                ),
                                                phone: valueOrDefault<String>(
                                                  widget!.patientData
                                                      ?.patientPhoneNumber,
                                                  '+38 ()',
                                                ),
                                                photoUrl:
                                                    valueOrDefault<String>(
                                                  widget!.patientData
                                                      ?.patientPhotoUrl,
                                                  'https://oglmkpwpiottypmzxnzu.supabase.co/storage/v1/object/sign/avatars/noPhoto.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL25vUGhvdG8ucG5nIiwiaWF0IjoxNzEyNTczNzE3LCJleHAiOjIzNDMyOTM3MTd9.l64qIP6u3XEMFbOYNNtOv4s-Yhqu75BgdA1N4l8ZYdE&t=2024-04-08T10%3A55%3A17.333Z',
                                                ),
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
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.5,
                                              child: MyProfileComWidget(
                                                firstName:
                                                    valueOrDefault<String>(
                                                  widget!.patientData
                                                      ?.patientFirstName,
                                                  '_',
                                                ),
                                                lastName:
                                                    valueOrDefault<String>(
                                                  widget!.patientData
                                                      ?.patientLastName,
                                                  '_',
                                                ),
                                                middleName:
                                                    valueOrDefault<String>(
                                                  widget!.patientData
                                                      ?.patientMiddleName,
                                                  '_',
                                                ),
                                                email: valueOrDefault<String>(
                                                  widget!.patientData?.email,
                                                  'email',
                                                ),
                                                phone: valueOrDefault<String>(
                                                  widget!.patientData
                                                      ?.patientPhoneNumber,
                                                  '+38 ()',
                                                ),
                                                photoUrl:
                                                    valueOrDefault<String>(
                                                  widget!.patientData
                                                      ?.patientPhotoUrl,
                                                  'https://oglmkpwpiottypmzxnzu.supabase.co/storage/v1/object/sign/avatars/noPhoto.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL25vUGhvdG8ucG5nIiwiaWF0IjoxNzEyNTczNzE3LCJleHAiOjIzNDMyOTM3MTd9.l64qIP6u3XEMFbOYNNtOv4s-Yhqu75BgdA1N4l8ZYdE&t=2024-04-08T10%3A55%3A17.333Z',
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 12.0, 0.0),
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.easeInOut,
                                          width: FFAppState().navOpen == true
                                              ? 50.0
                                              : 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                widget!.patientData
                                                    ?.patientPhotoUrl,
                                                'https://oglmkpwpiottypmzxnzu.supabase.co/storage/v1/object/sign/avatars/noPhoto.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL25vUGhvdG8ucG5nIiwiaWF0IjoxNzEyNTczNzE3LCJleHAiOjIzNDMyOTM3MTd9.l64qIP6u3XEMFbOYNNtOv4s-Yhqu75BgdA1N4l8ZYdE&t=2024-04-08T10%3A55%3A17.333Z',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            '${valueOrDefault<String>(
                                              widget!
                                                  .patientData?.patientLastName,
                                              '_',
                                            )} ${valueOrDefault<String>(
                                              widget!.patientData
                                                  ?.patientFirstName,
                                              '_',
                                            )} ${valueOrDefault<String>(
                                              widget!.patientData
                                                  ?.patientMiddleName,
                                              '_',
                                            )}',
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if ((FFAppState().userRolesList.length > 1) &&
                                  (FFAppState()
                                      .UserRolesListDataType
                                      .isNotEmpty))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue ??= FFAppState()
                                          .UserRolesListDataType
                                          .first
                                          .name,
                                    ),
                                    options: FFAppState()
                                        .UserRolesListDataType
                                        .map((e) => e.name)
                                        .toList(),
                                    onChanged: (val) async {
                                      setState(
                                          () => _model.dropDownValue = val);
                                      FFAppState().countRolesInList =
                                          FFAppState().userRolesList.length;
                                      setState(() {});
                                      FFAppState().removeFromUserRolesList(
                                          FFAppState()
                                              .UserRolesListDataType
                                              .where((e) =>
                                                  e.name ==
                                                  _model.dropDownValue)
                                              .toList()
                                              .first
                                              .id);
                                      setState(() {});
                                      FFAppState().insertAtIndexInUserRolesList(
                                          0,
                                          FFAppState()
                                              .UserRolesListDataType
                                              .where((e) =>
                                                  e.name ==
                                                  _model.dropDownValue)
                                              .toList()
                                              .first
                                              .id);
                                      setState(() {});
                                      if (FFAppState().countRolesInList ==
                                          FFAppState().userRolesList.length) {
                                        await UsersProfilesTable().update(
                                          data: {
                                            'roles': FFAppState().userRolesList,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            currentUserUid,
                                          ),
                                        );
                                      }
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed('WelcomePage');
                                    },
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'role',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).stroke,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .otherBackground,
                                    elevation: 2.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderWidth: 0.5,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              if ((FFAppState().userRolesList.length <= 1) &&
                                  (FFAppState()
                                      .UserRolesListDataType
                                      .isNotEmpty))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .otherBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 0.5,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          FFAppState()
                                              .UserRolesListDataType
                                              .first
                                              .name,
                                          'role',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Divider(
                            height: 40.0,
                            thickness: 1.5,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
    );
  }
}
