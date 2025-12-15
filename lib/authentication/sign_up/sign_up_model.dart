import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField_UserName widget.
  FocusNode? textFieldUserNameFocusNode;
  TextEditingController? textFieldUserNameTextController;
  String? Function(BuildContext, String?)?
      textFieldUserNameTextControllerValidator;
  String? _textFieldUserNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5nlkw04m' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField_Emaill widget.
  FocusNode? textFieldEmaillFocusNode;
  TextEditingController? textFieldEmaillTextController;
  String? Function(BuildContext, String?)?
      textFieldEmaillTextControllerValidator;
  String? _textFieldEmaillTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2umgxp73' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for TextField_Password widget.
  FocusNode? textFieldPasswordFocusNode;
  TextEditingController? textFieldPasswordTextController;
  late bool textFieldPasswordVisibility;
  String? Function(BuildContext, String?)?
      textFieldPasswordTextControllerValidator;
  String? _textFieldPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't0bflobd' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField_confirm widget.
  FocusNode? textFieldConfirmFocusNode;
  TextEditingController? textFieldConfirmTextController;
  late bool textFieldConfirmVisibility;
  String? Function(BuildContext, String?)?
      textFieldConfirmTextControllerValidator;
  String? _textFieldConfirmTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '70q01vjx' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textFieldUserNameTextControllerValidator =
        _textFieldUserNameTextControllerValidator;
    textFieldEmaillTextControllerValidator =
        _textFieldEmaillTextControllerValidator;
    textFieldPasswordVisibility = false;
    textFieldPasswordTextControllerValidator =
        _textFieldPasswordTextControllerValidator;
    textFieldConfirmVisibility = false;
    textFieldConfirmTextControllerValidator =
        _textFieldConfirmTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldUserNameFocusNode?.dispose();
    textFieldUserNameTextController?.dispose();

    textFieldEmaillFocusNode?.dispose();
    textFieldEmaillTextController?.dispose();

    textFieldPasswordFocusNode?.dispose();
    textFieldPasswordTextController?.dispose();

    textFieldConfirmFocusNode?.dispose();
    textFieldConfirmTextController?.dispose();
  }
}
