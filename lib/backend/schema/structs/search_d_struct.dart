// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchDStruct extends BaseStruct {
  SearchDStruct({
    List<DiagnosesStruct>? hits,
  }) : _hits = hits;

  // "hits" field.
  List<DiagnosesStruct>? _hits;
  List<DiagnosesStruct> get hits => _hits ?? const [];
  set hits(List<DiagnosesStruct>? val) => _hits = val;

  void updateHits(Function(List<DiagnosesStruct>) updateFn) {
    updateFn(_hits ??= []);
  }

  bool hasHits() => _hits != null;

  static SearchDStruct fromMap(Map<String, dynamic> data) => SearchDStruct(
        hits: getStructList(
          data['hits'],
          DiagnosesStruct.fromMap,
        ),
      );

  static SearchDStruct? maybeFromMap(dynamic data) =>
      data is Map ? SearchDStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'hits': _hits?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'hits': serializeParam(
          _hits,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SearchDStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchDStruct(
        hits: deserializeStructParam<DiagnosesStruct>(
          data['hits'],
          ParamType.DataStruct,
          true,
          structBuilder: DiagnosesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SearchDStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SearchDStruct && listEquality.equals(hits, other.hits);
  }

  @override
  int get hashCode => const ListEquality().hash([hits]);
}

SearchDStruct createSearchDStruct() => SearchDStruct();
