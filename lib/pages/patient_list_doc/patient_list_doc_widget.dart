import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/empty_lists/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/patient_item_doc/patient_item_doc_widget.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'patient_list_doc_model.dart';
export 'patient_list_doc_model.dart';

class PatientListDocWidget extends StatefulWidget {
  const PatientListDocWidget({
    super.key,
    required this.department,
    required this.doctorID,
  });

  final int? department;
  final String? doctorID;

  @override
  State<PatientListDocWidget> createState() => _PatientListDocWidgetState();
}

class _PatientListDocWidgetState extends State<PatientListDocWidget> {
  late PatientListDocModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatientListDocModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.unsubscribeRealtime(
        'admissions',
      );
      await Future.delayed(const Duration(milliseconds: 500));
      await actions.subscribeRealtimeFilter(
        'admissions',
        'department_current',
        widget!.department!.toString(),
        () async {
          _model.patientsData1 =
              await PatientInViewByDepartmentServiceRoleSecretRLSCall.call(
            department: widget!.department?.toString(),
          );

          if ((_model.patientsData1?.succeeded ?? true)) {
            _model.patientsList = ((_model.patientsData1?.jsonBody ?? '')
                    .toList()
                    .map<PatientInDepartmentViewStruct?>(
                        PatientInDepartmentViewStruct.maybeFromMap)
                    .toList() as Iterable<PatientInDepartmentViewStruct?>)
                .withoutNulls
                .toList()
                .cast<PatientInDepartmentViewStruct>();
            _model.chambers = functions
                .sortListByIncreasing(((_model.patientsData1?.jsonBody ?? '')
                        .toList()
                        .map<PatientInDepartmentViewStruct?>(
                            PatientInDepartmentViewStruct.maybeFromMap)
                        .toList() as Iterable<PatientInDepartmentViewStruct?>)
                    .withoutNulls
                    .map((e) => e.chamberNumber)
                    .toList()
                    .unique((e) => e)
                    .toList())!
                .where((e) => e != 0)
                .toList()
                .toList()
                .cast<int>();
            _model.chambersWithNull = functions
                .sortListByIncreasing(((_model.patientsData1?.jsonBody ?? '')
                        .toList()
                        .map<PatientInDepartmentViewStruct?>(
                            PatientInDepartmentViewStruct.maybeFromMap)
                        .toList() as Iterable<PatientInDepartmentViewStruct?>)
                    .withoutNulls
                    .map((e) => e.chamberNumber)
                    .toList()
                    .unique((e) => e)
                    .toList())!
                .toList()
                .cast<int>();
            setState(() {});
          }
        },
      );
      _model.patientsData =
          await PatientInViewByDepartmentServiceRoleSecretRLSCall.call(
        department: widget!.department?.toString(),
      );

      if ((_model.patientsData?.succeeded ?? true)) {
        _model.patientsList = ((_model.patientsData?.jsonBody ?? '')
                .toList()
                .map<PatientInDepartmentViewStruct?>(
                    PatientInDepartmentViewStruct.maybeFromMap)
                .toList() as Iterable<PatientInDepartmentViewStruct?>)
            .withoutNulls
            .toList()
            .cast<PatientInDepartmentViewStruct>();
        _model.chambers = functions
            .sortListByIncreasing(((_model.patientsData?.jsonBody ?? '')
                    .toList()
                    .map<PatientInDepartmentViewStruct?>(
                        PatientInDepartmentViewStruct.maybeFromMap)
                    .toList() as Iterable<PatientInDepartmentViewStruct?>)
                .withoutNulls
                .map((e) => e.chamberNumber)
                .toList()
                .unique((e) => e)
                .toList())!
            .where((e) => e != 0)
            .toList()
            .toList()
            .cast<int>();
        _model.chambersWithNull = functions
            .sortListByIncreasing(((_model.patientsData?.jsonBody ?? '')
                    .toList()
                    .map<PatientInDepartmentViewStruct?>(
                        PatientInDepartmentViewStruct.maybeFromMap)
                    .toList() as Iterable<PatientInDepartmentViewStruct?>)
                .withoutNulls
                .map((e) => e.chamberNumber)
                .toList()
                .unique((e) => e)
                .toList())!
            .toList()
            .cast<int>();
        setState(() {});
      }
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
        Expanded(
          child: Container(
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
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final chambersL = _model.chambers.toList();
                            if (chambersL.isEmpty) {
                              return EmptyListWidget();
                            }

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: chambersL.length,
                              itemBuilder: (context, chambersLIndex) {
                                final chambersLItem = chambersL[chambersLIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 12.0, 18.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Палата №  ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              chambersLItem.toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final chamberIn = _model.patientsList
                                            .where((e) =>
                                                e.chamberNumber ==
                                                chambersLItem)
                                            .toList();

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: chamberIn.length,
                                          itemBuilder:
                                              (context, chamberInIndex) {
                                            final chamberInItem =
                                                chamberIn[chamberInIndex];
                                            return PatientItemDocWidget(
                                              key: Key(
                                                  'Keywwr_${chamberInIndex}_of_${chamberIn.length}'),
                                              userRow: chamberInItem,
                                              doctorID: widget!.doctorID!,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
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
    );
  }
}
