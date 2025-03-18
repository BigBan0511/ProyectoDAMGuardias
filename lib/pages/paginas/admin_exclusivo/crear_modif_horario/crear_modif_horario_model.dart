import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'crear_modif_horario_widget.dart' show CrearModifHorarioWidget;
import 'package:flutter/material.dart';

class CrearModifHorarioModel extends FlutterFlowModel<CrearModifHorarioWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dia widget.
  String? diaValue;
  FormFieldController<String>? diaValueController;
  // State field(s) for profe widget.
  String? profeValue;
  FormFieldController<String>? profeValueController;
  // State field(s) for aula widget.
  String? aulaValue;
  FormFieldController<String>? aulaValueController;
  // State field(s) for horaDiurno widget.
  String? horaDiurnoValue;
  FormFieldController<String>? horaDiurnoValueController;
  // State field(s) for horaVesper widget.
  String? horaVesperValue;
  FormFieldController<String>? horaVesperValueController;
  // State field(s) for Asignatura widget.
  FocusNode? asignaturaFocusNode;
  TextEditingController? asignaturaTextController;
  String? Function(BuildContext, String?)? asignaturaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    asignaturaFocusNode?.dispose();
    asignaturaTextController?.dispose();
  }
}
