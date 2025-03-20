import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'crear_modif_guardia_widget.dart' show CrearModifGuardiaWidget;
import 'package:flutter/material.dart';

class CrearModifGuardiaModel extends FlutterFlowModel<CrearModifGuardiaWidget> {
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
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? aa;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<HorarioRow>? horrr4;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<HorarioRow>? horrr;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<HorarioRow>? horrr3;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<HorarioRow>? horrr5;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
