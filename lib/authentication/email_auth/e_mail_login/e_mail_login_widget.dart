import '/components/e_mail_login_form_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'e_mail_login_model.dart';
export 'e_mail_login_model.dart';

class EMailLoginWidget extends StatefulWidget {
  const EMailLoginWidget({Key? key}) : super(key: key);

  @override
  _EMailLoginWidgetState createState() => _EMailLoginWidgetState();
}

class _EMailLoginWidgetState extends State<EMailLoginWidget> {
  late EMailLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EMailLoginModel());

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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF2D3E4F),
          automaticallyImplyLeading: false,
          title: Text(
            'E-mail Login',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: wrapWithModel(
          model: _model.eMailLoginFormModel,
          updateCallback: () => setState(() {}),
          child: EMailLoginFormWidget(),
        ),
      ),
    );
  }
}
