import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/h_r_folder/menu_desktop_left/menu_desktop_left_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageHRModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for MenuDesktopLeft component.
  late MenuDesktopLeftModel menuDesktopLeftModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuDesktopLeftModel = createModel(context, () => MenuDesktopLeftModel());
  }

  void dispose() {
    menuDesktopLeftModel.dispose();
  }

  /// Additional helper methods are added here.

}
