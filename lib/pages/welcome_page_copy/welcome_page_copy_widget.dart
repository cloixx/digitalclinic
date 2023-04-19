import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_page_copy_model.dart';
export 'welcome_page_copy_model.dart';

class WelcomePageCopyWidget extends StatefulWidget {
  const WelcomePageCopyWidget({Key? key}) : super(key: key);

  @override
  _WelcomePageCopyWidgetState createState() => _WelcomePageCopyWidgetState();
}

class _WelcomePageCopyWidgetState extends State<WelcomePageCopyWidget> {
  late WelcomePageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomePageCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.role, '') == 'patient') {
        context.pushNamed('HomePagePatient');
      } else {
        if (valueOrDefault(currentUserDocument?.role, '') == 'orderly') {
          context.pushNamed('HomePageOrderly');
        } else {
          if (valueOrDefault(currentUserDocument?.role, '') == 'doctor') {
            context.pushNamed('HomePageDoctor');
          } else {
            if (valueOrDefault(currentUserDocument?.role, '') == 'nurse') {
              context.pushNamed('HomePageNurse');
            } else {
              if (valueOrDefault(currentUserDocument?.role, '') == 'orderly') {
                context.pushNamed('HomePageOrderly');
              } else {
                if (valueOrDefault(currentUserDocument?.role, '') == 'ceo') {
                  context.pushNamed('HomePageCEO');
                } else {
                  if (valueOrDefault(currentUserDocument?.role, '') ==
                      'medicalceo') {
                    context.pushNamed('HomePageMedicalCEO');
                  } else {
                    if (valueOrDefault(currentUserDocument?.role, '') ==
                        'admin') {
                      context.pushNamed('HomePageAdmin');
                    } else {
                      context.pushNamed('HomePageLoggedNoRole');
                    }
                  }
                }
              }
            }
          }
        }
      }
    });

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
            'Welcome to Digital Cinic!',
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
      ),
    );
  }
}
