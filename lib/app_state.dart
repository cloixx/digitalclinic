import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _CompactMenuDeskLeft =
          prefs.getBool('ff_CompactMenuDeskLeft') ?? _CompactMenuDeskLeft;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _AccessToken = '';
  String get AccessToken => _AccessToken;
  set AccessToken(String value) {
    _AccessToken = value;
  }

  bool _CompactMenuDeskLeft = false;
  bool get CompactMenuDeskLeft => _CompactMenuDeskLeft;
  set CompactMenuDeskLeft(bool value) {
    _CompactMenuDeskLeft = value;
    prefs.setBool('ff_CompactMenuDeskLeft', value);
  }

  int _activeMenuNumber = 0;
  int get activeMenuNumber => _activeMenuNumber;
  set activeMenuNumber(int value) {
    _activeMenuNumber = value;
  }

  List<String> _rolesNames = [];
  List<String> get rolesNames => _rolesNames;
  set rolesNames(List<String> value) {
    _rolesNames = value;
  }

  void addToRolesNames(String value) {
    rolesNames.add(value);
  }

  void removeFromRolesNames(String value) {
    rolesNames.remove(value);
  }

  void removeAtIndexFromRolesNames(int index) {
    rolesNames.removeAt(index);
  }

  void updateRolesNamesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    rolesNames[index] = updateFn(_rolesNames[index]);
  }

  void insertAtIndexInRolesNames(int index, String value) {
    rolesNames.insert(index, value);
  }

  List<dynamic> _rolesDataAll = [];
  List<dynamic> get rolesDataAll => _rolesDataAll;
  set rolesDataAll(List<dynamic> value) {
    _rolesDataAll = value;
  }

  void addToRolesDataAll(dynamic value) {
    rolesDataAll.add(value);
  }

  void removeFromRolesDataAll(dynamic value) {
    rolesDataAll.remove(value);
  }

  void removeAtIndexFromRolesDataAll(int index) {
    rolesDataAll.removeAt(index);
  }

  void updateRolesDataAllAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    rolesDataAll[index] = updateFn(_rolesDataAll[index]);
  }

  void insertAtIndexInRolesDataAll(int index, dynamic value) {
    rolesDataAll.insert(index, value);
  }

  String _roleInternal = '';
  String get roleInternal => _roleInternal;
  set roleInternal(String value) {
    _roleInternal = value;
  }

  String _roleExternal = '';
  String get roleExternal => _roleExternal;
  set roleExternal(String value) {
    _roleExternal = value;
  }

  String _roleState = '';
  String get roleState => _roleState;
  set roleState(String value) {
    _roleState = value;
  }

  Color _roleColor = Color(3204242444);
  Color get roleColor => _roleColor;
  set roleColor(Color value) {
    _roleColor = value;
  }

  bool _navOpen = true;
  bool get navOpen => _navOpen;
  set navOpen(bool value) {
    _navOpen = value;
  }

  String _appURL = 'https://app.digitalclinic.com.ua';
  String get appURL => _appURL;
  set appURL(String value) {
    _appURL = value;
  }

  List<String> _state = [];
  List<String> get state => _state;
  set state(List<String> value) {
    _state = value;
  }

  void addToState(String value) {
    state.add(value);
  }

  void removeFromState(String value) {
    state.remove(value);
  }

  void removeAtIndexFromState(int index) {
    state.removeAt(index);
  }

  void updateStateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    state[index] = updateFn(_state[index]);
  }

  void insertAtIndexInState(int index, String value) {
    state.insert(index, value);
  }

  List<String> _userRolesList = [];
  List<String> get userRolesList => _userRolesList;
  set userRolesList(List<String> value) {
    _userRolesList = value;
  }

  void addToUserRolesList(String value) {
    userRolesList.add(value);
  }

  void removeFromUserRolesList(String value) {
    userRolesList.remove(value);
  }

  void removeAtIndexFromUserRolesList(int index) {
    userRolesList.removeAt(index);
  }

  void updateUserRolesListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userRolesList[index] = updateFn(_userRolesList[index]);
  }

  void insertAtIndexInUserRolesList(int index, String value) {
    userRolesList.insert(index, value);
  }

  String _dataS = '';
  String get dataS => _dataS;
  set dataS(String value) {
    _dataS = value;
  }

  List<RoleStruct> _AllRolesListDataType = [];
  List<RoleStruct> get AllRolesListDataType => _AllRolesListDataType;
  set AllRolesListDataType(List<RoleStruct> value) {
    _AllRolesListDataType = value;
  }

  void addToAllRolesListDataType(RoleStruct value) {
    AllRolesListDataType.add(value);
  }

  void removeFromAllRolesListDataType(RoleStruct value) {
    AllRolesListDataType.remove(value);
  }

  void removeAtIndexFromAllRolesListDataType(int index) {
    AllRolesListDataType.removeAt(index);
  }

  void updateAllRolesListDataTypeAtIndex(
    int index,
    RoleStruct Function(RoleStruct) updateFn,
  ) {
    AllRolesListDataType[index] = updateFn(_AllRolesListDataType[index]);
  }

  void insertAtIndexInAllRolesListDataType(int index, RoleStruct value) {
    AllRolesListDataType.insert(index, value);
  }

  List<RoleStruct> _UserRolesListDataType = [];
  List<RoleStruct> get UserRolesListDataType => _UserRolesListDataType;
  set UserRolesListDataType(List<RoleStruct> value) {
    _UserRolesListDataType = value;
  }

  void addToUserRolesListDataType(RoleStruct value) {
    UserRolesListDataType.add(value);
  }

  void removeFromUserRolesListDataType(RoleStruct value) {
    UserRolesListDataType.remove(value);
  }

  void removeAtIndexFromUserRolesListDataType(int index) {
    UserRolesListDataType.removeAt(index);
  }

  void updateUserRolesListDataTypeAtIndex(
    int index,
    RoleStruct Function(RoleStruct) updateFn,
  ) {
    UserRolesListDataType[index] = updateFn(_UserRolesListDataType[index]);
  }

  void insertAtIndexInUserRolesListDataType(int index, RoleStruct value) {
    UserRolesListDataType.insert(index, value);
  }

  int _counter = 0;
  int get counter => _counter;
  set counter(int value) {
    _counter = value;
  }

  int _countRolesInList = 0;
  int get countRolesInList => _countRolesInList;
  set countRolesInList(int value) {
    _countRolesInList = value;
  }

  List<String> _gender = ['чоловік', 'жінка'];
  List<String> get gender => _gender;
  set gender(List<String> value) {
    _gender = value;
  }

  void addToGender(String value) {
    gender.add(value);
  }

  void removeFromGender(String value) {
    gender.remove(value);
  }

  void removeAtIndexFromGender(int index) {
    gender.removeAt(index);
  }

  void updateGenderAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    gender[index] = updateFn(_gender[index]);
  }

  void insertAtIndexInGender(int index, String value) {
    gender.insert(index, value);
  }

  List<String> _invalidGroups = ['1', '2', '3'];
  List<String> get invalidGroups => _invalidGroups;
  set invalidGroups(List<String> value) {
    _invalidGroups = value;
  }

  void addToInvalidGroups(String value) {
    invalidGroups.add(value);
  }

  void removeFromInvalidGroups(String value) {
    invalidGroups.remove(value);
  }

  void removeAtIndexFromInvalidGroups(int index) {
    invalidGroups.removeAt(index);
  }

  void updateInvalidGroupsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    invalidGroups[index] = updateFn(_invalidGroups[index]);
  }

  void insertAtIndexInInvalidGroups(int index, String value) {
    invalidGroups.insert(index, value);
  }

  List<String> _cityOrVilage = ['місто', 'село'];
  List<String> get cityOrVilage => _cityOrVilage;
  set cityOrVilage(List<String> value) {
    _cityOrVilage = value;
  }

  void addToCityOrVilage(String value) {
    cityOrVilage.add(value);
  }

  void removeFromCityOrVilage(String value) {
    cityOrVilage.remove(value);
  }

  void removeAtIndexFromCityOrVilage(int index) {
    cityOrVilage.removeAt(index);
  }

  void updateCityOrVilageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    cityOrVilage[index] = updateFn(_cityOrVilage[index]);
  }

  void insertAtIndexInCityOrVilage(int index, String value) {
    cityOrVilage.insert(index, value);
  }

  List<String> _departments1 = [
    'кардіологія',
    'неврологія',
    'хірургічне відділення'
  ];
  List<String> get departments1 => _departments1;
  set departments1(List<String> value) {
    _departments1 = value;
  }

  void addToDepartments1(String value) {
    departments1.add(value);
  }

  void removeFromDepartments1(String value) {
    departments1.remove(value);
  }

  void removeAtIndexFromDepartments1(int index) {
    departments1.removeAt(index);
  }

  void updateDepartments1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    departments1[index] = updateFn(_departments1[index]);
  }

  void insertAtIndexInDepartments1(int index, String value) {
    departments1.insert(index, value);
  }

  List<String> _bloodGroups = ['O (I)', 'A (II)', 'B (III)', 'AB (IV)'];
  List<String> get bloodGroups => _bloodGroups;
  set bloodGroups(List<String> value) {
    _bloodGroups = value;
  }

  void addToBloodGroups(String value) {
    bloodGroups.add(value);
  }

  void removeFromBloodGroups(String value) {
    bloodGroups.remove(value);
  }

  void removeAtIndexFromBloodGroups(int index) {
    bloodGroups.removeAt(index);
  }

  void updateBloodGroupsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    bloodGroups[index] = updateFn(_bloodGroups[index]);
  }

  void insertAtIndexInBloodGroups(int index, String value) {
    bloodGroups.insert(index, value);
  }

  List<String> _bloodRh = ['Rh+', 'Rh-'];
  List<String> get bloodRh => _bloodRh;
  set bloodRh(List<String> value) {
    _bloodRh = value;
  }

  void addToBloodRh(String value) {
    bloodRh.add(value);
  }

  void removeFromBloodRh(String value) {
    bloodRh.remove(value);
  }

  void removeAtIndexFromBloodRh(int index) {
    bloodRh.removeAt(index);
  }

  void updateBloodRhAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    bloodRh[index] = updateFn(_bloodRh[index]);
  }

  void insertAtIndexInBloodRh(int index, String value) {
    bloodRh.insert(index, value);
  }

  List<String> _idsList = [];
  List<String> get idsList => _idsList;
  set idsList(List<String> value) {
    _idsList = value;
  }

  void addToIdsList(String value) {
    idsList.add(value);
  }

  void removeFromIdsList(String value) {
    idsList.remove(value);
  }

  void removeAtIndexFromIdsList(int index) {
    idsList.removeAt(index);
  }

  void updateIdsListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    idsList[index] = updateFn(_idsList[index]);
  }

  void insertAtIndexInIdsList(int index, String value) {
    idsList.insert(index, value);
  }

  String _patient = 'patient';
  String get patient => _patient;
  set patient(String value) {
    _patient = value;
  }

  List<DepartmentsStruct> _departments = [];
  List<DepartmentsStruct> get departments => _departments;
  set departments(List<DepartmentsStruct> value) {
    _departments = value;
  }

  void addToDepartments(DepartmentsStruct value) {
    departments.add(value);
  }

  void removeFromDepartments(DepartmentsStruct value) {
    departments.remove(value);
  }

  void removeAtIndexFromDepartments(int index) {
    departments.removeAt(index);
  }

  void updateDepartmentsAtIndex(
    int index,
    DepartmentsStruct Function(DepartmentsStruct) updateFn,
  ) {
    departments[index] = updateFn(_departments[index]);
  }

  void insertAtIndexInDepartments(int index, DepartmentsStruct value) {
    departments.insert(index, value);
  }

  int _departmentCurrent = 0;
  int get departmentCurrent => _departmentCurrent;
  set departmentCurrent(int value) {
    _departmentCurrent = value;
  }

  String _departmentCurrentName = 'відділення не зазначене';
  String get departmentCurrentName => _departmentCurrentName;
  set departmentCurrentName(String value) {
    _departmentCurrentName = value;
  }

  int _selectedItem = 0;
  int get selectedItem => _selectedItem;
  set selectedItem(int value) {
    _selectedItem = value;
  }

  List<ChatContentStruct> _chatCont = [
    ChatContentStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"1\",\"text\":\"Доброго дня! Як ваше самопочуття сьогодні?\"}')),
    ChatContentStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"2\",\"text\":\"Доброго дня! Дякую, трохи краще. Лікар сказав, що процес одужання йде нормально. А ви як почуваєтесь?\"}')),
    ChatContentStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"1\",\"text\":\"Радий це чути. У мене теж все добре, дякую. Я тут уже другий тиждень, звик до розпорядку дня. Як у вас проходять процедури?\"}')),
    ChatContentStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"2\",\"text\":\"У мене щодня фізіотерапія та ліки за графіком. Сестри дуже уважні, допомагають, коли потрібно. А як у вас з цим?\"}')),
    ChatContentStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"1\",\"text\":\"У мене теж регулярні процедури. Вчора робили рентген, здається, все добре. Які плани у вас на сьогодні?\"}')),
    ChatContentStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"2\",\"text\":\"Після фізіотерапії планую трохи почитати книгу, яку взяв із собою. А ви?\"}'))
  ];
  List<ChatContentStruct> get chatCont => _chatCont;
  set chatCont(List<ChatContentStruct> value) {
    _chatCont = value;
  }

  void addToChatCont(ChatContentStruct value) {
    chatCont.add(value);
  }

  void removeFromChatCont(ChatContentStruct value) {
    chatCont.remove(value);
  }

  void removeAtIndexFromChatCont(int index) {
    chatCont.removeAt(index);
  }

  void updateChatContAtIndex(
    int index,
    ChatContentStruct Function(ChatContentStruct) updateFn,
  ) {
    chatCont[index] = updateFn(_chatCont[index]);
  }

  void insertAtIndexInChatCont(int index, ChatContentStruct value) {
    chatCont.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
