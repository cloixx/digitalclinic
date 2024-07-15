import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/user_profile_list_searching/user_profile_list_searching_widget.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'patient_list_rec_model.dart';
export 'patient_list_rec_model.dart';

class PatientListRecWidget extends StatefulWidget {
  const PatientListRecWidget({super.key});

  @override
  State<PatientListRecWidget> createState() => _PatientListRecWidgetState();
}

class _PatientListRecWidgetState extends State<PatientListRecWidget> {
  late PatientListRecModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatientListRecModel());

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
            _model.userData = ((_model.apiResultSearchRealtime?.jsonBody ?? '')
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
      _model.apiResultjlf =
          await SearchPatientByParamServiceRoleSecretRLSCall.call(
        searchString: _model.textController.text,
        columnName: _model.dropDownValue,
      );

      if ((_model.apiResultjlf?.succeeded ?? true)) {
        _model.userData = ((_model.apiResultjlf?.jsonBody ?? '')
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                minHeight: 80.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
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
                                _model.apiResultPatientsReset =
                                    await SearchPatientByParamServiceRoleSecretRLSCall
                                        .call(
                                  searchString: _model.textController.text,
                                  columnName: _model.dropDownValue,
                                );

                                if ((_model.apiResultPatientsReset?.succeeded ??
                                    true)) {
                                  _model.userData = ((_model
                                                      .apiResultPatientsReset
                                                      ?.jsonBody ??
                                                  '')
                                              .toList()
                                              .map<PatientSearchDataStruct?>(
                                                  PatientSearchDataStruct
                                                      .maybeFromMap)
                                              .toList()
                                          as Iterable<PatientSearchDataStruct?>)
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
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.3,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      _model.apiResultPatSearch =
                                          await SearchPatientByParamServiceRoleSecretRLSCall
                                              .call(
                                        searchString:
                                            _model.textController.text,
                                        columnName: _model.dropDownValue,
                                      );

                                      if ((_model
                                              .apiResultPatSearch?.succeeded ??
                                          true)) {
                                        _model.userData = ((_model
                                                            .apiResultPatSearch
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
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('Всі'),
                                ChipData('Не зареєстровані')
                              ],
                              onChanged: (val) => setState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull),
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
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 1.0, 8.0, 1.0),
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 18.0,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
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
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                ['Всі'],
                              ),
                              wrapped: true,
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
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Container(
                        height: 600.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final userListData = (_model.choiceChipsValue ==
                                            'Не зареєстровані'
                                        ? functions
                                            .sortingPatientsByCreatedDateDecreasing(
                                                _model.userData
                                                    .where((e) =>
                                                        e.userProfileID ==
                                                            null ||
                                                        e.userProfileID == '')
                                                    .toList())
                                        : functions
                                            .sortingPatientsByCreatedDateDecreasing(
                                                _model.userData.toList()))
                                    ?.toList() ??
                                [];
                            if (userListData.isEmpty) {
                              return EmptyListWidget();
                            }

                            return FlutterFlowDataTable<
                                PatientSearchDataStruct>(
                              controller: _model.paginatedDataTableController,
                              data: userListData,
                              columnsBuilder: (onSortChanged) => [
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      ' ',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Rubik',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  fixedWidth: 100.0,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'ПІБ',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Rubik',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Дата народження',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Rubik',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      ' ',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Rubik',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  fixedWidth: 80.0,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      ' ',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Rubik',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                              dataRowBuilder: (userListDataItem,
                                      userListDataIndex,
                                      selected,
                                      onSelectChanged) =>
                                  DataRow(
                                color: MaterialStateProperty.all(
                                  userListDataIndex % 2 == 0
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : Color(0x6DF1F4F8),
                                ),
                                cells: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        userListDataItem.patientPhotoUrl,
                                        'https://oglmkpwpiottypmzxnzu.supabase.co/storage/v1/object/sign/avatars/noPhoto.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL25vUGhvdG8ucG5nIiwiaWF0IjoxNzEyNTczNzE3LCJleHAiOjIzNDMyOTM3MTd9.l64qIP6u3XEMFbOYNNtOv4s-Yhqu75BgdA1N4l8ZYdE&t=2024-04-08T10%3A55%3A17.333Z',
                                      ),
                                      width: 60.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    '${valueOrDefault<String>(
                                      userListDataItem.patientLastName,
                                      '_',
                                    )} ${valueOrDefault<String>(
                                      userListDataItem.patientFirstName,
                                      '_',
                                    )} ${valueOrDefault<String>(
                                      userListDataItem.patientMiddleName,
                                      '_',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat(
                                        'd MMMM y р',
                                        functions.stringToDateTime(
                                            valueOrDefault<String>(
                                          userListDataItem.patientDateOfBirth,
                                          'd MMM y',
                                        )),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      'd MMMM y',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (userListDataItem.userProfileID ==
                                              null ||
                                          userListDataItem.userProfileID == '')
                                        Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        child:
                                                            UserProfileListSearchingWidget(
                                                          patientID:
                                                              userListDataItem
                                                                  .id,
                                                          name:
                                                              '${valueOrDefault<String>(
                                                            userListDataItem
                                                                .patientLastName,
                                                            '_',
                                                          )} ${valueOrDefault<String>(
                                                            userListDataItem
                                                                .patientFirstName,
                                                            '_',
                                                          )} ${valueOrDefault<String>(
                                                            userListDataItem
                                                                .patientMiddleName,
                                                            '_',
                                                          )}',
                                                          photoUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            userListDataItem
                                                                .patientPhotoUrl,
                                                            'https://oglmkpwpiottypmzxnzu.supabase.co/storage/v1/object/sign/avatars/noPhoto.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL25vUGhvdG8ucG5nIiwiaWF0IjoxNzEyNTczNzE3LCJleHAiOjIzNDMyOTM3MTd9.l64qIP6u3XEMFbOYNNtOv4s-Yhqu75BgdA1N4l8ZYdE&t=2024-04-08T10%3A55%3A17.333Z',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.7,
                                                        child:
                                                            UserProfileListSearchingWidget(
                                                          patientID:
                                                              userListDataItem
                                                                  .id,
                                                          name:
                                                              '${valueOrDefault<String>(
                                                            userListDataItem
                                                                .patientLastName,
                                                            '_',
                                                          )} ${valueOrDefault<String>(
                                                            userListDataItem
                                                                .patientFirstName,
                                                            '_',
                                                          )} ${valueOrDefault<String>(
                                                            userListDataItem
                                                                .patientMiddleName,
                                                            '_',
                                                          )}',
                                                          photoUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            userListDataItem
                                                                .patientPhotoUrl,
                                                            'https://oglmkpwpiottypmzxnzu.supabase.co/storage/v1/object/sign/avatars/noPhoto.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL25vUGhvdG8ucG5nIiwiaWF0IjoxNzEyNTczNzE3LCJleHAiOjIzNDMyOTM3MTd9.l64qIP6u3XEMFbOYNNtOv4s-Yhqu75BgdA1N4l8ZYdE&t=2024-04-08T10%3A55%3A17.333Z',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              }
                                            },
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    offset: Offset(
                                                      0.0,
                                                      0.5,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  width: 0.5,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.swap_vert_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 28.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'rec_PatientInfo-EditData',
                                            queryParameters: {
                                              'patientID': serializeParam(
                                                userListDataItem.id,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 5.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                offset: Offset(
                                                  0.0,
                                                  0.5,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              width: 0.5,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.userAlt,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child:
                                            FutureBuilder<List<AdmissionsRow>>(
                                          future: AdmissionsTable().queryRows(
                                            queryFn: (q) => q
                                                .eq(
                                                  'patientID',
                                                  userListDataItem.id,
                                                )
                                                .eq(
                                                  'isClosed',
                                                  false,
                                                )
                                                .order('admitDate',
                                                    ascending: true),
                                            limit: 2,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AdmissionsRow>
                                                containerAdmissionsRowList =
                                                snapshot.data!;

                                            return Container(
                                              width: 50.0,
                                              decoration: BoxDecoration(),
                                              child: Visibility(
                                                visible:
                                                    containerAdmissionsRowList
                                                            .length !=
                                                        0,
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
                                                    context.pushNamed(
                                                      'rec_Admission-EditData',
                                                      queryParameters: {
                                                        'admissionID':
                                                            serializeParam(
                                                          containerAdmissionsRowList
                                                              .first.hadmID,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 5.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                          offset: Offset(
                                                            0.0,
                                                            0.5,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 0.5,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .fileMedical,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ].map((c) => DataCell(c)).toList(),
                              ),
                              emptyBuilder: () => EmptyListWidget(),
                              paginated: true,
                              selectable: false,
                              hidePaginator: false,
                              showFirstLastButtons: false,
                              headingRowHeight: 30.0,
                              dataRowHeight: 80.0,
                              columnSpacing: 20.0,
                              headingRowColor:
                                  FlutterFlowTheme.of(context).accent4,
                              borderRadius: BorderRadius.circular(8.0),
                              addHorizontalDivider: true,
                              addTopAndBottomDivider: true,
                              hideDefaultHorizontalDivider: true,
                              horizontalDividerColor:
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              horizontalDividerThickness: 1.0,
                              addVerticalDivider: false,
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
