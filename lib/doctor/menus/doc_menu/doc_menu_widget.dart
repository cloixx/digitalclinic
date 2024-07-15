import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/my_profile_com_nur_doc/my_profile_com_nur_doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'doc_menu_model.dart';
export 'doc_menu_model.dart';

class DocMenuWidget extends StatefulWidget {
  const DocMenuWidget({
    super.key,
    required this.selectedPage,
    required this.userProfile,
  });

  final int? selectedPage;
  final PDoctorsRow? userProfile;

  @override
  State<DocMenuWidget> createState() => _DocMenuWidgetState();
}

class _DocMenuWidgetState extends State<DocMenuWidget> {
  late DocMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocMenuModel());

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

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
        tabletLandscape: false,
      ),
      child: Container(
        width: FFAppState().navOpen == true ? 280.0 : 76.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                    if (FFAppState().navOpen == true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Святого Пантелеймона',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Rubik',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    if (FFAppState().navOpen == true)
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
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
                                      context.pushNamed('doc_Departments');
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
                                          } else if (widget!.selectedPage ==
                                              1) {
                                            return FlutterFlowTheme.of(context)
                                                .primaryBackground;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Icon(
                                                Icons.business_rounded,
                                                color: widget!.selectedPage == 1
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                size: 26.0,
                                              ),
                                            ),
                                            if (FFAppState().navOpen == true)
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Відділення ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                    setState(() =>
                                        _model.mouseRegionHovered1 = true);
                                  }),
                                  onExit: ((event) async {
                                    setState(() =>
                                        _model.mouseRegionHovered1 = false);
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
                                      context.pushNamed('doc_Patients');
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
                                          } else if (widget!.selectedPage ==
                                              2) {
                                            return FlutterFlowTheme.of(context)
                                                .primaryBackground;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Icon(
                                                Icons.perm_contact_cal_outlined,
                                                color: widget!.selectedPage == 2
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                size: 26.0,
                                              ),
                                            ),
                                            if (FFAppState().navOpen == true)
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Мої пацієнти',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                    setState(() =>
                                        _model.mouseRegionHovered2 = true);
                                  }),
                                  onExit: ((event) async {
                                    setState(() =>
                                        _model.mouseRegionHovered2 = false);
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
                                      context.pushNamed('doc_AI');
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
                                          } else if (widget!.selectedPage ==
                                              3) {
                                            return FlutterFlowTheme.of(context)
                                                .primaryBackground;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Icon(
                                                Icons
                                                    .health_and_safety_outlined,
                                                color: widget!.selectedPage == 3
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                size: 26.0,
                                              ),
                                            ),
                                            if (FFAppState().navOpen == true)
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'AI Doctor',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                    setState(() =>
                                        _model.mouseRegionHovered3 = true);
                                  }),
                                  onExit: ((event) async {
                                    setState(() =>
                                        _model.mouseRegionHovered3 = false);
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
                                      context.pushNamed('doc_ResearchSchedule');
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
                                          } else if (widget!.selectedPage ==
                                              4) {
                                            return FlutterFlowTheme.of(context)
                                                .primaryBackground;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Icon(
                                                Icons.manage_search,
                                                color: widget!.selectedPage == 4
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                size: 26.0,
                                              ),
                                            ),
                                            if (FFAppState().navOpen == true)
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Графік досліджень',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                    setState(() =>
                                        _model.mouseRegionHovered4 = true);
                                  }),
                                  onExit: ((event) async {
                                    setState(() =>
                                        _model.mouseRegionHovered4 = false);
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
                                      context
                                          .pushNamed('doc_SurgeriesSchedule');
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
                                          } else if (widget!.selectedPage ==
                                              5) {
                                            return FlutterFlowTheme.of(context)
                                                .primaryBackground;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Icon(
                                                Icons.medical_services_outlined,
                                                color: widget!.selectedPage == 5
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                size: 26.0,
                                              ),
                                            ),
                                            if (FFAppState().navOpen == true)
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Графік операцій',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                    setState(() =>
                                        _model.mouseRegionHovered5 = true);
                                  }),
                                  onExit: ((event) async {
                                    setState(() =>
                                        _model.mouseRegionHovered5 = false);
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
                                      context.pushNamed('doc_DutiesSchedule');
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
                                          } else if (widget!.selectedPage ==
                                              6) {
                                            return FlutterFlowTheme.of(context)
                                                .primaryBackground;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Icon(
                                                Icons.calendar_month_outlined,
                                                color: widget!.selectedPage == 6
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                size: 26.0,
                                              ),
                                            ),
                                            if (FFAppState().navOpen == true)
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Графік чергувань',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                    setState(() =>
                                        _model.mouseRegionHovered6 = true);
                                  }),
                                  onExit: ((event) async {
                                    setState(() =>
                                        _model.mouseRegionHovered6 = false);
                                  }),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Divider(
                              height: 40.0,
                              thickness: 1.5,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                                child: MyProfileComNurDocWidget(
                                                  firstName:
                                                      valueOrDefault<String>(
                                                    widget!
                                                        .userProfile?.firstName,
                                                    '_',
                                                  ),
                                                  lastName:
                                                      valueOrDefault<String>(
                                                    widget!
                                                        .userProfile?.lastName,
                                                    '_',
                                                  ),
                                                  middleName:
                                                      valueOrDefault<String>(
                                                    widget!.userProfile
                                                        ?.middleName,
                                                    '_',
                                                  ),
                                                  email: valueOrDefault<String>(
                                                    widget!.userProfile?.email,
                                                    '_',
                                                  ),
                                                  phone: valueOrDefault<String>(
                                                    widget!.userProfile
                                                        ?.phoneNumber,
                                                    '_',
                                                  ),
                                                  photoUrl: widget!
                                                      .userProfile!.photoUrl!,
                                                  department:
                                                      valueOrDefault<int>(
                                                    widget!.userProfile
                                                        ?.departmentId,
                                                    0,
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.5,
                                                child: MyProfileComNurDocWidget(
                                                  firstName:
                                                      valueOrDefault<String>(
                                                    widget!
                                                        .userProfile?.firstName,
                                                    '_',
                                                  ),
                                                  lastName:
                                                      valueOrDefault<String>(
                                                    widget!
                                                        .userProfile?.lastName,
                                                    '_',
                                                  ),
                                                  middleName:
                                                      valueOrDefault<String>(
                                                    widget!.userProfile
                                                        ?.middleName,
                                                    '_',
                                                  ),
                                                  email: valueOrDefault<String>(
                                                    widget!.userProfile?.email,
                                                    '_',
                                                  ),
                                                  phone: valueOrDefault<String>(
                                                    widget!.userProfile
                                                        ?.phoneNumber,
                                                    '_',
                                                  ),
                                                  photoUrl: widget!
                                                      .userProfile!.photoUrl!,
                                                  department:
                                                      valueOrDefault<int>(
                                                    widget!.userProfile
                                                        ?.departmentId,
                                                    0,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    FFAppState().navOpen
                                                        ? 10.0
                                                        : 0.0,
                                                    0.0,
                                                  ),
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    FFAppState().navOpen
                                                        ? 12.0
                                                        : 0.0,
                                                    0.0,
                                                  ),
                                                  0.0),
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.easeInOut,
                                            width: FFAppState().navOpen == true
                                                ? 50.0
                                                : 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                  widget!.userProfile?.photoUrl,
                                                  'https://oglmkpwpiottypmzxnzu.supabase.co/storage/v1/object/sign/avatars/noPhoto.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL25vUGhvdG8ucG5nIiwiaWF0IjoxNzEyNTczNzE3LCJleHAiOjIzNDMyOTM3MTd9.l64qIP6u3XEMFbOYNNtOv4s-Yhqu75BgdA1N4l8ZYdE&t=2024-04-08T10%3A55%3A17.333Z',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (FFAppState().navOpen == true)
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                '${valueOrDefault<String>(
                                                  widget!.userProfile?.lastName,
                                                  '_',
                                                )} ${valueOrDefault<String>(
                                                  widget!
                                                      .userProfile?.firstName,
                                                  '_',
                                                )} ${valueOrDefault<String>(
                                                  widget!
                                                      .userProfile?.middleName,
                                                  '_',
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                if ((FFAppState().navOpen == true) &&
                                    (FFAppState().userRolesList.length > 1) &&
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
                                        FFAppState()
                                            .insertAtIndexInUserRolesList(
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
                                              'roles':
                                                  FFAppState().userRolesList,
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
                                        .isNotEmpty) &&
                                    (FFAppState().navOpen == true))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .otherBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 0.5,
                                        ),
                                      ),
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
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
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
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
  }
}
