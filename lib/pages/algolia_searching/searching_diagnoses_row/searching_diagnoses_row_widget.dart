import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'searching_diagnoses_row_model.dart';
export 'searching_diagnoses_row_model.dart';

class SearchingDiagnosesRowWidget extends StatefulWidget {
  const SearchingDiagnosesRowWidget({
    super.key,
    String? code,
    String? description,
    required this.addRowData,
  })  : this.code = code ?? 'null',
        this.description = description ?? 'null';

  final String code;
  final String description;
  final Future Function()? addRowData;

  @override
  State<SearchingDiagnosesRowWidget> createState() =>
      _SearchingDiagnosesRowWidgetState();
}

class _SearchingDiagnosesRowWidgetState
    extends State<SearchingDiagnosesRowWidget> {
  late SearchingDiagnosesRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchingDiagnosesRowModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click ?? MouseCursor.defer,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await widget.addRowData?.call();
        },
        child: Container(
          decoration: BoxDecoration(
            color: _model.areaColor,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                  child: Text(
                    widget!.code,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: _model.textColor,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Flexible(
                  child: Text(
                    widget!.description,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: _model.textColor,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
        _model.areaColor = FlutterFlowTheme.of(context).primaryBackground;
        setState(() {});
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
        _model.areaColor = null;
        setState(() {});
      }),
    );
  }
}
