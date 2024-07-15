import '/backend/supabase/supabase.dart';
import '/components/chamber_block_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'choice_of_chamber_widget.dart' show ChoiceOfChamberWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChoiceOfChamberModel extends FlutterFlowModel<ChoiceOfChamberWidget> {
  ///  Local state fields for this component.

  List<int> chambersList = [];
  void addToChambersList(int item) => chambersList.add(item);
  void removeFromChambersList(int item) => chambersList.remove(item);
  void removeAtIndexFromChambersList(int index) => chambersList.removeAt(index);
  void insertAtIndexInChambersList(int index, int item) =>
      chambersList.insert(index, item);
  void updateChambersListAtIndex(int index, Function(int) updateFn) =>
      chambersList[index] = updateFn(chambersList[index]);

  int? count = 1;

  int? checkedChamber;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in choiceOfChamber widget.
  List<DDepartmentsRow>? department;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
