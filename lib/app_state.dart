import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _CompactMenuDeskLeft =
        prefs.getBool('ff_CompactMenuDeskLeft') ?? _CompactMenuDeskLeft;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _AccessToken = '';
  String get AccessToken => _AccessToken;
  set AccessToken(String _value) {
    _AccessToken = _value;
  }

  String _role = '';
  String get role => _role;
  set role(String _value) {
    _role = _value;
  }

  Color _roleColor = Color(4283120111);
  Color get roleColor => _roleColor;
  set roleColor(Color _value) {
    _roleColor = _value;
  }

  List<String> _rolesAppState = [];
  List<String> get rolesAppState => _rolesAppState;
  set rolesAppState(List<String> _value) {
    _rolesAppState = _value;
  }

  void addToRolesAppState(String _value) {
    _rolesAppState.add(_value);
  }

  void removeFromRolesAppState(String _value) {
    _rolesAppState.remove(_value);
  }

  void removeAtIndexFromRolesAppState(int _index) {
    _rolesAppState.removeAt(_index);
  }

  bool _CompactMenuDeskLeft = false;
  bool get CompactMenuDeskLeft => _CompactMenuDeskLeft;
  set CompactMenuDeskLeft(bool _value) {
    _CompactMenuDeskLeft = _value;
    prefs.setBool('ff_CompactMenuDeskLeft', _value);
  }

  final _rolesCasheManager = StreamRequestManager<List<RolesRecord>>();
  Stream<List<RolesRecord>> rolesCashe({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<RolesRecord>> Function() requestFn,
  }) =>
      _rolesCasheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRolesCasheCache() => _rolesCasheManager.clear();
  void clearRolesCasheCacheKey(String? uniqueKey) =>
      _rolesCasheManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
