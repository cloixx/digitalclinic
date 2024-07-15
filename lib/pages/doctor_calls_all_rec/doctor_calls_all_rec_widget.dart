import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_list_search/empty_list_search_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/new_call_for_doctor_small/new_call_for_doctor_small_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'doctor_calls_all_rec_model.dart';
export 'doctor_calls_all_rec_model.dart';

class DoctorCallsAllRecWidget extends StatefulWidget {
  const DoctorCallsAllRecWidget({
    super.key,
    required this.department,
  });

  final int? department;

  @override
  State<DoctorCallsAllRecWidget> createState() =>
      _DoctorCallsAllRecWidgetState();
}

class _DoctorCallsAllRecWidgetState extends State<DoctorCallsAllRecWidget> {
  late DoctorCallsAllRecModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoctorCallsAllRecModel());

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
        children: [
          Align(
            alignment: AlignmentDirectional(1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 44.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          FutureBuilder<List<LogDoctorRecCallsRow>>(
            future: LogDoctorRecCallsTable().queryRows(
              queryFn: (q) => q
                  .eq(
                    'department',
                    widget!.department,
                  )
                  .order('created_at'),
              limit: 20,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<LogDoctorRecCallsRow> containerLogDoctorRecCallsRowList =
                  snapshot.data!;

              return Container(
                constraints: BoxConstraints(
                  minHeight: 260.0,
                  maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: FlutterFlowTheme.of(context).shadow,
                      offset: Offset(
                        0.0,
                        1.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final listOfCalls =
                                    containerLogDoctorRecCallsRowList.toList();
                                if (listOfCalls.isEmpty) {
                                  return EmptyListSearchWidget();
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listOfCalls.length,
                                  itemBuilder: (context, listOfCallsIndex) {
                                    final listOfCallsItem =
                                        listOfCalls[listOfCallsIndex];
                                    return NewCallForDoctorSmallWidget(
                                      key: Key(
                                          'Keyr3m_${listOfCallsIndex}_of_${listOfCalls.length}'),
                                      callRow: listOfCallsItem,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
