import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/empty_lists/empty_list_search/empty_list_search_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/algolia_searching/searching_diagnoses_row/searching_diagnoses_row_widget.dart';
import '/backend/schema/structs/index.dart';
import 'searching_diagnoses_widget.dart' show SearchingDiagnosesWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchingDiagnosesModel
    extends FlutterFlowModel<SearchingDiagnosesWidget> {
  ///  Local state fields for this component.

  List<DiagnosesStruct> searchData = [];
  void addToSearchData(DiagnosesStruct item) => searchData.add(item);
  void removeFromSearchData(DiagnosesStruct item) => searchData.remove(item);
  void removeAtIndexFromSearchData(int index) => searchData.removeAt(index);
  void insertAtIndexInSearchData(int index, DiagnosesStruct item) =>
      searchData.insert(index, item);
  void updateSearchDataAtIndex(int index, Function(DiagnosesStruct) updateFn) =>
      searchData[index] = updateFn(searchData[index]);

  String? selectedCode;

  String? selectedDescription;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Algolia diagnoses GET)] action in TextField widget.
  ApiCallResponse? apiResultyge;
  // Models for searchingDiagnosesRow dynamic component.
  late FlutterFlowDynamicModels<SearchingDiagnosesRowModel>
      searchingDiagnosesRowModels;

  @override
  void initState(BuildContext context) {
    searchingDiagnosesRowModels =
        FlutterFlowDynamicModels(() => SearchingDiagnosesRowModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    searchingDiagnosesRowModels.dispose();
  }
}
