import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'e_mail_login_form_model.dart';
export 'e_mail_login_form_model.dart';

class EMailLoginFormWidget extends StatefulWidget {
  const EMailLoginFormWidget({super.key});

  @override
  State<EMailLoginFormWidget> createState() => _EMailLoginFormWidgetState();
}

class _EMailLoginFormWidgetState extends State<EMailLoginFormWidget> {
  late EMailLoginFormModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EMailLoginFormModel());

    _model.eMailFieldTextController ??= TextEditingController();
    _model.eMailFieldFocusNode ??= FocusNode();

    _model.passwordFieldTextController ??= TextEditingController();
    _model.passwordFieldFocusNode ??= FocusNode();

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 32.0, 0.0),
            child: TextFormField(
              controller: _model.eMailFieldTextController,
              focusNode: _model.eMailFieldFocusNode,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'E-mail',
                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
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
                    letterSpacing: 0.0,
                  ),
              keyboardType: TextInputType.emailAddress,
              validator:
                  _model.eMailFieldTextControllerValidator.asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32.0, 22.0, 32.0, 0.0),
            child: TextFormField(
              controller: _model.passwordFieldTextController,
              focusNode: _model.passwordFieldFocusNode,
              autofocus: true,
              obscureText: !_model.passwordFieldVisibility,
              decoration: InputDecoration(
                labelText: 'Пароль',
                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
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
                    letterSpacing: 0.0,
                  ),
              keyboardType: TextInputType.visiblePassword,
              validator: _model.passwordFieldTextControllerValidator
                  .asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32.0, 12.0, 32.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Реєстрація',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  'Забули пароль?',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: Color(0xFF4B4B4B),
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32.0, 20.0, 32.0, 32.0),
            child: FFButtonWidget(
              onPressed: () async {
                GoRouter.of(context).prepareAuthEvent();

                final user = await authManager.signInWithEmail(
                  context,
                  _model.eMailFieldTextController.text,
                  _model.passwordFieldTextController.text,
                );
                if (user == null) {
                  return;
                }

                context.goNamedAuth('WelcomePage', context.mounted);
              },
              text: 'Вхід',
              options: FFButtonOptions(
                width: double.infinity,
                height: 55.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFF2D3E4F),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                      letterSpacing: 0.0,
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
    );
  }
}
