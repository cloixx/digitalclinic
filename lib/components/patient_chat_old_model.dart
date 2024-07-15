import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'patient_chat_old_widget.dart' show PatientChatOldWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PatientChatOldModel extends FlutterFlowModel<PatientChatOldWidget> {
  ///  Local state fields for this component.

  bool aiResponding = false;

  String? threadId;

  List<ChatContentStruct> chatHistory = [];
  void addToChatHistory(ChatContentStruct item) => chatHistory.add(item);
  void removeFromChatHistory(ChatContentStruct item) =>
      chatHistory.remove(item);
  void removeAtIndexFromChatHistory(int index) => chatHistory.removeAt(index);
  void insertAtIndexInChatHistory(int index, ChatContentStruct item) =>
      chatHistory.insert(index, item);
  void updateChatHistoryAtIndex(
          int index, Function(ChatContentStruct) updateFn) =>
      chatHistory[index] = updateFn(chatHistory[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PromptTextField widget.
  FocusNode? promptTextFieldFocusNode;
  TextEditingController? promptTextFieldTextController;
  String? Function(BuildContext, String?)?
      promptTextFieldTextControllerValidator;
  String? _promptTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Please enter a valid prompt!';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    promptTextFieldTextControllerValidator =
        _promptTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    promptTextFieldFocusNode?.dispose();
    promptTextFieldTextController?.dispose();
  }
}
