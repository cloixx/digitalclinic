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
import 'user_profile_list_searching_widget.dart'
    show UserProfileListSearchingWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfileListSearchingModel
    extends FlutterFlowModel<UserProfileListSearchingWidget> {
  ///  Local state fields for this component.

  List<UserProfilesDataStruct> userProfileData = [];
  void addToUserProfileData(UserProfilesDataStruct item) =>
      userProfileData.add(item);
  void removeFromUserProfileData(UserProfilesDataStruct item) =>
      userProfileData.remove(item);
  void removeAtIndexFromUserProfileData(int index) =>
      userProfileData.removeAt(index);
  void insertAtIndexInUserProfileData(int index, UserProfilesDataStruct item) =>
      userProfileData.insert(index, item);
  void updateUserProfileDataAtIndex(
          int index, Function(UserProfilesDataStruct) updateFn) =>
      userProfileData[index] = updateFn(userProfileData[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (searchUserProfileByParam)] action in userProfileListSearching widget.
  ApiCallResponse? apiResultUsersIni;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (searchUserProfileByParam)] action in DropDown widget.
  ApiCallResponse? apiResultUsersProfilesRes;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (searchUserProfileByParam)] action in TextField widget.
  ApiCallResponse? apiResultUsersProfiles;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
