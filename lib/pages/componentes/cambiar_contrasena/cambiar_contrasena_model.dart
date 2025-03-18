import '/flutter_flow/flutter_flow_util.dart';
import 'cambiar_contrasena_widget.dart' show CambiarContrasenaWidget;
import 'package:flutter/material.dart';

class CambiarContrasenaModel extends FlutterFlowModel<CambiarContrasenaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? passwordTextController;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? confirmPasswordTextController;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    passwordTextController?.dispose();

    textFieldFocusNode2?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
