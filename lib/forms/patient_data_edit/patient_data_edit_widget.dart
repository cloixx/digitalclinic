import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'patient_data_edit_model.dart';
export 'patient_data_edit_model.dart';

class PatientDataEditWidget extends StatefulWidget {
  const PatientDataEditWidget({
    super.key,
    required this.patientID,
    required this.setNotEditable,
    required this.reloadPage,
  });

  final String? patientID;
  final Future Function()? setNotEditable;
  final Future Function()? reloadPage;

  @override
  State<PatientDataEditWidget> createState() => _PatientDataEditWidgetState();
}

class _PatientDataEditWidgetState extends State<PatientDataEditWidget> {
  late PatientDataEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatientDataEditModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userDataRowsByAction = await PatientsTable().queryRows(
        queryFn: (q) => q.eq(
          'id',
          widget!.patientID,
        ),
      );
      _model.isInvalid = valueOrDefault<bool>(
        _model.userDataRowsByAction?.first?.isInvalid,
        false,
      );
      _model.isIdentified = valueOrDefault<bool>(
        _model.userDataRowsByAction?.first?.isIdentified,
        false,
      );
      _model.isVasermanReactionResult = valueOrDefault<bool>(
        _model.userDataRowsByAction?.first?.isVasermanReactionResult,
        false,
      );
      _model.isAlergyReactions = valueOrDefault<bool>(
        _model.userDataRowsByAction?.first?.isAllergyReactionMedicaments,
        false,
      );
      _model.isHIV = valueOrDefault<bool>(
        _model.userDataRowsByAction?.first?.isHiv,
        false,
      );
      setState(() {});
    });

    _model.lastNameFocusNode ??= FocusNode();

    _model.firstNameFocusNode ??= FocusNode();

    _model.middleNameFocusNode ??= FocusNode();

    _model.youPhoneFocusNode ??= FocusNode();

    _model.credentialDocumentTypeFocusNode ??= FocusNode();

    _model.credentialDocumentFocusNode ??= FocusNode();

    _model.cityFocusNode ??= FocusNode();

    _model.indexFocusNode ??= FocusNode();

    _model.oblastFocusNode ??= FocusNode();

    _model.regionFocusNode ??= FocusNode();

    _model.streetFocusNode ??= FocusNode();

    _model.buildNumFocusNode ??= FocusNode();

    _model.flatFocusNode ??= FocusNode();

    _model.workPlaceFocusNode ??= FocusNode();

    _model.workPositionFocusNode ??= FocusNode();

    _model.heightFocusNode ??= FocusNode();

    _model.allergyReactionsFocusNode ??= FocusNode();

    _model.invalidTypeFocusNode ??= FocusNode();

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
      child: FutureBuilder<List<PatientsRow>>(
        future: PatientsTable().querySingleRow(
          queryFn: (q) => q.eq(
            'id',
            widget!.patientID,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<PatientsRow> columnPatientsRowList = snapshot.data!;

          final columnPatientsRow = columnPatientsRowList.isNotEmpty
              ? columnPatientsRowList.first
              : null;
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Особисті дані',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Divider(
                                thickness: 1.5,
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 30.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width < kBreakpointLarge
                          ? MediaQuery.sizeOf(context).width
                          : (MediaQuery.sizeOf(context).width * 0.44),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: Form(
                        key: _model.formKey11,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.lastNameTextController ??=
                                TextEditingController(
                              text: columnPatientsRow?.patientLastName,
                            ),
                            focusNode: _model.lastNameFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.lastNameTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                if (_model.formKey11.currentState == null ||
                                    !_model.formKey11.currentState!
                                        .validate()) {
                                  return;
                                }
                              },
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'Прізвище...',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Roboto',
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
                                  color: FlutterFlowTheme.of(context).accent2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
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
                              fillColor:
                                  FlutterFlowTheme.of(context).otherBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 18.0, 0.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.lastNameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width < kBreakpointLarge
                          ? MediaQuery.sizeOf(context).width
                          : (MediaQuery.sizeOf(context).width * 0.44),
                      decoration: BoxDecoration(),
                      child: Form(
                        key: _model.formKey1,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.firstNameTextController ??=
                                TextEditingController(
                              text: columnPatientsRow?.patientFirstName,
                            ),
                            focusNode: _model.firstNameFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.firstNameTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                if (_model.formKey1.currentState == null ||
                                    !_model.formKey1.currentState!.validate()) {
                                  return;
                                }
                              },
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'Ім\'я...',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Roboto',
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
                                  color: FlutterFlowTheme.of(context).accent2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
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
                              fillColor:
                                  FlutterFlowTheme.of(context).otherBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 18.0, 0.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.firstNameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 30.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width < kBreakpointLarge
                          ? MediaQuery.sizeOf(context).width
                          : (MediaQuery.sizeOf(context).width * 0.44),
                      decoration: BoxDecoration(),
                      child: Form(
                        key: _model.formKey8,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.middleNameTextController ??=
                                TextEditingController(
                              text: columnPatientsRow?.patientMiddleName,
                            ),
                            focusNode: _model.middleNameFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.middleNameTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                if (_model.formKey8.currentState == null ||
                                    !_model.formKey8.currentState!.validate()) {
                                  return;
                                }
                              },
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'По батькові...',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Roboto',
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
                                  color: FlutterFlowTheme.of(context).accent2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
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
                              fillColor:
                                  FlutterFlowTheme.of(context).otherBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 18.0, 0.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.middleNameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 14.0,
                              decoration: BoxDecoration(),
                              child: Visibility(
                                visible: _model.dropDownGenderValue != null &&
                                    _model.dropDownGenderValue != '',
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Стать',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          fontSize: 11.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.21,
                              constraints: BoxConstraints(
                                minWidth: 210.0,
                              ),
                              decoration: BoxDecoration(),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.dropDownGenderValueController ??=
                                        FormFieldController<String>(
                                  _model.dropDownGenderValue ??=
                                      columnPatientsRow?.gender,
                                ),
                                options: FFAppState().gender,
                                onChanged: (val) => setState(
                                    () => _model.dropDownGenderValue = val),
                                height: 50.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: _model.dropDownGenderValue ==
                                                  null ||
                                              _model.dropDownGenderValue == ''
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context).info,
                                      fontSize: _model.dropDownGenderValue ==
                                                  null ||
                                              _model.dropDownGenderValue == ''
                                          ? 14.0
                                          : 16.0,
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Стать...',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).stroke,
                                  size: 24.0,
                                ),
                                fillColor: _model.mouseRegionHovered1!
                                    ? Color(0xFFF0F1F3)
                                    : FlutterFlowTheme.of(context)
                                        .otherBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).accent3,
                                borderWidth: 1.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onEnter: ((event) async {
                        setState(() => _model.mouseRegionHovered1 = true);
                      }),
                      onExit: ((event) async {
                        setState(() => _model.mouseRegionHovered1 = false);
                      }),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Wrap(
                    spacing: 30.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      MouseRegion(
                        opaque: false,
                        cursor: SystemMouseCursors.click ?? MouseCursor.defer,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 14.0,
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: (_model.datePicked1 != null) ||
                                      (columnPatientsRow?.patientDateOfBirth !=
                                          null),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        44.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Дата народження',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Rubik',
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final _datePicked1Date = await showDatePicker(
                                    context: context,
                                    initialDate: (() {
                                          if ((_model.datePicked1 == null) &&
                                              (columnPatientsRow
                                                      ?.patientDateOfBirth ==
                                                  null)) {
                                            return getCurrentTimestamp;
                                          } else if ((_model.datePicked1 ==
                                                  null) &&
                                              (columnPatientsRow
                                                      ?.patientDateOfBirth !=
                                                  null)) {
                                            return columnPatientsRow
                                                ?.patientDateOfBirth;
                                          } else {
                                            return _model.datePicked1;
                                          }
                                        }() ??
                                        DateTime.now()),
                                    firstDate: DateTime(1900),
                                    lastDate: (() {
                                          if ((_model.datePicked1 == null) &&
                                              (columnPatientsRow
                                                      ?.patientDateOfBirth ==
                                                  null)) {
                                            return getCurrentTimestamp;
                                          } else if ((_model.datePicked1 ==
                                                  null) &&
                                              (columnPatientsRow
                                                      ?.patientDateOfBirth !=
                                                  null)) {
                                            return columnPatientsRow
                                                ?.patientDateOfBirth;
                                          } else {
                                            return _model.datePicked1;
                                          }
                                        }() ??
                                        DateTime.now()),
                                    builder: (context, child) {
                                      return wrapInMaterialDatePickerTheme(
                                        context,
                                        child!,
                                        headerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        headerForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        headerTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  fontSize: 32.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                        pickerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        pickerForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        selectedDateTimeBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        selectedDateTimeForegroundColor:
                                            FlutterFlowTheme.of(context).white,
                                        actionButtonForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        iconSize: 24.0,
                                      );
                                    },
                                  );

                                  if (_datePicked1Date != null) {
                                    safeSetState(() {
                                      _model.datePicked1 = DateTime(
                                        _datePicked1Date.year,
                                        _datePicked1Date.month,
                                        _datePicked1Date.day,
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width <
                                          kBreakpointLarge
                                      ? MediaQuery.sizeOf(context).width
                                      : (MediaQuery.sizeOf(context).width *
                                          0.44),
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: _model.mouseRegionHovered2!
                                        ? Color(0xFFF0F1F3)
                                        : FlutterFlowTheme.of(context)
                                            .otherBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.date_range_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 18.0, 0.0),
                                            child: Text(
                                              () {
                                                if (columnPatientsRow
                                                        ?.patientDateOfBirth ==
                                                    null) {
                                                  return valueOrDefault<String>(
                                                    dateTimeFormat(
                                                      'dd/MM/yyyy',
                                                      _model.datePicked1,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    'Дата народження',
                                                  );
                                                } else if ((columnPatientsRow
                                                            ?.patientDateOfBirth !=
                                                        null) &&
                                                    (_model.datePicked1 !=
                                                        null)) {
                                                  return valueOrDefault<String>(
                                                    dateTimeFormat(
                                                      'dd/MM/yyyy',
                                                      _model.datePicked1,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    'Дата народження',
                                                  );
                                                } else {
                                                  return dateTimeFormat(
                                                    'dd/MM/yyyy',
                                                    columnPatientsRow!
                                                        .patientDateOfBirth!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  );
                                                }
                                              }(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: (_model.datePicked1 ==
                                                                null) &&
                                                            (columnPatientsRow
                                                                    ?.patientDateOfBirth ==
                                                                null)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    fontSize: (_model
                                                                    .datePicked1 ==
                                                                null) &&
                                                            (columnPatientsRow
                                                                    ?.patientDateOfBirth ==
                                                                null)
                                                        ? 14.0
                                                        : 16.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if ((_model.datePicked1 != null) ||
                                          (columnPatientsRow
                                                  ?.patientDateOfBirth !=
                                              null))
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .otherBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Вік:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '${functions.ageCalculation(() {
                                                        if ((_model.datePicked1 !=
                                                                null) &&
                                                            (columnPatientsRow
                                                                    ?.patientDateOfBirth !=
                                                                null)) {
                                                          return _model
                                                              .datePicked1;
                                                        } else if ((_model
                                                                    .datePicked1 ==
                                                                null) &&
                                                            (columnPatientsRow
                                                                    ?.patientDateOfBirth !=
                                                                null)) {
                                                          return columnPatientsRow
                                                              ?.patientDateOfBirth;
                                                        } else {
                                                          return _model
                                                              .datePicked1;
                                                        }
                                                      }()).toString()} р.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
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
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => _model.mouseRegionHovered2 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegionHovered2 = false);
                        }),
                      ),
                      Container(
                        width:
                            MediaQuery.sizeOf(context).width < kBreakpointLarge
                                ? MediaQuery.sizeOf(context).width
                                : (MediaQuery.sizeOf(context).width * 0.44),
                        decoration: BoxDecoration(),
                        child: Form(
                          key: _model.formKey17,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.youPhoneTextController ??=
                                  TextEditingController(
                                text: columnPatientsRow?.patientPhoneNumber,
                              ),
                              focusNode: _model.youPhoneFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.youPhoneTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  if (_model.formKey17.currentState == null ||
                                      !_model.formKey17.currentState!
                                          .validate()) {
                                    return;
                                  }
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelText: 'Телефон',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                alignLabelWithHint: false,
                                hintText: '(000) 000-00-00',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent2,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    .otherBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                prefixIcon: Icon(
                                  Icons.phone_android_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 22.0,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                              keyboardType: TextInputType.phone,
                              validator: _model.youPhoneTextControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.youPhoneMask],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Документ, що посвідчує особу',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Divider(
                                thickness: 1.5,
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Wrap(
                    spacing: 30.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width:
                            MediaQuery.sizeOf(context).width < kBreakpointLarge
                                ? MediaQuery.sizeOf(context).width
                                : (MediaQuery.sizeOf(context).width * 0.44),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Form(
                          key: _model.formKey16,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model
                                      .credentialDocumentTypeTextController ??=
                                  TextEditingController(
                                text: columnPatientsRow?.credentialDocument,
                              ),
                              focusNode: _model.credentialDocumentTypeFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.credentialDocumentTypeTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  if (_model.formKey16.currentState == null ||
                                      !_model.formKey16.currentState!
                                          .validate()) {
                                    return;
                                  }
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelText: 'Документ...',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Roboto',
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
                                    color: FlutterFlowTheme.of(context).accent2,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    .otherBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                prefixIcon: Icon(
                                  Icons.account_box,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model
                                  .credentialDocumentTypeTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width:
                            MediaQuery.sizeOf(context).width < kBreakpointLarge
                                ? MediaQuery.sizeOf(context).width
                                : (MediaQuery.sizeOf(context).width * 0.44),
                        decoration: BoxDecoration(),
                        child: Form(
                          key: _model.formKey3,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: TextFormField(
                              controller:
                                  _model.credentialDocumentTextController ??=
                                      TextEditingController(
                                text: columnPatientsRow?.credentialDocumentId,
                              ),
                              focusNode: _model.credentialDocumentFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.credentialDocumentTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  if (_model.formKey3.currentState == null ||
                                      !_model.formKey3.currentState!
                                          .validate()) {
                                    return;
                                  }
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelText:
                                    'Номер документа, що посвідчує особу...',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Roboto',
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
                                    color: FlutterFlowTheme.of(context).accent2,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    .otherBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                prefixIcon: Icon(
                                  Icons.numbers_rounded,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model
                                  .credentialDocumentTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Місце проживання',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Divider(
                                thickness: 1.5,
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 30.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width < kBreakpointLarge
                          ? MediaQuery.sizeOf(context).width
                          : (MediaQuery.sizeOf(context).width * 0.44),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: Form(
                        key: _model.formKey10,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.cityTextController ??=
                                TextEditingController(
                              text: columnPatientsRow?.addressPlaceName,
                            ),
                            focusNode: _model.cityFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.cityTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                if (_model.formKey10.currentState == null ||
                                    !_model.formKey10.currentState!
                                        .validate()) {
                                  return;
                                }
                              },
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'Назва населеного пункту...',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Roboto',
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
                                  color: FlutterFlowTheme.of(context).accent2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
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
                              fillColor:
                                  FlutterFlowTheme.of(context).otherBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 18.0, 0.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.cityTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Wrap(
                      spacing: 30.0,
                      runSpacing: 0.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 14.0,
                                  decoration: BoxDecoration(),
                                  child: Visibility(
                                    visible:
                                        _model.dropDowCityOrVilValue != null &&
                                            _model.dropDowCityOrVilValue != '',
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          18.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Тип населеного пункту',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              fontSize: 11.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.21,
                                  constraints: BoxConstraints(
                                    minWidth: 210.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model
                                            .dropDowCityOrVilValueController ??=
                                        FormFieldController<String>(
                                      _model.dropDowCityOrVilValue ??=
                                          columnPatientsRow?.addressType,
                                    ),
                                    options: FFAppState().cityOrVilage,
                                    onChanged: (val) => setState(() =>
                                        _model.dropDowCityOrVilValue = val),
                                    height: 50.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: _model
                                                          .dropDowCityOrVilValue ==
                                                      null ||
                                                  _model.dropDowCityOrVilValue ==
                                                      ''
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .info,
                                          fontSize: _model.dropDowCityOrVilValue ==
                                                      null ||
                                                  _model.dropDowCityOrVilValue ==
                                                      ''
                                              ? 14.0
                                              : 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Тип населеного пункту...',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).stroke,
                                      size: 24.0,
                                    ),
                                    fillColor: _model.mouseRegionHovered3!
                                        ? Color(0xFFF0F1F3)
                                        : FlutterFlowTheme.of(context)
                                            .otherBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent3,
                                    borderWidth: 1.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        18.0, 0.0, 18.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onEnter: ((event) async {
                            setState(() => _model.mouseRegionHovered3 = true);
                          }),
                          onExit: ((event) async {
                            setState(() => _model.mouseRegionHovered3 = false);
                          }),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.21,
                          constraints: BoxConstraints(
                            minWidth: 210.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Form(
                            key: _model.formKey15,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.indexTextController ??=
                                    TextEditingController(
                                  text: columnPatientsRow?.addressPostIndex
                                      ?.toString(),
                                ),
                                focusNode: _model.indexFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.indexTextController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    if (_model.formKey15.currentState == null ||
                                        !_model.formKey15.currentState!
                                            .validate()) {
                                      return;
                                    }
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Індекс...',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Roboto',
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
                                          FlutterFlowTheme.of(context).accent2,
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
                                      .otherBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          18.0, 0.0, 18.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                                keyboardType: TextInputType.number,
                                validator: _model.indexTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.indexMask],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Wrap(
                  spacing: 30.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width < kBreakpointLarge
                          ? MediaQuery.sizeOf(context).width
                          : (MediaQuery.sizeOf(context).width * 0.44),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: Form(
                        key: _model.formKey18,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.oblastTextController ??=
                                TextEditingController(
                              text: columnPatientsRow?.addressOblast,
                            ),
                            focusNode: _model.oblastFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.oblastTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                if (_model.formKey18.currentState == null ||
                                    !_model.formKey18.currentState!
                                        .validate()) {
                                  return;
                                }
                              },
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'Область...',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Roboto',
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
                                  color: FlutterFlowTheme.of(context).accent2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
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
                              fillColor:
                                  FlutterFlowTheme.of(context).otherBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 18.0, 0.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.oblastTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width < kBreakpointLarge
                          ? MediaQuery.sizeOf(context).width
                          : (MediaQuery.sizeOf(context).width * 0.44),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: Form(
                        key: _model.formKey14,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.regionTextController ??=
                                TextEditingController(
                              text: columnPatientsRow?.addressRegion,
                            ),
                            focusNode: _model.regionFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.regionTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                if (_model.formKey14.currentState == null ||
                                    !_model.formKey14.currentState!
                                        .validate()) {
                                  return;
                                }
                              },
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'Район...',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Roboto',
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
                                  color: FlutterFlowTheme.of(context).accent2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
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
                              fillColor:
                                  FlutterFlowTheme.of(context).otherBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 18.0, 0.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.regionTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Wrap(
                    spacing: 30.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width:
                            MediaQuery.sizeOf(context).width < kBreakpointLarge
                                ? MediaQuery.sizeOf(context).width
                                : (MediaQuery.sizeOf(context).width * 0.44),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Form(
                          key: _model.formKey6,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.streetTextController ??=
                                  TextEditingController(
                                text: columnPatientsRow?.addressStreet,
                              ),
                              focusNode: _model.streetFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.streetTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  if (_model.formKey6.currentState == null ||
                                      !_model.formKey6.currentState!
                                          .validate()) {
                                    return;
                                  }
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelText: 'Вулиця...',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Roboto',
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
                                    color: FlutterFlowTheme.of(context).accent2,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    .otherBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model.streetTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 30.0,
                        runSpacing: 0.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.21,
                            constraints: BoxConstraints(
                              minWidth: 210.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Form(
                              key: _model.formKey13,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.buildNumTextController ??=
                                      TextEditingController(
                                    text: columnPatientsRow?.addressBuildingNum,
                                  ),
                                  focusNode: _model.buildNumFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.buildNumTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      if (_model.formKey13.currentState ==
                                              null ||
                                          !_model.formKey13.currentState!
                                              .validate()) {
                                        return;
                                      }
                                    },
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'Номер дому...',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
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
                                            .accent2,
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
                                        .otherBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 18.0, 0.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model
                                      .buildNumTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.21,
                            constraints: BoxConstraints(
                              minWidth: 210.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Form(
                              key: _model.formKey4,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.flatTextController ??=
                                      TextEditingController(
                                    text: columnPatientsRow?.addressFlatNum,
                                  ),
                                  focusNode: _model.flatFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.flatTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      if (_model.formKey4.currentState ==
                                              null ||
                                          !_model.formKey4.currentState!
                                              .validate()) {
                                        return;
                                      }
                                    },
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'Номер квартири...',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
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
                                            .accent2,
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
                                        .otherBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 18.0, 0.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model.flatTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Місце роботи або навчання',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Divider(
                                thickness: 1.5,
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Wrap(
                    spacing: 30.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.end,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width:
                            MediaQuery.sizeOf(context).width < kBreakpointLarge
                                ? MediaQuery.sizeOf(context).width
                                : (MediaQuery.sizeOf(context).width * 0.44),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Form(
                          key: _model.formKey9,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.workPlaceTextController ??=
                                  TextEditingController(
                                text: columnPatientsRow?.workPlace,
                              ),
                              focusNode: _model.workPlaceFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.workPlaceTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  if (_model.formKey9.currentState == null ||
                                      !_model.formKey9.currentState!
                                          .validate()) {
                                    return;
                                  }
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelText: 'Місце роботи (навчання)...',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Roboto',
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
                                    color: FlutterFlowTheme.of(context).accent2,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    .otherBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model.workPlaceTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width:
                            MediaQuery.sizeOf(context).width < kBreakpointLarge
                                ? MediaQuery.sizeOf(context).width
                                : (MediaQuery.sizeOf(context).width * 0.44),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Form(
                          key: _model.formKey12,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.workPositionTextController ??=
                                  TextEditingController(
                                text: columnPatientsRow?.workPosition,
                              ),
                              focusNode: _model.workPositionFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.workPositionTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  if (_model.formKey12.currentState == null ||
                                      !_model.formKey12.currentState!
                                          .validate()) {
                                    return;
                                  }
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelText: 'Посада...',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Roboto',
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
                                    color: FlutterFlowTheme.of(context).accent2,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    .otherBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model
                                  .workPositionTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Інші дані',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Divider(
                                thickness: 1.5,
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Wrap(
                    spacing: 30.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Wrap(
                        spacing: 30.0,
                        runSpacing: 0.0,
                        alignment: WrapAlignment.end,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 14.0,
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: _model.dropDownBloodGroupValue !=
                                              null &&
                                          _model.dropDownBloodGroupValue != '',
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Група крові',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.sizeOf(context).width <
                                            kBreakpointLarge
                                        ? MediaQuery.sizeOf(context).width
                                        : (MediaQuery.sizeOf(context).width *
                                            0.21),
                                    constraints: BoxConstraints(
                                      minWidth: 210.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropDownBloodGroupValueController ??=
                                          FormFieldController<String>(
                                        _model.dropDownBloodGroupValue ??=
                                            columnPatientsRow?.bloodGroup,
                                      ),
                                      options: FFAppState().bloodGroups,
                                      onChanged: (val) => setState(() =>
                                          _model.dropDownBloodGroupValue = val),
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: _model.dropDownBloodGroupValue ==
                                                        null ||
                                                    _model.dropDownBloodGroupValue ==
                                                        ''
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .info,
                                            fontSize:
                                                _model.dropDownBloodGroupValue ==
                                                            null ||
                                                        _model.dropDownBloodGroupValue ==
                                                            ''
                                                    ? 14.0
                                                    : 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Група крові...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).stroke,
                                        size: 24.0,
                                      ),
                                      fillColor: _model.mouseRegionHovered4!
                                          ? Color(0xFFF0F1F3)
                                          : FlutterFlowTheme.of(context)
                                              .otherBackground,
                                      elevation: 2.0,
                                      borderColor:
                                          FlutterFlowTheme.of(context).accent3,
                                      borderWidth: 1.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          18.0, 0.0, 18.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mouseRegionHovered4 = true);
                            }),
                            onExit: ((event) async {
                              setState(
                                  () => _model.mouseRegionHovered4 = false);
                            }),
                          ),
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 14.0,
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible:
                                          _model.dropDownBloodRhValue != null &&
                                              _model.dropDownBloodRhValue != '',
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Резус-приналежність',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.sizeOf(context).width <
                                            kBreakpointLarge
                                        ? MediaQuery.sizeOf(context).width
                                        : (MediaQuery.sizeOf(context).width *
                                            0.21),
                                    constraints: BoxConstraints(
                                      minWidth: 210.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropDownBloodRhValueController ??=
                                          FormFieldController<String>(
                                        _model.dropDownBloodRhValue ??=
                                            columnPatientsRow
                                                ?.bloodRhesusFactor,
                                      ),
                                      options: FFAppState().bloodRh,
                                      onChanged: (val) => setState(() =>
                                          _model.dropDownBloodRhValue = val),
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: _model.dropDownBloodRhValue ==
                                                        null ||
                                                    _model.dropDownBloodRhValue ==
                                                        ''
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .info,
                                            fontSize: _model.dropDownBloodRhValue ==
                                                        null ||
                                                    _model.dropDownBloodRhValue ==
                                                        ''
                                                ? 14.0
                                                : 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Резус-приналежність...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).stroke,
                                        size: 24.0,
                                      ),
                                      fillColor: _model.mouseRegionHovered5!
                                          ? Color(0xFFF0F1F3)
                                          : FlutterFlowTheme.of(context)
                                              .otherBackground,
                                      elevation: 2.0,
                                      borderColor:
                                          FlutterFlowTheme.of(context).accent3,
                                      borderWidth: 1.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          18.0, 0.0, 18.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mouseRegionHovered5 = true);
                            }),
                            onExit: ((event) async {
                              setState(
                                  () => _model.mouseRegionHovered5 = false);
                            }),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 30.0,
                        runSpacing: 0.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.21,
                            constraints: BoxConstraints(
                              minWidth: 210.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Form(
                              key: _model.formKey7,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.heightTextController ??=
                                      TextEditingController(
                                    text: columnPatientsRow?.patientHeight
                                        ?.toString(),
                                  ),
                                  focusNode: _model.heightFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.heightTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      if (_model.formKey7.currentState ==
                                              null ||
                                          !_model.formKey7.currentState!
                                              .validate()) {
                                        return;
                                      }
                                    },
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'Зріст, см...',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
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
                                            .accent2,
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
                                        .otherBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 18.0, 0.0),
                                    prefixIcon: Icon(
                                      Icons.height,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  keyboardType: TextInputType.number,
                                  validator: _model
                                      .heightTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Wrap(
                    spacing: 30.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge
                              ? MediaQuery.sizeOf(context).width
                              : (MediaQuery.sizeOf(context).width * 0.44),
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).accent2,
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.playlist_add_check_rounded,
                                  color: _model.isAlergyReactions == true
                                      ? FlutterFlowTheme.of(context).info
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 18.0, 0.0),
                                    child: Text(
                                      'Алергічні реакції',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: _model
                                                        .isAlergyReactions ==
                                                    true
                                                ? FlutterFlowTheme.of(context)
                                                    .info
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 18.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (_model.isAlergyReactions == false)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isAlergyReactions = true;
                                          setState(() {});
                                          setState(() {
                                            _model.allergyReactionsTextController
                                                    ?.text =
                                                columnPatientsRow!
                                                    .allergyReactionMedicaments!;
                                            _model.allergyReactionsTextController
                                                    ?.selection =
                                                TextSelection.collapsed(
                                                    offset: _model
                                                        .allergyReactionsTextController!
                                                        .text
                                                        .length);
                                          });
                                        },
                                        child: Container(
                                          width: 90.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .otherBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 0.0, 3.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.5, 0.0),
                                                  child: Text(
                                                    'Ні',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.85, 0.0),
                                                  child: Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x430B0D0F),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (_model.isAlergyReactions == true)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isAlergyReactions = false;
                                          setState(() {});
                                          setState(() {
                                            _model
                                                .allergyReactionsTextController
                                                ?.clear();
                                          });
                                        },
                                        child: Container(
                                          width: 90.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .otherBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 0.0, 3.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.5, 0.0),
                                                  child: Text(
                                                    'Так',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.85, 0.0),
                                                  child: Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x430B0D0F),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      shape: BoxShape.rectangle,
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
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.isAlergyReactions)
                            Container(
                              width: MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge
                                  ? MediaQuery.sizeOf(context).width
                                  : (MediaQuery.sizeOf(context).width * 0.44),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              child: Form(
                                key: _model.formKey2,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model
                                            .allergyReactionsTextController ??=
                                        TextEditingController(
                                      text: columnPatientsRow
                                          ?.allergyReactionMedicaments,
                                    ),
                                    focusNode: _model.allergyReactionsFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.allergyReactionsTextController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        if (_model.formKey2.currentState ==
                                                null ||
                                            !_model.formKey2.currentState!
                                                .validate()) {
                                          return;
                                        }
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText:
                                          'Назва засобу, характер дії...',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Roboto',
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
                                              .accent2,
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
                                          .otherBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              18.0, 0.0, 18.0, 0.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                    validator: _model
                                        .allergyReactionsTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          if (!_model.isAlergyReactions)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width <
                                        kBreakpointLarge
                                    ? MediaQuery.sizeOf(context).width
                                    : (MediaQuery.sizeOf(context).width * 0.44),
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 0.6,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  18.0, 0.0, 18.0, 0.0),
                                          child: Text(
                                            'Назва засобу, характер дії...',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Wrap(
                    spacing: 30.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge
                              ? MediaQuery.sizeOf(context).width
                              : (MediaQuery.sizeOf(context).width * 0.44),
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).accent2,
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.playlist_add_check,
                                  color: _model.isHIV == true
                                      ? FlutterFlowTheme.of(context).info
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 18.0, 0.0),
                                    child: Text(
                                      'Обстеження на ВІЛ-інфекцію',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: _model.isHIV == true
                                                ? FlutterFlowTheme.of(context)
                                                    .info
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 18.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (_model.isHIV == false)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isHIV = true;
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 90.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .otherBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 0.0, 3.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.5, 0.0),
                                                  child: Text(
                                                    'Ні',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.85, 0.0),
                                                  child: Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x430B0D0F),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (_model.isHIV == true)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isHIV = false;
                                          setState(() {});
                                          _model.hivDate = null;
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 90.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .otherBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 0.0, 3.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.5, 0.0),
                                                  child: Text(
                                                    'Так',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.85, 0.0),
                                                  child: Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x430B0D0F),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      shape: BoxShape.rectangle,
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
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Visibility(
                              visible: _model.isHIV,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 14.0,
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible: (_model.hivDate != null) ||
                                            (columnPatientsRow
                                                    ?.hivExaminationDate !=
                                                null),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  48.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Дата обстеження',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final _datePicked2Date =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: (() {
                                                if ((columnPatientsRow
                                                            ?.hivExaminationDate ==
                                                        null) &&
                                                    (_model.hivDate == null)) {
                                                  return getCurrentTimestamp;
                                                } else if ((_model.hivDate ==
                                                        null) &&
                                                    (columnPatientsRow
                                                            ?.hivExaminationDate !=
                                                        null)) {
                                                  return columnPatientsRow
                                                      ?.hivExaminationDate;
                                                } else {
                                                  return _model.hivDate;
                                                }
                                              }() ??
                                              DateTime.now()),
                                          firstDate: DateTime(1900),
                                          lastDate: (() {
                                                if ((columnPatientsRow
                                                            ?.hivExaminationDate ==
                                                        null) &&
                                                    (_model.hivDate == null)) {
                                                  return getCurrentTimestamp;
                                                } else if ((_model.hivDate ==
                                                        null) &&
                                                    (columnPatientsRow
                                                            ?.hivExaminationDate !=
                                                        null)) {
                                                  return columnPatientsRow
                                                      ?.hivExaminationDate;
                                                } else {
                                                  return _model.hivDate;
                                                }
                                              }() ??
                                              DateTime.now()),
                                          builder: (context, child) {
                                            return wrapInMaterialDatePickerTheme(
                                              context,
                                              child!,
                                              headerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              headerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              headerTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        fontSize: 32.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                              pickerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              pickerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              selectedDateTimeBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              selectedDateTimeForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              actionButtonForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 24.0,
                                            );
                                          },
                                        );

                                        if (_datePicked2Date != null) {
                                          safeSetState(() {
                                            _model.datePicked2 = DateTime(
                                              _datePicked2Date.year,
                                              _datePicked2Date.month,
                                              _datePicked2Date.day,
                                            );
                                          });
                                        }
                                        _model.hivDate = _model.datePicked2;
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointLarge
                                            ? MediaQuery.sizeOf(context).width
                                            : (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.44),
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: _model.mRhivHovered!
                                              ? Color(0xFFF0F1F3)
                                              : FlutterFlowTheme.of(context)
                                                  .otherBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.date_range_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                            Flexible(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 18.0, 0.0),
                                                  child: Text(
                                                    () {
                                                      if (columnPatientsRow
                                                              ?.hivExaminationDate ==
                                                          null) {
                                                        return valueOrDefault<
                                                            String>(
                                                          dateTimeFormat(
                                                            'dd/MM/yyyy',
                                                            _model.hivDate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          'Дата обстеження',
                                                        );
                                                      } else if ((columnPatientsRow
                                                                  ?.hivExaminationDate !=
                                                              null) &&
                                                          (_model.hivDate !=
                                                              null)) {
                                                        return valueOrDefault<
                                                            String>(
                                                          dateTimeFormat(
                                                            'dd/MM/yyyy',
                                                            _model.hivDate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          'Дата обстеження',
                                                        );
                                                      } else {
                                                        return dateTimeFormat(
                                                          'dd/MM/yyyy',
                                                          columnPatientsRow!
                                                              .hivExaminationDate!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        );
                                                      }
                                                    }(),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: (columnPatientsRow
                                                                              ?.hivExaminationDate ==
                                                                          null) &&
                                                                      (_model.hivDate ==
                                                                          null)
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              fontSize: (columnPatientsRow
                                                                              ?.hivExaminationDate ==
                                                                          null) &&
                                                                      (_model.hivDate ==
                                                                          null)
                                                                  ? 14.0
                                                                  : 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mRhivHovered = true);
                            }),
                            onExit: ((event) async {
                              setState(() => _model.mRhivHovered = false);
                            }),
                          ),
                          if (!_model.isHIV)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width <
                                        kBreakpointLarge
                                    ? MediaQuery.sizeOf(context).width
                                    : (MediaQuery.sizeOf(context).width * 0.44),
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 0.6,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.date_range_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        size: 24.0,
                                      ),
                                    ),
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 18.0, 0.0),
                                          child: Text(
                                            'Дата обстеження',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Wrap(
                    spacing: 30.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge
                              ? MediaQuery.sizeOf(context).width
                              : (MediaQuery.sizeOf(context).width * 0.44),
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).accent2,
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.playlist_add_check_rounded,
                                  color: _model.isVasermanReactionResult == true
                                      ? FlutterFlowTheme.of(context).info
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 18.0, 0.0),
                                    child: Text(
                                      'Реакція Васермана',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: _model
                                                        .isVasermanReactionResult ==
                                                    true
                                                ? FlutterFlowTheme.of(context)
                                                    .info
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 18.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (_model.isVasermanReactionResult ==
                                        false)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isVasermanReactionResult =
                                              true;
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 90.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .otherBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 0.0, 3.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.5, 0.0),
                                                  child: Text(
                                                    'Ні',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.85, 0.0),
                                                  child: Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x430B0D0F),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (_model.isVasermanReactionResult == true)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isVasermanReactionResult =
                                              false;
                                          setState(() {});
                                          _model.vassermanDate = null;
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 90.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .otherBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 0.0, 3.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.5, 0.0),
                                                  child: Text(
                                                    'Так',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.85, 0.0),
                                                  child: Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x430B0D0F),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      shape: BoxShape.rectangle,
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
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Visibility(
                              visible: _model.isVasermanReactionResult,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 14.0,
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible: (_model.vassermanDate !=
                                                null) ||
                                            (columnPatientsRow
                                                    ?.vasermanReactionDate !=
                                                null),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  48.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Дата обстеження',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final _datePicked3Date =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: (() {
                                                if ((columnPatientsRow
                                                            ?.vasermanReactionDate ==
                                                        null) &&
                                                    (_model.vassermanDate ==
                                                        null)) {
                                                  return getCurrentTimestamp;
                                                } else if ((_model
                                                            .vassermanDate ==
                                                        null) &&
                                                    (columnPatientsRow
                                                            ?.vasermanReactionDate !=
                                                        null)) {
                                                  return columnPatientsRow
                                                      ?.vasermanReactionDate;
                                                } else {
                                                  return _model.vassermanDate;
                                                }
                                              }() ??
                                              DateTime.now()),
                                          firstDate: DateTime(1900),
                                          lastDate: (() {
                                                if ((columnPatientsRow
                                                            ?.vasermanReactionDate ==
                                                        null) &&
                                                    (_model.vassermanDate ==
                                                        null)) {
                                                  return getCurrentTimestamp;
                                                } else if ((_model
                                                            .vassermanDate ==
                                                        null) &&
                                                    (columnPatientsRow
                                                            ?.vasermanReactionDate !=
                                                        null)) {
                                                  return columnPatientsRow
                                                      ?.vasermanReactionDate;
                                                } else {
                                                  return _model.vassermanDate;
                                                }
                                              }() ??
                                              DateTime.now()),
                                          builder: (context, child) {
                                            return wrapInMaterialDatePickerTheme(
                                              context,
                                              child!,
                                              headerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              headerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              headerTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        fontSize: 32.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                              pickerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              pickerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              selectedDateTimeBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              selectedDateTimeForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              actionButtonForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 24.0,
                                            );
                                          },
                                        );

                                        if (_datePicked3Date != null) {
                                          safeSetState(() {
                                            _model.datePicked3 = DateTime(
                                              _datePicked3Date.year,
                                              _datePicked3Date.month,
                                              _datePicked3Date.day,
                                            );
                                          });
                                        }
                                        _model.vassermanDate =
                                            _model.datePicked3;
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointLarge
                                            ? MediaQuery.sizeOf(context).width
                                            : (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.44),
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: _model.mRvasHovered!
                                              ? Color(0xFFF0F1F3)
                                              : FlutterFlowTheme.of(context)
                                                  .otherBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.date_range_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                            Flexible(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 18.0, 0.0),
                                                  child: Text(
                                                    () {
                                                      if (columnPatientsRow
                                                              ?.vasermanReactionDate ==
                                                          null) {
                                                        return valueOrDefault<
                                                            String>(
                                                          dateTimeFormat(
                                                            'dd/MM/yy',
                                                            _model
                                                                .vassermanDate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          'Дата обстеження',
                                                        );
                                                      } else if ((columnPatientsRow
                                                                  ?.vasermanReactionDate !=
                                                              null) &&
                                                          (_model.vassermanDate !=
                                                              null)) {
                                                        return valueOrDefault<
                                                            String>(
                                                          dateTimeFormat(
                                                            'dd/MM/yy',
                                                            _model
                                                                .vassermanDate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          'Дата обстеження',
                                                        );
                                                      } else {
                                                        return dateTimeFormat(
                                                          'dd/MM/yyyy',
                                                          columnPatientsRow!
                                                              .vasermanReactionDate!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        );
                                                      }
                                                    }(),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: (columnPatientsRow
                                                                              ?.vasermanReactionDate ==
                                                                          null) &&
                                                                      (_model.vassermanDate ==
                                                                          null)
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              fontSize: (columnPatientsRow
                                                                              ?.vasermanReactionDate ==
                                                                          null) &&
                                                                      (_model.vassermanDate ==
                                                                          null)
                                                                  ? 14.0
                                                                  : 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mRvasHovered = true);
                            }),
                            onExit: ((event) async {
                              setState(() => _model.mRvasHovered = false);
                            }),
                          ),
                          if (!_model.isVasermanReactionResult)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width <
                                        kBreakpointLarge
                                    ? MediaQuery.sizeOf(context).width
                                    : (MediaQuery.sizeOf(context).width * 0.44),
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 0.6,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.date_range_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        size: 24.0,
                                      ),
                                    ),
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 18.0, 0.0),
                                          child: Text(
                                            'Дата обстеження',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
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
                    ],
                  ),
                ),
                Wrap(
                  spacing: 30.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Container(
                        width:
                            MediaQuery.sizeOf(context).width < kBreakpointLarge
                                ? MediaQuery.sizeOf(context).width
                                : (MediaQuery.sizeOf(context).width * 0.44),
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).accent2,
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.blind_outlined,
                                color: _model.isInvalid == true
                                    ? FlutterFlowTheme.of(context).info
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 18.0, 0.0),
                                  child: Text(
                                    'Людина з обмеженими  можливостями (інвалідність)?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: _model.isInvalid == true
                                              ? FlutterFlowTheme.of(context)
                                                  .info
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 18.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (_model.isInvalid == false)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.isInvalid = true;
                                        setState(() {});
                                        setState(() {
                                          _model.invalidTypeTextController
                                                  ?.text =
                                              columnPatientsRow!.invalidType!;
                                          _model.invalidTypeTextController
                                                  ?.selection =
                                              TextSelection.collapsed(
                                                  offset: _model
                                                      .invalidTypeTextController!
                                                      .text
                                                      .length);
                                        });
                                      },
                                      child: Container(
                                        width: 90.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .otherBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 3.0),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.5, 0.0),
                                                child: Text(
                                                  'Ні',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.85, 0.0),
                                                child: Container(
                                                  width: 36.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x430B0D0F),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_model.isInvalid == true)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.isInvalid = false;
                                        setState(() {});
                                        setState(() {
                                          _model.invalidTypeTextController
                                              ?.clear();
                                        });
                                        setState(() {
                                          _model.dropDownInvalidValueController
                                              ?.reset();
                                        });
                                      },
                                      child: Container(
                                        width: 90.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .otherBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 3.0),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.5, 0.0),
                                                child: Text(
                                                  'Так',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.85, 0.0),
                                                child: Container(
                                                  width: 36.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x430B0D0F),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    shape: BoxShape.rectangle,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (_model.isInvalid)
                  Wrap(
                    spacing: 30.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 14.0,
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible:
                                      _model.dropDownInvalidValue != null &&
                                          _model.dropDownInvalidValue != '',
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        18.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Група інвалідності',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Rubik',
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width <
                                        kBreakpointLarge
                                    ? MediaQuery.sizeOf(context).width
                                    : (MediaQuery.sizeOf(context).width * 0.44),
                                decoration: BoxDecoration(),
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownInvalidValueController ??=
                                          FormFieldController<String>(
                                    _model.dropDownInvalidValue ??=
                                        columnPatientsRow?.invalidGroup,
                                  ),
                                  options: FFAppState().invalidGroups,
                                  onChanged: (val) => setState(
                                      () => _model.dropDownInvalidValue = val),
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: _model.dropDownInvalidValue ==
                                                    null ||
                                                _model.dropDownInvalidValue ==
                                                    ''
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context).info,
                                        fontSize: _model.dropDownInvalidValue ==
                                                    null ||
                                                _model.dropDownInvalidValue ==
                                                    ''
                                            ? 14.0
                                            : 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Група інвалідності...',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context).stroke,
                                    size: 24.0,
                                  ),
                                  fillColor: _model.mouseRegionHovered6!
                                      ? Color(0xFFF0F1F3)
                                      : FlutterFlowTheme.of(context)
                                          .otherBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).accent3,
                                  borderWidth: 1.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 0.0, 18.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => _model.mouseRegionHovered6 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegionHovered6 = false);
                        }),
                      ),
                      Container(
                        width:
                            MediaQuery.sizeOf(context).width < kBreakpointLarge
                                ? MediaQuery.sizeOf(context).width
                                : (MediaQuery.sizeOf(context).width * 0.44),
                        decoration: BoxDecoration(),
                        child: Form(
                          key: _model.formKey5,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.invalidTypeTextController ??=
                                  TextEditingController(
                                text: columnPatientsRow?.invalidType,
                              ),
                              focusNode: _model.invalidTypeFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.invalidTypeTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  if (_model.formKey5.currentState == null ||
                                      !_model.formKey5.currentState!
                                          .validate()) {
                                    return;
                                  }
                                },
                              ),
                              autofocus: _model.dropDownInvalidValue != null &&
                                  _model.dropDownInvalidValue != '',
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelText: 'Тип інвалідності...',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Roboto',
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
                                    color: FlutterFlowTheme.of(context).accent2,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    .otherBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model
                                  .invalidTypeTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 60.0),
                  child: Wrap(
                    spacing: 30.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.end,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge
                              ? MediaQuery.sizeOf(context).width
                              : (MediaQuery.sizeOf(context).width * 0.44),
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).accent2,
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.perm_identity_rounded,
                                  color: _model.isIdentified == true
                                      ? FlutterFlowTheme.of(context).info
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 18.0, 0.0),
                                    child: Text(
                                      'Пацієнт ідентифікований?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: _model.isIdentified == true
                                                ? FlutterFlowTheme.of(context)
                                                    .info
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 18.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (_model.isIdentified == false)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isIdentified = true;
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 90.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .otherBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 0.0, 3.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.5, 0.0),
                                                  child: Text(
                                                    'Ні',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.85, 0.0),
                                                  child: Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x430B0D0F),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (_model.isIdentified == true)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isIdentified = false;
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 90.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .otherBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 0.0, 3.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.5, 0.0),
                                                  child: Text(
                                                    'Так',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.85, 0.0),
                                                  child: Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x430B0D0F),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      shape: BoxShape.rectangle,
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 100.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await widget.setNotEditable?.call();
                          },
                          text: 'Відміна',
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
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey11.currentState == null ||
                                !_model.formKey11.currentState!.validate()) {
                              return;
                            }
                            if (_model.formKey1.currentState == null ||
                                !_model.formKey1.currentState!.validate()) {
                              return;
                            }
                            if (_model.formKey10.currentState == null ||
                                !_model.formKey10.currentState!.validate()) {
                              return;
                            }
                            await PatientsTable().update(
                              data: {
                                'gender': _model.dropDownGenderValue,
                                'patientFirstName':
                                    _model.firstNameTextController.text,
                                'patientLastName':
                                    _model.lastNameTextController.text,
                                'patientMiddleName':
                                    _model.middleNameTextController.text,
                                'patientDateOfBirth':
                                    supaSerialize<DateTime>(() {
                                  if (columnPatientsRow?.patientDateOfBirth ==
                                      null) {
                                    return _model.datePicked1;
                                  } else if ((columnPatientsRow
                                              ?.patientDateOfBirth !=
                                          null) &&
                                      (_model.datePicked1 != null)) {
                                    return _model.datePicked1;
                                  } else {
                                    return columnPatientsRow
                                        ?.patientDateOfBirth;
                                  }
                                }()),
                                'credentialDocument': _model
                                    .credentialDocumentTypeTextController.text,
                                'credentialDocumentId': _model
                                    .credentialDocumentTextController.text,
                                'citizenship': 804.0,
                                'addressPlaceName':
                                    _model.cityTextController.text,
                                'addressFlatNum':
                                    _model.flatTextController.text,
                                'addressBuildingNum':
                                    _model.buildNumTextController.text,
                                'addressOblast':
                                    _model.oblastTextController.text,
                                'addressRegion':
                                    _model.regionTextController.text,
                                'addressStreet':
                                    _model.streetTextController.text,
                                'addressType': _model.dropDowCityOrVilValue,
                                'addressPostIndex': int.tryParse(
                                    _model.indexTextController.text),
                                'workPlace':
                                    _model.workPlaceTextController.text,
                                'workPosition':
                                    _model.workPositionTextController.text,
                                'isInvalid': _model.isInvalid,
                                'invalidGroup': _model.isInvalid == false
                                    ? null
                                    : _model.dropDownInvalidValue,
                                'invalidType ': _model.isInvalid == false
                                    ? null
                                    : _model.invalidTypeTextController.text,
                                'bloodGroup ': _model.dropDownBloodGroupValue,
                                'bloodRhesusFactor':
                                    _model.dropDownBloodRhValue,
                                'isAllergyReactionMedicaments':
                                    _model.isAlergyReactions,
                                'allergyReactionMedicaments':
                                    _model.isAlergyReactions == false
                                        ? null
                                        : _model.allergyReactionsTextController
                                            .text,
                                'patientPhoneNumber':
                                    _model.youPhoneTextController.text,
                                'isHiv': _model.isHIV,
                                'hivExaminationDate': supaSerialize<DateTime>(
                                    _model.isHIV == false
                                        ? null
                                        : () {
                                            if (columnPatientsRow
                                                    ?.hivExaminationDate ==
                                                null) {
                                              return _model.hivDate;
                                            } else if ((columnPatientsRow
                                                        ?.hivExaminationDate !=
                                                    null) &&
                                                (_model.hivDate != null)) {
                                              return _model.hivDate;
                                            } else {
                                              return columnPatientsRow
                                                  ?.hivExaminationDate;
                                            }
                                          }()),
                                'isTobacco': false,
                                'isElectronicCigarettes': false,
                                'isAlcoholProblems': false,
                                'patientHeight': double.tryParse(
                                    _model.heightTextController.text),
                                'vasermanReactionDate': supaSerialize<DateTime>(
                                    _model.isVasermanReactionResult == false
                                        ? null
                                        : () {
                                            if (columnPatientsRow
                                                    ?.vasermanReactionDate ==
                                                null) {
                                              return _model.vassermanDate;
                                            } else if ((columnPatientsRow
                                                        ?.vasermanReactionDate !=
                                                    null) &&
                                                (_model.vassermanDate !=
                                                    null)) {
                                              return _model.vassermanDate;
                                            } else {
                                              return columnPatientsRow
                                                  ?.vasermanReactionDate;
                                            }
                                          }()),
                                'is_identified': _model.isIdentified,
                                'isInsurance': false,
                                'isVasermanReactionResult':
                                    _model.isVasermanReactionResult,
                              },
                              matchingRows: (rows) => rows.eq(
                                'id',
                                widget!.patientID,
                              ),
                            );
                            await widget.reloadPage?.call();

                            setState(() {});
                          },
                          text: 'Змінити дані',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondary,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
