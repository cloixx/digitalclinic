import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/empty_lists/empty_list_search/empty_list_search_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/algolia_searching/searching_diagnoses_row/searching_diagnoses_row_widget.dart';
import '/backend/schema/structs/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'searching_diagnoses_model.dart';
export 'searching_diagnoses_model.dart';

class SearchingDiagnosesWidget extends StatefulWidget {
  const SearchingDiagnosesWidget({
    super.key,
    this.initialValue,
    required this.setData,
  });

  final String? initialValue;
  final Future Function(String? code, String? description)? setData;

  @override
  State<SearchingDiagnosesWidget> createState() =>
      _SearchingDiagnosesWidgetState();
}

class _SearchingDiagnosesWidgetState extends State<SearchingDiagnosesWidget> {
  late SearchingDiagnosesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchingDiagnosesModel());

    _model.textController ??= TextEditingController(text: widget!.initialValue);
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
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 40.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 1000),
                                    () async {
                                      _model.apiResultyge =
                                          await AlgoliaDiagnosesGETCall.call(
                                        searchData: _model.textController.text,
                                      );

                                      if ((_model.apiResultyge?.succeeded ??
                                          true)) {
                                        _model.searchData =
                                            AlgoliaDiagnosesGETCall.hits(
                                          (_model.apiResultyge?.jsonBody ?? ''),
                                        )!
                                                .map((e) => DiagnosesStruct
                                                    .maybeFromMap(e))
                                                .withoutNulls
                                                .toList()
                                                .cast<DiagnosesStruct>();
                                        setState(() {});
                                      }

                                      setState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'Пошук коду за МКХ-10',
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
                                    suffixIcon: _model
                                            .textController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.textController?.clear();
                                              _model.apiResultyge =
                                                  await AlgoliaDiagnosesGETCall
                                                      .call(
                                                searchData:
                                                    _model.textController.text,
                                              );

                                              if ((_model.apiResultyge
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.searchData =
                                                    AlgoliaDiagnosesGETCall
                                                            .hits(
                                                  (_model.apiResultyge
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .map((e) =>
                                                            DiagnosesStruct
                                                                .maybeFromMap(
                                                                    e))
                                                        .withoutNulls
                                                        .toList()
                                                        .cast<
                                                            DiagnosesStruct>();
                                                setState(() {});
                                              }

                                              setState(() {});
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await widget.setData?.call(
                                  _model.selectedCode,
                                  valueOrDefault<String>(
                                    _model.selectedDescription,
                                    'null',
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              text: 'Додати',
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 20.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final searchDataR =
                                _model.searchData.toList().take(20).toList();
                            if (searchDataR.isEmpty) {
                              return EmptyListSearchWidget();
                            }

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: searchDataR.length,
                              itemBuilder: (context, searchDataRIndex) {
                                final searchDataRItem =
                                    searchDataR[searchDataRIndex];
                                return wrapWithModel(
                                  model: _model.searchingDiagnosesRowModels
                                      .getModel(
                                    searchDataRIndex.toString(),
                                    searchDataRIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  child: SearchingDiagnosesRowWidget(
                                    key: Key(
                                      'Keyur2_${searchDataRIndex.toString()}',
                                    ),
                                    code: searchDataRItem.code,
                                    description: searchDataRItem.descriptionUa,
                                    addRowData: () async {
                                      setState(() {
                                        _model.textController?.text =
                                            '${searchDataRItem.code} ${searchDataRItem.descriptionUa}';
                                        _model.textController?.selection =
                                            TextSelection.collapsed(
                                                offset: _model.textController!
                                                    .text.length);
                                      });
                                      _model.selectedCode =
                                          searchDataRItem.code;
                                      _model.selectedDescription =
                                          searchDataRItem.descriptionUa;
                                      setState(() {});
                                    },
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
