import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'registered_users_model.dart';
export 'registered_users_model.dart';

class RegisteredUsersWidget extends StatefulWidget {
  const RegisteredUsersWidget({
    super.key,
    required this.userRow,
  });

  final UsersProfilesRow? userRow;

  @override
  State<RegisteredUsersWidget> createState() => _RegisteredUsersWidgetState();
}

class _RegisteredUsersWidgetState extends State<RegisteredUsersWidget> {
  late RegisteredUsersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisteredUsersModel());

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

    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: MouseRegion(
        opaque: false,
        cursor: SystemMouseCursors.click ?? MouseCursor.defer,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: _model.mouseRegionHovered!
                  ? FlutterFlowTheme.of(context).otherBackground
                  : FlutterFlowTheme.of(context).secondaryBackground,
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
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.easeOut,
                            width: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                valueOrDefault<String>(
                                  widget!.userRow?.photoUrl,
                                  'https://oglmkpwpiottypmzxnzu.supabase.co/storage/v1/object/sign/avatars/noPhoto.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL25vUGhvdG8ucG5nIiwiaWF0IjoxNzEyNTczNzE3LCJleHAiOjIzNDMyOTM3MTd9.l64qIP6u3XEMFbOYNNtOv4s-Yhqu75BgdA1N4l8ZYdE&t=2024-04-08T10%3A55%3A17.333Z',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.userRow?.googleName,
                                  'Name',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget!.userRow?.email,
                                'email',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final rolesList = FFAppState()
                                .AllRolesListDataType
                                .where((e) =>
                                    widget!.userRow?.roles?.contains(e.id) ==
                                    true)
                                .toList();

                            return Wrap(
                              spacing: 8.0,
                              runSpacing: 6.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(rolesList.length,
                                  (rolesListIndex) {
                                final rolesListItem = rolesList[rolesListIndex];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).table,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 6.0, 12.0, 6.0),
                                    child: Text(
                                      rolesListItem.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                        ))
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: Text(
                                dateTimeFormat(
                                  'd MMMM y🔹HH:mm',
                                  widget!.userRow!.createdAt!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
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