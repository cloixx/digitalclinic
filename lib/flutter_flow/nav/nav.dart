import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? WelcomePageWidget()
          : OnboardingPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? WelcomePageWidget()
              : OnboardingPageWidget(),
          routes: [
            FFRoute(
              name: 'OnboardingPage',
              path: 'OnboardingPage',
              builder: (context, params) => OnboardingPageWidget(),
            ),
            FFRoute(
              name: 'adm_Dashboard_old',
              path: 'admDashboardOld',
              requireAuth: true,
              builder: (context, params) => AdmDashboardOldWidget(),
            ),
            FFRoute(
              name: 'HomePageLoggedPhoneNoRole',
              path: 'homePageLoggedPhoneNoRole',
              requireAuth: true,
              builder: (context, params) => HomePageLoggedPhoneNoRoleWidget(),
            ),
            FFRoute(
              name: 'HomePageHR-1',
              path: 'homePageHR1',
              builder: (context, params) => HomePageHR1Widget(),
            ),
            FFRoute(
              name: 'HomePageHR-2',
              path: 'homePageHR2',
              builder: (context, params) => HomePageHR2Widget(),
            ),
            FFRoute(
              name: 'pat_Dashboard_old',
              path: 'patDashboardOld',
              requireAuth: true,
              builder: (context, params) => PatDashboardOldWidget(),
            ),
            FFRoute(
              name: 'pat_Activity',
              path: 'patActivity',
              builder: (context, params) => PatActivityWidget(),
            ),
            FFRoute(
              name: 'pat_Calendar',
              path: 'patCalendar',
              builder: (context, params) => PatCalendarWidget(),
            ),
            FFRoute(
              name: 'pat_Dashboard',
              path: 'patDashboard',
              requireAuth: true,
              builder: (context, params) => PatDashboardWidget(),
            ),
            FFRoute(
              name: 'SetUserName_Phone_old',
              path: 'SetUserName_Phone',
              requireAuth: true,
              builder: (context, params) => SetUserNamePhoneOldWidget(),
            ),
            FFRoute(
              name: 'WelcomePage_WithAPI_old',
              path: 'WelcomePage_WithAPI',
              requireAuth: true,
              builder: (context, params) => WelcomePageWithAPIOldWidget(),
            ),
            FFRoute(
              name: 'NoRolePage',
              path: 'NoRolePage',
              requireAuth: true,
              builder: (context, params) => NoRolePageWidget(),
            ),
            FFRoute(
              name: 'WelcomePage',
              path: 'WelcomePage',
              requireAuth: true,
              builder: (context, params) => WelcomePageWidget(),
            ),
            FFRoute(
              name: 'rel_Dashboard',
              path: 'relDashboard',
              requireAuth: true,
              builder: (context, params) => RelDashboardWidget(),
            ),
            FFRoute(
              name: 'doc_Departments',
              path: 'docDepartments',
              requireAuth: true,
              builder: (context, params) => DocDepartmentsWidget(),
            ),
            FFRoute(
              name: 'Polocies',
              path: 'Policies',
              requireAuth: true,
              builder: (context, params) => PolociesWidget(),
            ),
            FFRoute(
              name: 'nur_Departments',
              path: 'nurDepartments',
              requireAuth: true,
              builder: (context, params) => NurDepartmentsWidget(),
            ),
            FFRoute(
              name: 'ceo_Dashboard',
              path: 'ceoDashboard',
              requireAuth: true,
              builder: (context, params) => CeoDashboardWidget(),
            ),
            FFRoute(
              name: 'm_ceo_Dashboard',
              path: 'mCeoDashboard',
              requireAuth: true,
              builder: (context, params) => MCeoDashboardWidget(),
            ),
            FFRoute(
              name: 'san_Dashboard',
              path: 'sanDashboard',
              requireAuth: true,
              builder: (context, params) => SanDashboardWidget(),
            ),
            FFRoute(
              name: 'adm_UsersAndRoles',
              path: 'admUsersAndRoles',
              requireAuth: true,
              builder: (context, params) => AdmUsersAndRolesWidget(),
            ),
            FFRoute(
              name: 'rec_Dashboard',
              path: 'recDashboard',
              requireAuth: true,
              builder: (context, params) => RecDashboardWidget(),
            ),
            FFRoute(
              name: 's_nur_Dashboard',
              path: 'sNurDashboard',
              requireAuth: true,
              builder: (context, params) => SNurDashboardWidget(),
            ),
            FFRoute(
              name: 'head_Dashboard',
              path: 'headDashboard',
              requireAuth: true,
              builder: (context, params) => HeadDashboardWidget(),
            ),
            FFRoute(
              name: 'rec_NewAdmission',
              path: 'recNewAdmission',
              builder: (context, params) => RecNewAdmissionWidget(
                patientID: params.getParam(
                  'patientID',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'pat_Call',
              path: 'patCall',
              requireAuth: true,
              builder: (context, params) => PatCallWidget(),
            ),
            FFRoute(
              name: 'pat_Examination',
              path: 'patExamination',
              requireAuth: true,
              builder: (context, params) => PatExaminationWidget(),
            ),
            FFRoute(
              name: 'pat_Prescriptions',
              path: 'patPrescriptions',
              requireAuth: true,
              builder: (context, params) => PatPrescriptionsWidget(),
            ),
            FFRoute(
              name: 'pat_Procedures',
              path: 'patProcedures',
              requireAuth: true,
              builder: (context, params) => PatProceduresWidget(),
            ),
            FFRoute(
              name: 'pat_Diary',
              path: 'patDiary',
              requireAuth: true,
              builder: (context, params) => PatDiaryWidget(),
            ),
            FFRoute(
              name: 'rec_PatientInfo-EditData',
              path: 'recPatientInfoEditData',
              builder: (context, params) => RecPatientInfoEditDataWidget(
                patientID: params.getParam(
                  'patientID',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'pat_PatientInfo',
              path: 'patPatientInfo',
              builder: (context, params) => PatPatientInfoWidget(
                patientID: params.getParam(
                  'patientID',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'adm_Departments',
              path: 'admDepartments',
              requireAuth: true,
              builder: (context, params) => AdmDepartmentsWidget(),
            ),
            FFRoute(
              name: 'adm_Notifications',
              path: 'admNotifications',
              requireAuth: true,
              builder: (context, params) => AdmNotificationsWidget(),
            ),
            FFRoute(
              name: 'adm_Patients',
              path: 'admPatients',
              requireAuth: true,
              builder: (context, params) => AdmPatientsWidget(),
            ),
            FFRoute(
              name: 'adm_MedicalTeams',
              path: 'admMedicalTeams',
              requireAuth: true,
              builder: (context, params) => AdmMedicalTeamsWidget(),
            ),
            FFRoute(
              name: 'adm_Interventions',
              path: 'admInterventions',
              requireAuth: true,
              builder: (context, params) => AdmInterventionsWidget(),
            ),
            FFRoute(
              name: 'adm_Classifiers',
              path: 'admClassifiers',
              requireAuth: true,
              builder: (context, params) => AdmClassifiersWidget(),
            ),
            FFRoute(
              name: 'adm_FormsAndStatements',
              path: 'admFormsAndStatements',
              requireAuth: true,
              builder: (context, params) => AdmFormsAndStatementsWidget(),
            ),
            FFRoute(
              name: 'doc_Patients',
              path: 'docPatients',
              requireAuth: true,
              builder: (context, params) => DocPatientsWidget(),
            ),
            FFRoute(
              name: 'doc_AI',
              path: 'docAI',
              requireAuth: true,
              builder: (context, params) => DocAIWidget(),
            ),
            FFRoute(
              name: 'doc_ResearchSchedule',
              path: 'docResearchSchedule',
              requireAuth: true,
              builder: (context, params) => DocResearchScheduleWidget(),
            ),
            FFRoute(
              name: 'doc_SurgeriesSchedule',
              path: 'docSurgeriesSchedule',
              requireAuth: true,
              builder: (context, params) => DocSurgeriesScheduleWidget(),
            ),
            FFRoute(
              name: 'doc_DutiesSchedule',
              path: 'docDutiesSchedule',
              requireAuth: true,
              builder: (context, params) => DocDutiesScheduleWidget(),
            ),
            FFRoute(
              name: 'nur_Patients',
              path: 'nurPatients',
              requireAuth: true,
              builder: (context, params) => NurPatientsWidget(),
            ),
            FFRoute(
              name: 'nur_Calls',
              path: 'nurCalls',
              requireAuth: true,
              builder: (context, params) => NurCallsWidget(),
            ),
            FFRoute(
              name: 'nur_Procedures',
              path: 'nurProcedures',
              requireAuth: true,
              builder: (context, params) => NurProceduresWidget(),
            ),
            FFRoute(
              name: 'nur_ResearchSchedule',
              path: 'nurResearchSchedule',
              requireAuth: true,
              builder: (context, params) => NurResearchScheduleWidget(),
            ),
            FFRoute(
              name: 'nur_SurgeriesSchedule',
              path: 'nurSurgeriesSchedule',
              requireAuth: true,
              builder: (context, params) => NurSurgeriesScheduleWidget(),
            ),
            FFRoute(
              name: 'nur_DutiesSchedule',
              path: 'nurDutiesSchedule',
              requireAuth: true,
              builder: (context, params) => NurDutiesScheduleWidget(),
            ),
            FFRoute(
              name: 'rec_Admission-EditData',
              path: 'recAdmissionEditData',
              builder: (context, params) => RecAdmissionEditDataWidget(
                admissionID: params.getParam(
                  'admissionID',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'pat_Chat',
              path: 'patChat',
              requireAuth: true,
              builder: (context, params) => PatChatWidget(),
            ),
            FFRoute(
              name: 'patient_DoctorSide_Chat',
              path: 'patientDoctorSideChat',
              builder: (context, params) => PatientDoctorSideChatWidget(
                opponentID: params.getParam(
                  'opponentID',
                  ParamType.String,
                ),
                userID: params.getParam(
                  'userID',
                  ParamType.String,
                ),
                opponentPhoto: params.getParam(
                  'opponentPhoto',
                  ParamType.String,
                ),
                opponentFirstName: params.getParam(
                  'opponentFirstName',
                  ParamType.String,
                ),
                opponentLastName: params.getParam(
                  'opponentLastName',
                  ParamType.String,
                ),
                opponentMiddleName: params.getParam(
                  'opponentMiddleName',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'pat_DashboardCopy',
              path: 'patDashboardCopy',
              requireAuth: true,
              builder: (context, params) => PatDashboardCopyWidget(),
            ),
            FFRoute(
              name: 'patient_PatientSide_Chat',
              path: 'patientPatientSideChat',
              builder: (context, params) => PatientPatientSideChatWidget(
                opponentID: params.getParam(
                  'opponentID',
                  ParamType.String,
                ),
                userID: params.getParam(
                  'userID',
                  ParamType.String,
                ),
                opponentPhoto: params.getParam(
                  'opponentPhoto',
                  ParamType.String,
                ),
                opponentFirstName: params.getParam(
                  'opponentFirstName',
                  ParamType.String,
                ),
                opponentLastName: params.getParam(
                  'opponentLastName',
                  ParamType.String,
                ),
                opponentMiddleName: params.getParam(
                  'opponentMiddleName',
                  ParamType.String,
                ),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/OnboardingPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
