import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'patient_chat_doctor_side_com_widget.dart'
    show PatientChatDoctorSideComWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PatientChatDoctorSideComModel
    extends FlutterFlowModel<PatientChatDoctorSideComWidget> {
  ///  Local state fields for this component.

  String? message;

  ///  State fields for stateful widgets in this component.

  Completer<List<ChatMessagesViewRow>>? requestCompleter;
  // State field(s) for ChatColumn widget.
  ScrollController? chatColumn;
  // State field(s) for ChatListView widget.
  ScrollController? chatListView;
  // State field(s) for PromptTextField widget.
  FocusNode? promptTextFieldFocusNode;
  TextEditingController? promptTextFieldTextController;
  String? Function(BuildContext, String?)?
      promptTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    chatColumn = ScrollController();
    chatListView = ScrollController();
  }

  @override
  void dispose() {
    chatColumn?.dispose();
    chatListView?.dispose();
    promptTextFieldFocusNode?.dispose();
    promptTextFieldTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
