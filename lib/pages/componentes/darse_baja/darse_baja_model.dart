import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'darse_baja_widget.dart' show DarseBajaWidget;
import 'package:flutter/material.dart';

class DarseBajaModel extends FlutterFlowModel<DarseBajaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<AulasRow>? idClase;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();
  }
}
