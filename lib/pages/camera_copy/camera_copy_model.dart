import '/flutter_flow/flutter_flow_util.dart';
import 'camera_copy_widget.dart' show CameraCopyWidget;
import 'package:flutter/material.dart';

class CameraCopyModel extends FlutterFlowModel<CameraCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
