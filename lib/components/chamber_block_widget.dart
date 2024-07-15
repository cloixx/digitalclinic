import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chamber_block_model.dart';
export 'chamber_block_model.dart';

class ChamberBlockWidget extends StatefulWidget {
  const ChamberBlockWidget({
    super.key,
    required this.chamberNumber,
    required this.id,
  });

  final int? chamberNumber;
  final int? id;

  @override
  State<ChamberBlockWidget> createState() => _ChamberBlockWidgetState();
}

class _ChamberBlockWidgetState extends State<ChamberBlockWidget> {
  late ChamberBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChamberBlockModel());

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

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: Container(
        width: 120.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: () {
            if (widget!.id == FFAppState().selectedItem) {
              return FlutterFlowTheme.of(context).secondary;
            } else if (_model.mouseRegionHovered!) {
              return FlutterFlowTheme.of(context).secondary;
            } else {
              return FlutterFlowTheme.of(context).primary;
            }
          }(),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: _model.mouseRegionHovered!
                ? FlutterFlowTheme.of(context).accent1
                : Color(0x00000000),
            width: 1.0,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            widget!.chamberNumber!.toString(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
      }),
    );
  }
}
