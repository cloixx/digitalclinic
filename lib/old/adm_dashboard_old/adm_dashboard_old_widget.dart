import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/old/user_list1/user_list1_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'adm_dashboard_old_model.dart';
export 'adm_dashboard_old_model.dart';

class AdmDashboardOldWidget extends StatefulWidget {
  const AdmDashboardOldWidget({super.key});

  @override
  State<AdmDashboardOldWidget> createState() => _AdmDashboardOldWidgetState();
}

class _AdmDashboardOldWidgetState extends State<AdmDashboardOldWidget> {
  late AdmDashboardOldModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdmDashboardOldModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FFAppState().roleColor,
            automaticallyImplyLeading: false,
            title: Text(
              'Authorized - Admin',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Rubik',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: wrapWithModel(
              model: _model.userList1Model,
              updateCallback: () => setState(() {}),
              child: UserList1Widget(),
            ),
          ),
        ),
      ),
    );
  }
}
