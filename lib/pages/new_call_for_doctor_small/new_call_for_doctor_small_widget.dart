import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_call_for_doctor_small_model.dart';
export 'new_call_for_doctor_small_model.dart';

class NewCallForDoctorSmallWidget extends StatefulWidget {
  const NewCallForDoctorSmallWidget({
    super.key,
    required this.callRow,
  });

  final LogDoctorRecCallsRow? callRow;

  @override
  State<NewCallForDoctorSmallWidget> createState() =>
      _NewCallForDoctorSmallWidgetState();
}

class _NewCallForDoctorSmallWidgetState
    extends State<NewCallForDoctorSmallWidget> {
  late NewCallForDoctorSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewCallForDoctorSmallModel());

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
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: MouseRegion(
        opaque: false,
        cursor: SystemMouseCursors.click ?? MouseCursor.defer,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
          child: Container(
            height: 60.0,
            decoration: BoxDecoration(
              color: () {
                if (_model.mouseRegionHovered! &&
                    (widget!.callRow?.isCompleted == false)) {
                  return Color(0x2DED0423);
                } else if (widget!.callRow?.isCompleted == false) {
                  return Color(0x21ED0423);
                } else {
                  return FlutterFlowTheme.of(context).secondaryBackground;
                }
              }(),
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.0,
                  color: Color(0xFFF1F4F8),
                  offset: Offset(
                    0.0,
                    1.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 11,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.easeOut,
                            width: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.bell,
                              color: widget!.callRow?.isCompleted == false
                                  ? FlutterFlowTheme.of(context).tertiary
                                  : FlutterFlowTheme.of(context).primary,
                              size: 30.0,
                            ),
                          ),
                          Flexible(
                            child: Wrap(
                              spacing: 30.0,
                              runSpacing: 2.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Час виклику:  ',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: dateTimeFormat(
                                          'dd/MM  H:mm',
                                          widget!.callRow!.createdAt,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: widget!.callRow
                                                          ?.isCompleted ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .tertiary
                                                  : FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                if (widget!.callRow!.isCompleted! &&
                                    (widget!.callRow?.completedAt != null))
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Опрацьовано:  ',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: dateTimeFormat(
                                            'dd/MM  H:mm',
                                            widget!.callRow!.completedAt!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
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
          ),
        ),
        onEnter: ((event) async {
          setState(() => _model.mouseRegionHovered = true);
        }),
        onExit: ((event) async {
          setState(() => _model.mouseRegionHovered = false);
        }),
      ),
    );
  }
}
