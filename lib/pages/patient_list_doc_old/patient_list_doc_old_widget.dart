import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/empty_lists/empty_list_search/empty_list_search_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/patient_item_doc_old/patient_item_doc_old_widget.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'patient_list_doc_old_model.dart';
export 'patient_list_doc_old_model.dart';

class PatientListDocOldWidget extends StatefulWidget {
  const PatientListDocOldWidget({super.key});

  @override
  State<PatientListDocOldWidget> createState() =>
      _PatientListDocOldWidgetState();
}

class _PatientListDocOldWidgetState extends State<PatientListDocOldWidget> {
  late PatientListDocOldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatientListDocOldModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.unsubscribeRealtime(
        'patients',
      );
      await actions.subscribeRealtime(
        'patients',
        () async {
          _model.apiResultSearchRealtime =
              await SearchPatientByParamServiceRoleSecretRLSCall.call(
            searchString: _model.textController.text,
            columnName: _model.dropDownValue,
          );

          if ((_model.apiResultSearchRealtime?.succeeded ?? true)) {
            _model.usersData = ((_model.apiResultSearchRealtime?.jsonBody ?? '')
                    .toList()
                    .map<PatientSearchDataStruct?>(
                        PatientSearchDataStruct.maybeFromMap)
                    .toList() as Iterable<PatientSearchDataStruct?>)
                .withoutNulls
                .toList()
                .cast<PatientSearchDataStruct>();
            setState(() {});
          }
        },
      );
      _model.apiResultjl =
          await SearchPatientByParamServiceRoleSecretRLSCall.call(
        searchString: _model.textController.text,
        columnName: _model.dropDownValue,
      );

      if ((_model.apiResultjl?.succeeded ?? true)) {
        _model.usersData = ((_model.apiResultjl?.jsonBody ?? '')
                .toList()
                .map<PatientSearchDataStruct?>(
                    PatientSearchDataStruct.maybeFromMap)
                .toList() as Iterable<PatientSearchDataStruct?>)
            .withoutNulls
            .toList()
            .cast<PatientSearchDataStruct>();
        setState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 80.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 45.0,
                              decoration: BoxDecoration(),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue ??= 'patientLastName',
                                ),
                                options: List<String>.from(['patientLastName']),
                                optionLabels: ['Прізвище пацієнта'],
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue = val);
                                  setState(() {
                                    _model.textController?.clear();
                                  });
                                  _model.apiResultPatientsReset1 =
                                      await SearchPatientByParamServiceRoleSecretRLSCall
                                          .call(
                                    searchString: _model.textController.text,
                                    columnName: _model.dropDownValue,
                                  );

                                  if ((_model
                                          .apiResultPatientsReset1?.succeeded ??
                                      true)) {
                                    _model.usersData = ((_model
                                                        .apiResultPatientsReset1
                                                        ?.jsonBody ??
                                                    '')
                                                .toList()
                                                .map<PatientSearchDataStruct?>(
                                                    PatientSearchDataStruct
                                                        .maybeFromMap)
                                                .toList()
                                            as Iterable<
                                                PatientSearchDataStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<PatientSearchDataStruct>();
                                    setState(() {});
                                  }

                                  setState(() {});
                                },
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Виберіть параметри пошуку...',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).stroke,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderWidth: 0.5,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    _model.apiResultPatSearching =
                                        await SearchPatientByParamServiceRoleSecretRLSCall
                                            .call(
                                      searchString: _model.textController.text,
                                      columnName: _model.dropDownValue,
                                    );

                                    if ((_model
                                            .apiResultPatSearching?.succeeded ??
                                        true)) {
                                      _model.usersData = ((_model
                                                          .apiResultPatSearching
                                                          ?.jsonBody ??
                                                      '')
                                                  .toList()
                                                  .map<PatientSearchDataStruct?>(
                                                      PatientSearchDataStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  PatientSearchDataStruct?>)
                                          .withoutNulls
                                          .toList()
                                          .cast<PatientSearchDataStruct>();
                                      setState(() {});
                                    }

                                    setState(() {});
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Пошук пацієнта...',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  alignLabelWithHint: false,
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Rubik',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          18.0, 0.0, 18.0, 0.0),
                                  prefixIcon: Icon(
                                    Icons.search,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: FlutterFlowChoiceChips(
                                  options: [ChipData('Всі')],
                                  onChanged: (val) async {
                                    setState(() => _model.choiceChipsValue =
                                        val?.firstOrNull);
                                    setState(() {
                                      _model.textController?.clear();
                                    });
                                    _model.apiResultPatientsReset2 =
                                        await SearchPatientByParamServiceRoleSecretRLSCall
                                            .call(
                                      searchString: _model.textController.text,
                                      columnName: _model.dropDownValue,
                                    );

                                    if ((_model.apiResultPatientsReset2
                                            ?.succeeded ??
                                        true)) {
                                      _model.usersData = ((_model
                                                          .apiResultPatientsReset2
                                                          ?.jsonBody ??
                                                      '')
                                                  .toList()
                                                  .map<PatientSearchDataStruct?>(
                                                      PatientSearchDataStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  PatientSearchDataStruct?>)
                                          .withoutNulls
                                          .toList()
                                          .cast<PatientSearchDataStruct>();
                                      setState(() {});
                                    }

                                    setState(() {});
                                  },
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    iconSize: 18.0,
                                    labelPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            8.0, 1.0, 8.0, 1.0),
                                    elevation: 2.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    iconSize: 18.0,
                                    labelPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            8.0, 1.0, 8.0, 1.0),
                                    elevation: 0.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    borderWidth: 0.5,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  chipSpacing: 18.0,
                                  rowSpacing: 12.0,
                                  multiselect: false,
                                  initialized: _model.choiceChipsValue != null,
                                  alignment: WrapAlignment.start,
                                  controller:
                                      _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
                                    ['Всі'],
                                  ),
                                  wrapped: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      final userData = ((_model.choiceChipsValue ==
                                          'Не зареєстровані'
                                      ? functions
                                          .sortingPatientsByCreatedDateDecreasing(
                                              _model.usersData
                                                  .where((e) =>
                                                      e.userProfileID == null ||
                                                      e.userProfileID == '')
                                                  .toList())
                                      : functions
                                          .sortingPatientsByCreatedDateDecreasing(
                                              _model.usersData.toList()))
                                  ?.toList() ??
                              [])
                          .take(100)
                          .toList();
                      if (userData.isEmpty) {
                        return EmptyListSearchWidget();
                      }

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: userData.length,
                        itemBuilder: (context, userDataIndex) {
                          final userDataItem = userData[userDataIndex];
                          return PatientItemDocOldWidget(
                            key: Key(
                                'Keyudd_${userDataIndex}_of_${userData.length}'),
                            userRow: userDataItem,
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
    );
  }
}
