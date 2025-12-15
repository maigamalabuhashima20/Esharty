import '/flutter_flow/flutter_flow_util.dart';
import 'help_widget.dart' show HelpWidget;
import 'package:flutter/material.dart';

class HelpModel extends FlutterFlowModel<HelpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
