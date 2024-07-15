import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/empty_lists/empty_list_search/empty_list_search_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/user_profile_item_searching/user_profile_item_searching_widget.dart';
import '/pages/user_to_patient_dialog/user_to_patient_dialog_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_profile_list_searching_model.dart';
export 'user_profile_list_searching_model.dart';

class UserProfileListSearchingWidget extends StatefulWidget {
  const UserProfileListSearchingWidget({
    super.key,
    required this.patientID,
    String? name,
    String? photoUrl,
  })  : this.name = name ?? 'name',
        this.photoUrl = photoUrl ??
            'https://oglmkpwpiottypmzxnzu.supabase.co/storage/v1/object/sign/avatars/noPhoto.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL25vUGhvdG8ucG5nIiwiaWF0IjoxNzEyNTczNzE3LCJleHAiOjIzNDMyOTM3MTd9.l64qIP6u3XEMFbOYNNtOv4s-Yhqu75BgdA1N4l8ZYdE&t=2024-04-08T10%3A55%3A17.333Z';

  final String? patientID;
  final String name;
  final String photoUrl;

  @override
  State<UserProfileListSearchingWidget> createState() =>
      _UserProfileListSearchingWidgetState();
}

class _UserProfileListSearchingWidgetState
    extends State<UserProfileListSearchingWidget> {
  late UserProfileListSearchingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileListSearchingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultUsersIni = await SearchUserProfileByParamCall.call(
        searchString: _model.textController.text,
        columnName: _model.dropDownValue,
      );

      if ((_model.apiResultUsersIni?.succeeded ?? true)) {
        _model.userProfileData = ((_model.apiResultUsersIni?.jsonBody ?? '')
                .toList()
                .map<UserProfilesDataStruct?>(
                    UserProfilesDataStruct.maybeFromMap)
                .toList() as Iterable<UserProfilesDataStruct?>)
            .withoutNulls
            .toList()
            .cast<UserProfilesDataStruct>();
        setState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          Container(
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: 80.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 45.0,
                                    decoration: BoxDecoration(),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??= 'check_number',
                                      ),
                                      options: List<String>.from([
                                        'check_number',
                                        'email',
                                        'google_name'
                                      ]),
                                      optionLabels: [
                                        'Ідентифікатор',
                                        'E-mail',
                                        'Ім\'я в Google'
                                      ],
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.dropDownValue = val);
                                        setState(() {
                                          _model.textController?.clear();
                                        });
                                        _model.apiResultUsersProfilesRes =
                                            await SearchUserProfileByParamCall
                                                .call(
                                          searchString:
                                              _model.textController.text,
                                          columnName: _model.dropDownValue,
                                        );

                                        if ((_model.apiResultUsersProfilesRes
                                                ?.succeeded ??
                                            true)) {
                                          _model.userProfileData = ((_model
                                                              .apiResultUsersProfilesRes
                                                              ?.jsonBody ??
                                                          '')
                                                      .toList()
                                                      .map<UserProfilesDataStruct?>(
                                                          UserProfilesDataStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      UserProfilesDataStruct?>)
                                              .withoutNulls
                                              .toList()
                                              .cast<UserProfilesDataStruct>();
                                          setState(() {});
                                        }

                                        setState(() {});
                                      },
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Please select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).stroke,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderWidth: 0.5,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          _model.apiResultUsersProfiles =
                                              await SearchUserProfileByParamCall
                                                  .call(
                                            searchString:
                                                _model.textController.text,
                                            columnName: _model.dropDownValue,
                                          );

                                          if ((_model.apiResultUsersProfiles
                                                  ?.succeeded ??
                                              true)) {
                                            _model.userProfileData = ((_model
                                                                .apiResultUsersProfiles
                                                                ?.jsonBody ??
                                                            '')
                                                        .toList()
                                                        .map<UserProfilesDataStruct?>(
                                                            UserProfilesDataStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        UserProfilesDataStruct?>)
                                                .withoutNulls
                                                .toList()
                                                .cast<UserProfilesDataStruct>();
                                            setState(() {});
                                          }

                                          setState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText: 'Пошук акаунту...',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        alignLabelWithHint: false,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                18.0, 0.0, 18.0, 0.0),
                                        prefixIcon: Icon(
                                          Icons.search,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: FlutterFlowChoiceChips(
                                        options: [
                                          ChipData('Всі'),
                                          ChipData('Не зареєстровані')
                                        ],
                                        onChanged: (val) => setState(() =>
                                            _model.choiceChipsValue =
                                                val?.firstOrNull),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          iconSize: 18.0,
                                          labelPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 1.0, 8.0, 1.0),
                                          elevation: 2.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          iconSize: 18.0,
                                          labelPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 1.0, 8.0, 1.0),
                                          elevation: 0.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                          borderWidth: 0.5,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        chipSpacing: 18.0,
                                        rowSpacing: 12.0,
                                        multiselect: false,
                                        initialized:
                                            _model.choiceChipsValue != null,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                          ['Не зареєстровані'],
                                        ),
                                        wrapped: true,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent4,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 14.0, 0.0),
                              child: Text(
                                'Пацієнт:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                widget!.name,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final userData = ((_model.choiceChipsValue ==
                                                'Не зареєстровані'
                                            ? functions
                                                .sortingUsersByCreatedDateDecreasing(
                                                    _model.userProfileData
                                                        .where((e) =>
                                                            e.roles.first ==
                                                            'userIN')
                                                        .toList())
                                            : functions
                                                .sortingUsersByCreatedDateDecreasing(
                                                    _model.userProfileData
                                                        .where((e) =>
                                                            e.roles.contains(
                                                                FFAppState()
                                                                    .patient) ==
                                                            false)
                                                        .toList()))
                                        ?.toList() ??
                                    [])
                                .take(20)
                                .toList();
                            if (userData.isEmpty) {
                              return EmptyListSearchWidget();
                            }

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: userData.length,
                              itemBuilder: (context, userDataIndex) {
                                final userDataItem = userData[userDataIndex];
                                return Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      Navigator.pop(context);
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointLarge) {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                                child:
                                                    UserToPatientDialogWidget(
                                                  patienName: widget!.name,
                                                  patientId: widget!.patientID!,
                                                  userId: userDataItem.id,
                                                  patientPhoto:
                                                      widget!.photoUrl,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.7,
                                                child:
                                                    UserToPatientDialogWidget(
                                                  patienName: widget!.name,
                                                  patientId: widget!.patientID!,
                                                  userId: userDataItem.id,
                                                  patientPhoto:
                                                      widget!.photoUrl,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      }
                                    },
                                    child: UserProfileItemSearchingWidget(
                                      key: Key(
                                          'Keyhz7_${userDataIndex}_of_${userData.length}'),
                                      userRow: userDataItem,
                                    ),
                                  ),
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
          ),
        ],
      ),
    );
  }
}
