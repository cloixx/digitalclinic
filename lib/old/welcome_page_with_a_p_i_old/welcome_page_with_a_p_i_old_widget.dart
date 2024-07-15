import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_page_with_a_p_i_old_model.dart';
export 'welcome_page_with_a_p_i_old_model.dart';

class WelcomePageWithAPIOldWidget extends StatefulWidget {
  const WelcomePageWithAPIOldWidget({super.key});

  @override
  State<WelcomePageWithAPIOldWidget> createState() =>
      _WelcomePageWithAPIOldWidgetState();
}

class _WelcomePageWithAPIOldWidgetState
    extends State<WelcomePageWithAPIOldWidget> with TickerProviderStateMixin {
  late WelcomePageWithAPIOldModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomePageWithAPIOldModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
      await Future.wait([
        Future(() async {
          _model.userRolesList = await GetUserRolesCall.call(
            id: currentUserUid,
          );

          if ((_model.userRolesList?.succeeded ?? true)) {
            FFAppState().userRolesList = (getJsonField(
              (_model.userRolesList?.jsonBody ?? ''),
              r'''$[:].roles''',
              true,
            ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList()
                .cast<String>();
            setState(() {});
            if (!(FFAppState().userRolesList.isNotEmpty)) {
              context.pushNamed('SetUserName_Phone_old');
            } else {
              if (FFAppState().userRolesList.first == 'admin') {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('adm_Dashboard_old');
              } else if (FFAppState().userRolesList.first == 'patient') {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('pat_Dashboard');
              } else if (FFAppState().userRolesList.first == 'new') {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('pat_Dashboard');
              } else {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('NoRolePage');
              }
            }
          }
        }),
        Future(() async {
          _model.apiResultRoles = await RolesAllToDatatypeCall.call();

          if ((_model.apiResultRoles?.succeeded ?? true)) {
            FFAppState().AllRolesListDataType =
                ((_model.apiResultRoles?.jsonBody ?? '')
                        .toList()
                        .map<RoleStruct?>(RoleStruct.maybeFromMap)
                        .toList() as Iterable<RoleStruct?>)
                    .withoutNulls
                    .toList()
                    .cast<RoleStruct>();
            FFAppState().counter = 0;
            setState(() {});
            while (FFAppState().userRolesList.length > FFAppState().counter) {
              FFAppState().addToUserRolesListDataType(FFAppState()
                  .AllRolesListDataType
                  .where((e) =>
                      e.id == FFAppState().userRolesList[FFAppState().counter])
                  .toList()
                  .first);
              FFAppState().counter = FFAppState().counter + 1;
              setState(() {});
            }
          }
        }),
      ]);
    });

    animationsMap.addAll({
      'buttonOnPageLoadAnimation': AnimationInfo(
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
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 6.0, 24.0, 6.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 30.0, 6.0, 0.0),
                child: Text(
                  'Електронна система супроводу пацієнта',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 80.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('OnboardingPage', context.mounted);
                  },
                  text: 'Вийти з додатку',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Rubik',
                          color: FlutterFlowTheme.of(context).otherBackground,
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
      ),
    );
  }
}
