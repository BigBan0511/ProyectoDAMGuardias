import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'crear_modif_usuarios_widget.dart' show CrearModifUsuariosWidget;
import 'package:flutter/material.dart';

class CrearModifUsuariosModel
    extends FlutterFlowModel<CrearModifUsuariosWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v1ydk4nu' /* Please enter the patients full... */,
      );
    }

    return null;
  }

  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  String? _correoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'um1nuzhw' /* Please enter an age for the pa... */,
      );
    }

    return null;
  }

  // State field(s) for contraInic widget.
  FocusNode? contraInicFocusNode;
  TextEditingController? contraInicTextController;
  late bool contraInicVisibility;
  String? Function(BuildContext, String?)? contraInicTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    correoTextControllerValidator = _correoTextControllerValidator;
    contraInicVisibility = false;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    correoFocusNode?.dispose();
    correoTextController?.dispose();

    contraInicFocusNode?.dispose();
    contraInicTextController?.dispose();
  }
}
