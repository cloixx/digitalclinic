import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/empty_lists/empty_list_search/empty_list_search_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/patient_item_searching/patient_item_searching_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'patient_list_searching_model.dart';
export 'patient_list_searching_model.dart';

class PatientListSearchingWidget extends StatefulWidget {
  const PatientListSearchingWidget({super.key});

  @override
  State<PatientListSearchingWidget> createState() =>
      _PatientListSearchingWidgetState();
}

class _PatientListSearchingWidgetState
    extends State<PatientListSearchingWidget> {
  late PatientListSearchingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatientListSearchingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultInitiated =
          await SearchPatientByParamServiceRoleSecretRLSCall.call(
        searchString: _model.dropDownValue,
        columnName: _model.textController.text,
      );

      if ((_model.apiResultInitiated?.succeeded ?? true)) {
        _model.userDataR = ((_model.apiResultInitiated?.jsonBody ?? '')
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
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 44.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: 260.0,
              maxHeight: MediaQuery.sizeOf(context).height * 0.5,
            ),
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Container(
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 45.0,
                                    decoration: BoxDecoration(),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??=
                                            'patientLastName',
                                      ),
                                      options: List<String>.from(
                                          ['patientLastName']),
                                      optionLabels: ['Прізвище пацієнта'],
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.dropDownValue = val);
                                        setState(() {
                                          _model.textController?.clear();
                                        });
                                        _model.apiResultPatientsReset =
                                            await SearchPatientByParamServiceRoleSecretRLSCall
                                                .call(
                                          searchString:
                                              _model.textController.text,
                                          columnName: _model.dropDownValue,
                                        );

                                        if ((_model.apiResultPatientsReset
                                                ?.succeeded ??
                                            true)) {
                                          _model.userDataR = ((_model
                                                              .apiResultPatientsReset
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
                                      hintText: 'Please select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).stroke,
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
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          _model.apiResulttgd =
                                              await SearchPatientByParamServiceRoleSecretRLSCall
                                                  .call(
                                            searchString:
                                                _model.textController.text,
                                            columnName: _model.dropDownValue,
                                          );

                                          if ((_model.apiResulttgd?.succeeded ??
                                              true)) {
                                            _model.userDataR = ((_model
                                                                .apiResulttgd
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
                                                .cast<
                                                    PatientSearchDataStruct>();
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                        suffixIcon: _model
                                                .textController!.text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.textController
                                                      ?.clear();
                                                  _model.apiResulttgd =
                                                      await SearchPatientByParamServiceRoleSecretRLSCall
                                                          .call(
                                                    searchString: _model
                                                        .textController.text,
                                                    columnName:
                                                        _model.dropDownValue,
                                                  );

                                                  if ((_model.apiResulttgd
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.userDataR = ((_model
                                                                    .apiResulttgd
                                                                    ?.jsonBody ??
                                                                '')
                                                            .toList()
                                                            .map<PatientSearchDataStruct?>(
                                                                PatientSearchDataStruct
                                                                    .maybeFromMap)
                                                            .toList() as Iterable<PatientSearchDataStruct?>)
                                                        .withoutNulls
                                                        .toList()
                                                        .cast<PatientSearchDataStruct>();
                                                    setState(() {});
                                                  }

                                                  setState(() {});
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 22.0,
                                                ),
                                              )
                                            : null,
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
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.pop(context);

                                        context.pushNamed(
                                          'rec_NewAdmission',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                            ),
                                          },
                                        );
                                      },
                                      text: 'Новий пацієнт',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final userData = (functions
                                        .sortingPatientsByCreatedDateDecreasing(
                                            _model.userDataR.toList())
                                        ?.toList() ??
                                    [])
                                .take(20)
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
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Navigator.pop(context);

                                    context.goNamed(
                                      'rec_NewAdmission',
                                      queryParameters: {
                                        'patientID': serializeParam(
                                          userDataItem.id,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: wrapWithModel(
                                    model: _model.patientItemSearchingModels
                                        .getModel(
                                      userDataIndex.toString(),
                                      userDataIndex,
                                    ),
                                    updateCallback: () => setState(() {}),
                                    child: PatientItemSearchingWidget(
                                      key: Key(
                                        'Keyz1a_${userDataIndex.toString()}',
                                      ),
                                      userRow: userDataItem,
                                    ),
                                  ),
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
        ],
      ),
    );
  }
}
