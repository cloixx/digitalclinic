import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_desktop_left_model.dart';
export 'menu_desktop_left_model.dart';

class MenuDesktopLeftWidget extends StatefulWidget {
  const MenuDesktopLeftWidget({Key? key}) : super(key: key);

  @override
  _MenuDesktopLeftWidgetState createState() => _MenuDesktopLeftWidgetState();
}

class _MenuDesktopLeftWidgetState extends State<MenuDesktopLeftWidget>
    with TickerProviderStateMixin {
  late MenuDesktopLeftModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: Offset(-100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: Offset(-100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuDesktopLeftModel());

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
      width: _model.compactMenuDeskLeft! ? 57.0 : 250.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).lineColor,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_model.compactMenuDeskLeft == false)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              _model.compactMenuDeskLeft = true;
                            });
                          },
                          child: Container(
                            width: 30.0,
                            height: 38.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Icon(
                              Icons.menu_rounded,
                              color: Color(0x32222222),
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                    if (_model.compactMenuDeskLeft == true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            _model.updatePage(() {
                              _model.compactMenuDeskLeft = false;
                            });
                          },
                          child: Container(
                            width: 30.0,
                            height: 38.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Icon(
                              Icons.menu_rounded,
                              color: Color(0x32222222),
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                    if (_model.compactMenuDeskLeft == false)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Digital Clinic',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF399BEF),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Text(
                                'hr',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (_model.compactMenuDeskLeft == false)
                      InkWell(
                        onTap: () async {
                          _model.updatePage(() {
                            _model.compactMenuDeskLeft = true;
                          });
                        },
                        child: Container(
                          width: 22.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                            size: 22.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Divider(
                height: 20.0,
                thickness: 1.0,
                indent: 12.0,
                endIndent: 18.0,
              ),
              Container(
                width: double.infinity,
                height: 8.0,
                decoration: BoxDecoration(),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 46.0,
                  decoration: BoxDecoration(
                    color: Color(0x240069FF),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.gradient,
                          color: Color(0xFF399BEF),
                          size: 25.0,
                        ),
                        if (_model.compactMenuDeskLeft == false)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Dashboard',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 46.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.dashboard_customize,
                          color: Color(0xFF9CA1A5),
                          size: 25.0,
                        ),
                        if (_model.compactMenuDeskLeft == false)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Categorías',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF9CA1A5),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation1']!),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 46.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color(0xFF9CA1A5),
                          size: 25.0,
                        ),
                        if (_model.compactMenuDeskLeft == false)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Settings',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF9CA1A5),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation2']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
