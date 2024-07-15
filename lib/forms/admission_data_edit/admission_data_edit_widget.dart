import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/algolia_searching/searching_diagnoses/searching_diagnoses_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'admission_data_edit_model.dart';
export 'admission_data_edit_model.dart';

class AdmissionDataEditWidget extends StatefulWidget {
  const AdmissionDataEditWidget({
    super.key,
    required this.admissionID,
    required this.setNotEditable,
    required this.reloadPage,
  });

  final String? admissionID;
  final Future Function()? setNotEditable;
  final Future Function()? reloadPage;

  @override
  State<AdmissionDataEditWidget> createState() =>
      _AdmissionDataEditWidgetState();
}

class _AdmissionDataEditWidgetState extends State<AdmissionDataEditWidget> {
  late AdmissionDataEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdmissionDataEditModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.admissionDataRowsByAction = await AdmissionsTable().queryRows(
        queryFn: (q) => q.eq(
          'hadmID',
          widget!.admissionID,
        ),
      );
      _model.isIncapacityCertificateNeed = valueOrDefault<bool>(
        _model.admissionDataRowsByAction?.first?.isIncapacityCertificateNeed,
        false,
      );
      _model.isHospAgain = valueOrDefault<bool>(
        _model.admissionDataRowsByAction?.first?.isHospitality30Days,
        false,
      );
      _model.diagnosis =
          _model.admissionDataRowsByAction?.first?.diagnosisInName;
      _model.diagCode =
          _model.admissionDataRowsByAction?.first?.diagnosisInCode;
      _model.department = _model.admissionDataRowsByAction?.first?.departmentIn;
      setState(() {});
      setState(() {
        _model.diagnosisCodeTextController?.text = _model.diagCode!;
        _model.diagnosisCodeTextController?.selection = TextSelection.collapsed(
            offset: _model.diagnosisCodeTextController!.text.length);
      });
      setState(() {
        _model.departmentCodeTextController?.text =
            _model.department!.toString();
        _model.departmentCodeTextController?.selection =
            TextSelection.collapsed(
                offset: _model.departmentCodeTextController!.text.length);
      });
    });

    _model.reqFocusNode ??= FocusNode();

    _model.facilityFocusNode ??= FocusNode();

    _model.facilityCodeFocusNode ??= FocusNode();

    _model.diagnosisCodeTextController ??=
        TextEditingController(text: _model.diagCode);
    _model.diagnosisCodeFocusNode ??= FocusNode();

    _model.departmentCodeTextController ??=
        TextEditingController(text: _model.department?.toString());
    _model.departmentCodeFocusNode ??= FocusNode();

    _model.temperatureFocusNode ??= FocusNode();

    _model.pressFocusNode ??= FocusNode();

    _model.weightFocusNode ??= FocusNode();

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
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
        child: FutureBuilder<List<AdmissionsRow>>(
          future: AdmissionsTable().querySingleRow(
            queryFn: (q) => q.eq(
              'hadmID',
              widget!.admissionID,
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
            List<AdmissionsRow> columnAdmissionsRowList = snapshot.data!;

            final columnAdmissionsRow = columnAdmissionsRowList.isNotEmpty
                ? columnAdmissionsRowList.first
                : null;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge
                                ? MediaQuery.sizeOf(context).width
                                : (MediaQuery.sizeOf(context).width * 0.44),
                            decoration: BoxDecoration(),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.95,
                              child: Form(
                                key: _model.formKey5,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: TextFormField(
                                  controller: _model.reqTextController ??=
                                      TextEditingController(
                                    text: columnAdmissionsRow
                                        ?.medicalDirectionNumber
                                        ?.toString(),
                                  ),
                                  focusNode: _model.reqFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'Номер направлення',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                    alignLabelWithHint: false,
                                    hintText: '0000-0000-0000-0000',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
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
                                  keyboardType: TextInputType.phone,
                                  validator: _model.reqTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [_model.reqMask],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Ким направлений хворий',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 20.0, 0.0),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                          width: MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge
                              ? MediaQuery.sizeOf(context).width
                              : (MediaQuery.sizeOf(context).width * 0.44),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Form(
                            key: _model.formKey8,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.facilityTextController ??=
                                    TextEditingController(
                                  text: columnAdmissionsRow?.referalClinicName,
                                ),
                                focusNode: _model.facilityFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.facilityTextController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    if (_model.formKey8.currentState == null ||
                                        !_model.formKey8.currentState!
                                            .validate()) {
                                      return;
                                    }
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Заклад, який направив хворого...',
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
                                validator: _model
                                    .facilityTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge
                              ? MediaQuery.sizeOf(context).width
                              : (MediaQuery.sizeOf(context).width * 0.44),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Form(
                            key: _model.formKey3,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: TextFormField(
                                controller:
                                    _model.facilityCodeTextController ??=
                                        TextEditingController(
                                  text: columnAdmissionsRow?.referalClinicCode
                                      ?.toString(),
                                ),
                                focusNode: _model.facilityCodeFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.facilityCodeTextController',
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
                                  labelText: 'Код ЄДРПОУ...',
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
                                validator: _model
                                    .facilityCodeTextControllerValidator
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
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Діагноз при госпіталізації',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 20.0, 0.0),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            MouseRegion(
                              opaque: false,
                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                              child: Visibility(
                                visible: !((_model.diagnosis == null ||
                                        _model.diagnosis == '') ||
                                    (_model.diagnosis == 'null')),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 14.0,
                                        decoration: BoxDecoration(),
                                        child: Visibility(
                                          visible: _model.diagnosis != null &&
                                              _model.diagnosis != '',
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Діагноз',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.9,
                                                      child:
                                                          SearchingDiagnosesWidget(
                                                        initialValue:
                                                            _model.diagnosis,
                                                        setData: (code,
                                                            description) async {
                                                          _model.diagnosis =
                                                              description;
                                                          setState(() {});
                                                          if ((_model.diagnosis ==
                                                                      null ||
                                                                  _model.diagnosis ==
                                                                      '') ||
                                                              (_model.diagnosis ==
                                                                  'null')) {
                                                            _model.diagCode =
                                                                null;
                                                            setState(() {});
                                                            setState(() {
                                                              _model
                                                                  .diagnosisCodeTextController
                                                                  ?.clear();
                                                            });
                                                          } else {
                                                            _model.diagCode =
                                                                code;
                                                            setState(() {});
                                                            setState(() {
                                                              _model.diagnosisCodeTextController
                                                                      ?.text =
                                                                  _model
                                                                      .diagCode!;
                                                              _model.diagnosisCodeTextController
                                                                      ?.selection =
                                                                  TextSelection.collapsed(
                                                                      offset: _model
                                                                          .diagnosisCodeTextController!
                                                                          .text
                                                                          .length);
                                                            });
                                                          }
                                                        },
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
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.5,
                                                      child:
                                                          SearchingDiagnosesWidget(
                                                        initialValue:
                                                            _model.diagnosis,
                                                        setData: (code,
                                                            description) async {
                                                          _model.diagnosis =
                                                              description;
                                                          setState(() {});
                                                          if ((_model.diagnosis ==
                                                                      null ||
                                                                  _model.diagnosis ==
                                                                      '') ||
                                                              (_model.diagnosis ==
                                                                  'null')) {
                                                            _model.diagCode =
                                                                null;
                                                            setState(() {});
                                                            setState(() {
                                                              _model
                                                                  .diagnosisCodeTextController
                                                                  ?.clear();
                                                            });
                                                          } else {
                                                            _model.diagCode =
                                                                code;
                                                            setState(() {});
                                                            setState(() {
                                                              _model.diagnosisCodeTextController
                                                                      ?.text =
                                                                  _model
                                                                      .diagCode!;
                                                              _model.diagnosisCodeTextController
                                                                      ?.selection =
                                                                  TextSelection.collapsed(
                                                                      offset: _model
                                                                          .diagnosisCodeTextController!
                                                                          .text
                                                                          .length);
                                                            });
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointLarge
                                                ? MediaQuery.sizeOf(context)
                                                    .width
                                                : (MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.44),
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: _model.mRvasdHovered!
                                                  ? Color(0xFFF0F1F3)
                                                  : FlutterFlowTheme.of(context)
                                                      .otherBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  0.0,
                                                                  18.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          _model.diagnosis,
                                                          'null',
                                                        ),
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      16.0,
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onEnter: ((event) async {
                                setState(() => _model.mRvasdHovered = true);
                              }),
                              onExit: ((event) async {
                                setState(() => _model.mRvasdHovered = false);
                              }),
                            ),
                            MouseRegion(
                              opaque: false,
                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                              child: Visibility(
                                visible: (_model.diagnosis == null ||
                                        _model.diagnosis == '') ||
                                    (_model.diagnosis == 'null'),
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 0.0, 0.0),
                                    child: InkWell(
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
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  child:
                                                      SearchingDiagnosesWidget(
                                                    setData: (code,
                                                        description) async {
                                                      _model.diagnosis =
                                                          description;
                                                      _model.diagCode = code;
                                                      setState(() {});
                                                      setState(() {
                                                        _model.diagnosisCodeTextController
                                                                ?.text =
                                                            _model.diagCode!;
                                                        _model.diagnosisCodeTextController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .diagnosisCodeTextController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
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
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.5,
                                                  child:
                                                      SearchingDiagnosesWidget(
                                                    setData: (code,
                                                        description) async {
                                                      _model.diagnosis =
                                                          description;
                                                      _model.diagCode = code;
                                                      setState(() {});
                                                      setState(() {
                                                        _model.diagnosisCodeTextController
                                                                ?.text =
                                                            _model.diagCode!;
                                                        _model.diagnosisCodeTextController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .diagnosisCodeTextController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        }
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
                                          color: _model.diaHovered!
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
                                            Flexible(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          18.0, 0.0, 18.0, 0.0),
                                                  child: Text(
                                                    'Діагноз...',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                  ),
                                ),
                              ),
                              onEnter: ((event) async {
                                setState(() => _model.diaHovered = true);
                              }),
                              onExit: ((event) async {
                                setState(() => _model.diaHovered = false);
                              }),
                            ),
                          ],
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
                            key: _model.formKey6,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.diagnosisCodeTextController,
                                focusNode: _model.diagnosisCodeFocusNode,
                                autofocus: false,
                                readOnly: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Код за МКХ-10',
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
                                          FlutterFlowTheme.of(context).accent2,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
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
                                validator: _model
                                    .diagnosisCodeTextControllerValidator
                                    .asValidator(context),
                              ),
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
                                      _model.dropDowDepartmentValue != null,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        18.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Відділення при госпіталізації',
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
                                child: FlutterFlowDropDown<int>(
                                  controller: _model
                                          .dropDowDepartmentValueController ??=
                                      FormFieldController<int>(
                                    _model.dropDowDepartmentValue ??=
                                        _model.department,
                                  ),
                                  options: List<int>.from(FFAppState()
                                      .departments
                                      .map((e) => e.id)
                                      .toList()),
                                  optionLabels: FFAppState()
                                      .departments
                                      .map((e) => e.name)
                                      .toList(),
                                  onChanged: (val) async {
                                    setState(() =>
                                        _model.dropDowDepartmentValue = val);
                                    setState(() {
                                      _model.departmentCodeTextController
                                              ?.text =
                                          _model.dropDowDepartmentValue!
                                              .toString();
                                      _model.departmentCodeTextController
                                              ?.selection =
                                          TextSelection.collapsed(
                                              offset: _model
                                                  .departmentCodeTextController!
                                                  .text
                                                  .length);
                                    });
                                    _model.department =
                                        _model.dropDowDepartmentValue;
                                    setState(() {});
                                  },
                                  height: 50.0,
                                  searchHintTextStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            letterSpacing: 0.0,
                                          ),
                                  searchTextStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: _model.department == null
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context).info,
                                        fontSize: _model.department == null
                                            ? 14.0
                                            : 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Відділення при госпіталізації...',
                                  searchHintText: 'Введіть назву для пошуку...',
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
                                  isSearchable: true,
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
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.21,
                        constraints: BoxConstraints(
                          minWidth: 210.0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Form(
                          key: _model.formKey1,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.departmentCodeTextController,
                              focusNode: _model.departmentCodeFocusNode,
                              autofocus: false,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelText: 'Код відділення',
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
                                    color: FlutterFlowTheme.of(context).accent2,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent2,
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
                                  .departmentCodeTextControllerValidator
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
                                      _model.dropDowHospFirstOrNotValue != null,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        18.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Госпіталізація з приводу захворювання - вперше, чи повторно?',
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
                                constraints: BoxConstraints(
                                  minWidth: 250.0,
                                ),
                                decoration: BoxDecoration(),
                                child: FlutterFlowDropDown<bool>(
                                  controller: _model
                                          .dropDowHospFirstOrNotValueController ??=
                                      FormFieldController<bool>(
                                    _model.dropDowHospFirstOrNotValue ??=
                                        columnAdmissionsRow
                                            ?.isHospitalityThisYear,
                                  ),
                                  options: List<bool>.from([false, true]),
                                  optionLabels: ['вперше', 'повторно'],
                                  onChanged: (val) => setState(() =>
                                      _model.dropDowHospFirstOrNotValue = val),
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color:
                                            _model.dropDowHospFirstOrNotValue ==
                                                    null
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .info,
                                        fontSize:
                                            _model.dropDowHospFirstOrNotValue ==
                                                    null
                                                ? 14.0
                                                : 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText:
                                      'Госпіталізація з приводу цього захворювання в цьому році - вперше, чи повторно?',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context).stroke,
                                    size: 24.0,
                                  ),
                                  fillColor: _model.mouseRegionHovered2!
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
                          setState(() => _model.mouseRegionHovered2 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegionHovered2 = false);
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
                                  visible: (_model.dropDowPlanOrUrgentValue !=
                                          null) !=
                                      null,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        18.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Госпіталізація - планова або угрентна?',
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
                                constraints: BoxConstraints(
                                  minWidth: 250.0,
                                ),
                                decoration: BoxDecoration(),
                                child: FlutterFlowDropDown<bool>(
                                  controller: _model
                                          .dropDowPlanOrUrgentValueController ??=
                                      FormFieldController<bool>(
                                    _model.dropDowPlanOrUrgentValue ??=
                                        columnAdmissionsRow?.isAdmissionUrgent,
                                  ),
                                  options: List<bool>.from([false, true]),
                                  optionLabels: ['планова', 'ургентна'],
                                  onChanged: (val) => setState(() =>
                                      _model.dropDowPlanOrUrgentValue = val),
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: _model
                                                    .dropDowPlanOrUrgentValue ==
                                                null
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context).info,
                                        fontSize:
                                            _model.dropDowPlanOrUrgentValue ==
                                                    null
                                                ? 14.0
                                                : 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText:
                                      'Госпіталізація - планова або угрентна?',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context).stroke,
                                    size: 24.0,
                                  ),
                                  fillColor: _model.moHovered!
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
                          setState(() => _model.moHovered = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.moHovered = false);
                        }),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
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
                                        Icons.replay_30,
                                        color: _model.isHospAgain == true
                                            ? FlutterFlowTheme.of(context).info
                                            : FlutterFlowTheme.of(context)
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
                                            'Повторна госпіталізація з приводу цього захворювання до 30 днів?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color:
                                                      _model.isHospAgain == true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .info
                                                          : FlutterFlowTheme.of(
                                                                  context)
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (_model.isHospAgain == false)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.isHospAgain = true;
                                                setState(() {});
                                              },
                                              child: Container(
                                                width: 90.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .otherBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.5, 0.0),
                                                        child: Text(
                                                          'Ні',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                letterSpacing:
                                                                    0.0,
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x430B0D0F),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (_model.isHospAgain == true)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.isHospAgain = false;
                                                setState(() {});
                                              },
                                              child: Container(
                                                width: 90.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .otherBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.5, 0.0),
                                                        child: Text(
                                                          'Так',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                letterSpacing:
                                                                    0.0,
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x430B0D0F),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                            shape: BoxShape
                                                                .rectangle,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Інші дані (на момент госпіталізації)',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 20.0, 0.0),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                              decoration: BoxDecoration(),
                              child: Form(
                                key: _model.formKey7,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller:
                                        _model.temperatureTextController ??=
                                            TextEditingController(
                                      text: columnAdmissionsRow
                                          ?.patientBodyTemperatureIn
                                          ?.toString(),
                                    ),
                                    focusNode: _model.temperatureFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.temperatureTextController',
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
                                      labelText: 'Температура тіла, °C...',
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
                                      prefixIcon: Icon(
                                        Icons.device_thermostat,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .temperatureTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [_model.temperatureMask],
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
                                key: _model.formKey2,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.pressTextController ??=
                                        TextEditingController(
                                      text: columnAdmissionsRow
                                          ?.arterialPressureIn,
                                    ),
                                    focusNode: _model.pressFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.pressTextController',
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
                                      labelText: 'Артеріальний тиск...',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                      alignLabelWithHint: false,
                                      hintText: '120/80',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
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
                                      prefixIcon: Icon(
                                        Icons.radar_rounded,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .pressTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [_model.pressMask],
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
                                    controller: _model.weightTextController ??=
                                        TextEditingController(
                                      text: columnAdmissionsRow?.patientWeightIn
                                          ?.toString(),
                                    ),
                                    focusNode: _model.weightFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.weightTextController',
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
                                      labelText: 'Вага, кг...',
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
                                      prefixIcon: Icon(
                                        Icons.monitor_weight_outlined,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .weightTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [_model.weightMask],
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
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
                                    Icons.list_alt_rounded,
                                    color: _model.isIncapacityCertificateNeed ==
                                            true
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
                                        'Лікарняний  - потрібний, чи ні?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: _model
                                                          .isIncapacityCertificateNeed ==
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
                                      if (_model.isIncapacityCertificateNeed ==
                                          false)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.isIncapacityCertificateNeed =
                                                true;
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 90.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
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
                                                            color: Color(
                                                                0x430B0D0F),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (_model.isIncapacityCertificateNeed ==
                                          true)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.isIncapacityCertificateNeed =
                                                false;
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 90.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
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
                                                            color: Color(
                                                                0x430B0D0F),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                        shape:
                                                            BoxShape.rectangle,
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
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
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
                              await AdmissionsTable().update(
                                data: {
                                  'isHospitalityThisYear':
                                      _model.dropDowHospFirstOrNotValue,
                                  'isHospitality30Days': _model.isHospAgain,
                                  'referalClinicName':
                                      _model.facilityTextController.text,
                                  'referalClinicCode': double.tryParse(
                                      _model.facilityCodeTextController.text),
                                  'patientWeightIn': int.tryParse(
                                      _model.weightTextController.text),
                                  'diagnosisInCode':
                                      _model.diagnosisCodeTextController.text,
                                  'diagnosisInName': _model.diagnosis,
                                  'medicalDirectionNumber': double.tryParse(
                                      _model.reqTextController.text),
                                  'departmentIn': _model.dropDowDepartmentValue,
                                  'patientBodyTemperatureIn': double.tryParse(
                                      _model.temperatureTextController.text),
                                  'arterialPressureIn':
                                      _model.pressTextController.text,
                                  'isIncapacityCertificateNeed':
                                      _model.isIncapacityCertificateNeed,
                                  'isAdmissionUrgent':
                                      _model.dropDowPlanOrUrgentValue,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'hadmID',
                                  widget!.admissionID,
                                ),
                              );
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Дані успішно змінено'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              await widget.reloadPage?.call();
                            },
                            text: 'Змінити дані',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
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
      ),
    );
  }
}
