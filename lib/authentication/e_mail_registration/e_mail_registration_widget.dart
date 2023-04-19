import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'e_mail_registration_model.dart';
export 'e_mail_registration_model.dart';

class EMailRegistrationWidget extends StatefulWidget {
  const EMailRegistrationWidget({Key? key}) : super(key: key);

  @override
  _EMailRegistrationWidgetState createState() =>
      _EMailRegistrationWidgetState();
}

class _EMailRegistrationWidgetState extends State<EMailRegistrationWidget> {
  late EMailRegistrationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EMailRegistrationModel());

    _model.eMailFieldController ??= TextEditingController();
    _model.passwordFieldController ??= TextEditingController();
    _model.passwordFieldConfirmController ??= TextEditingController();
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
            'E-mail Registration',
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 2.0, 32.0, 0.0),
              child: TextFormField(
                controller: _model.eMailFieldController,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6488AD),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6488AD),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Open Sans',
                      fontSize: 16.0,
                    ),
                keyboardType: TextInputType.emailAddress,
                validator:
                    _model.eMailFieldControllerValidator.asValidator(context),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
              child: TextFormField(
                controller: _model.passwordFieldController,
                autofocus: true,
                obscureText: !_model.passwordFieldVisibility,
                decoration: InputDecoration(
                  labelText: 'Введіть пароль',
                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6488AD),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6488AD),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () => _model.passwordFieldVisibility =
                          !_model.passwordFieldVisibility,
                    ),
                    focusNode: FocusNode(skipTraversal: true),
                    child: Icon(
                      _model.passwordFieldVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Color(0xFF757575),
                      size: 22.0,
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Open Sans',
                      fontSize: 16.0,
                    ),
                keyboardType: TextInputType.visiblePassword,
                validator: _model.passwordFieldControllerValidator
                    .asValidator(context),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
              child: TextFormField(
                controller: _model.passwordFieldConfirmController,
                autofocus: true,
                obscureText: !_model.passwordFieldConfirmVisibility,
                decoration: InputDecoration(
                  labelText: 'Повторіть пароль',
                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6488AD),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6488AD),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () => _model.passwordFieldConfirmVisibility =
                          !_model.passwordFieldConfirmVisibility,
                    ),
                    focusNode: FocusNode(skipTraversal: true),
                    child: Icon(
                      _model.passwordFieldConfirmVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Color(0xFF757575),
                      size: 22.0,
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Open Sans',
                      fontSize: 16.0,
                    ),
                keyboardType: TextInputType.visiblePassword,
                validator: _model.passwordFieldConfirmControllerValidator
                    .asValidator(context),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 20.0, 32.0, 32.0),
              child: FFButtonWidget(
                onPressed: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  if (_model.passwordFieldController.text !=
                      _model.passwordFieldConfirmController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Passwords don\'t match!',
                        ),
                      ),
                    );
                    return;
                  }

                  final user = await authManager.createAccountWithEmail(
                    context,
                    _model.eMailFieldController.text,
                    _model.passwordFieldController.text,
                  );
                  if (user == null) {
                    return;
                  }

                  context.pushNamedAuth('E-mailLogin', mounted);
                },
                text: 'Реєстрація',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 55.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF2D3E4F),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  elevation: 10.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
