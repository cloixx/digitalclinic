import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/info_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_receptionist_model.dart';
export 'home_page_receptionist_model.dart';

class HomePageReceptionistWidget extends StatefulWidget {
  const HomePageReceptionistWidget({
    Key? key,
    Color? color,
  })  : this.color = color ?? const Color(0xFF04223F),
        super(key: key);

  final Color color;

  @override
  _HomePageReceptionistWidgetState createState() =>
      _HomePageReceptionistWidgetState();
}

class _HomePageReceptionistWidgetState
    extends State<HomePageReceptionistWidget> {
  late HomePageReceptionistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageReceptionistModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<RolesRecord>>(
      stream: queryRolesRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<RolesRecord> homePageReceptionistRolesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final homePageReceptionistRolesRecord =
            homePageReceptionistRolesRecordList.isNotEmpty
                ? homePageReceptionistRolesRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 2.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFB2D7D6),
                            border: Border.all(
                              width: 0.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (currentUserPhoto == null ||
                                  currentUserPhoto == '')
                                AuthUserStreamWidget(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 38.0,
                                    borderWidth: 1.0,
                                    buttonSize: 42.0,
                                    fillColor: Color(0xFF6488AD),
                                    icon: FaIcon(
                                      FontAwesomeIcons.user,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 16.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x00000000),
                                        enableDrag: false,
                                        context: context,
                                        builder: (bottomSheetContext) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .requestFocus(_unfocusNode),
                                            child: Padding(
                                              padding: MediaQuery.of(
                                                      bottomSheetContext)
                                                  .viewInsets,
                                              child: InfoWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                  ),
                                ),
                              if (currentUserPhoto != null &&
                                  currentUserPhoto != '')
                                AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x00000000),
                                        enableDrag: false,
                                        context: context,
                                        builder: (bottomSheetContext) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .requestFocus(_unfocusNode),
                                            child: Padding(
                                              padding: MediaQuery.of(
                                                      bottomSheetContext)
                                                  .viewInsets,
                                              child: InfoWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Container(
                                      width: 42.0,
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x4DFFFFFF),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            currentUserPhoto,
                                          ).image,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      await authManager.signOut();
                                      GoRouter.of(context)
                                          .clearRedirectLocation();

                                      context.goNamedAuth(
                                          'OnboardingPage', mounted);
                                    },
                                    text: 'LogOut',
                                    options: FFButtonOptions(
                                      width: 130.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFB2D7D6),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
