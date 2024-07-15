import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/backend/schema/structs/index.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_page_model.dart';
export 'welcome_page_model.dart';

class WelcomePageWidget extends StatefulWidget {
  const WelcomePageWidget({super.key});

  @override
  State<WelcomePageWidget> createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget>
    with TickerProviderStateMixin {
  late WelcomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
      _model.departments = await DepartmentsAllToDatatypeCall.call();

      if ((_model.departments?.succeeded ?? true)) {
        FFAppState().departments = ((_model.departments?.jsonBody ?? '')
                .toList()
                .map<DepartmentsStruct?>(DepartmentsStruct.maybeFromMap)
                .toList() as Iterable<DepartmentsStruct?>)
            .withoutNulls
            .toList()
            .cast<DepartmentsStruct>();
        setState(() {});
      }
      _model.userRolesList = await GetUserRolesCall.call(
        id: currentUserUid,
      );

      if ((_model.userRolesList?.succeeded ?? true)) {
        FFAppState().userRolesList = GetUserRolesCall.rolesPath(
          (_model.userRolesList?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        if (FFAppState().userRolesList.isNotEmpty) {
          if (FFAppState().userRolesList.first == FFAppConstants.userIN) {
            context.pushNamed('NoRolePage');
          } else {
            _model.apiResultAllRoles = await RolesAllToDatatypeCall.call();

            if ((_model.apiResultAllRoles?.succeeded ?? true)) {
              FFAppState().counter = 0;
              FFAppState().AllRolesListDataType =
                  ((_model.apiResultAllRoles?.jsonBody ?? '')
                          .toList()
                          .map<RoleStruct?>(RoleStruct.maybeFromMap)
                          .toList() as Iterable<RoleStruct?>)
                      .withoutNulls
                      .toList()
                      .cast<RoleStruct>();
              FFAppState().UserRolesListDataType = [];
              while (FFAppState().userRolesList.length > FFAppState().counter) {
                FFAppState().addToUserRolesListDataType(FFAppState()
                    .AllRolesListDataType
                    .where((e) =>
                        e.id ==
                        FFAppState().userRolesList[FFAppState().counter])
                    .toList()
                    .first);
                FFAppState().counter = FFAppState().counter + 1;
                await Future.delayed(const Duration(milliseconds: 300));
              }
              if (FFAppState().userRolesList.first == FFAppConstants.admin) {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('adm_UsersAndRoles');
              } else if (FFAppState().userRolesList.first ==
                  FFAppConstants.patient) {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('pat_Dashboard');
              } else if (FFAppState().userRolesList.first ==
                  FFAppConstants.relative) {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('rel_Dashboard');
              } else if (FFAppState().userRolesList.first ==
                  FFAppConstants.doctor) {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('doc_Patients');
              } else if (FFAppState().userRolesList.first ==
                  FFAppConstants.nurse) {
                context.pushNamed('nur_Patients');
              } else if (FFAppState().userRolesList.first ==
                  FFAppConstants.receptionist) {
                context.pushNamed('rec_Dashboard');
              } else if (FFAppState().userRolesList.first ==
                  FFAppConstants.ceo) {
                context.pushNamed('ceo_Dashboard');
              } else if (FFAppState().userRolesList.first ==
                  FFAppConstants.medicalceo) {
                context.pushNamed('m_ceo_Dashboard');
              } else if (FFAppState().userRolesList.first ==
                  FFAppConstants.sanitar) {
                context.pushNamed('san_Dashboard');
              } else if (FFAppState().userRolesList.first ==
                  FFAppConstants.seniornurse) {
                context.pushNamed('s_nur_Dashboard');
              } else if (FFAppState().userRolesList.first ==
                  FFAppConstants.headofdepartment) {
                context.pushNamed('head_Dashboard');
              } else {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('NoRolePage');
              }
            }
          }
        }
      }
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 1360.0.ms,
            duration: 790.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 3500.0.ms,
            duration: 790.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/LogoP.png',
                            width: 26.0,
                            height: 26.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Wrap(
                          spacing: 0.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 0.0),
                              child: Text(
                                'Клінічна лікарня',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 14.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 14.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 15.0;
                                        } else {
                                          return 16.0;
                                        }
                                      }(),
                                      letterSpacing: 0.3,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Text(
                              'Святого Пантелеймона',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 14.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 14.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 15.0;
                                      } else {
                                        return 16.0;
                                      }
                                    }(),
                                    letterSpacing: 0.3,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 0.0),
                      child: Text(
                        'Електронна система супроводу пацієнта',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Rubik',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation']!),
                    ),
                    Container(
                      width: 130.0,
                      height: 130.0,
                      child: RiveAnimation.asset(
                        'assets/rive_animations/loading_concluido_vega.riv',
                        artboard: 'New Artboard',
                        fit: BoxFit.cover,
                        controllers: _model.riveAnimationControllers,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 80.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth(
                              'OnboardingPage', context.mounted);
                        },
                        text: 'Вийти з додатку',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Rubik',
                                    color: FlutterFlowTheme.of(context)
                                        .otherBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['buttonOnPageLoadAnimation']!),
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
