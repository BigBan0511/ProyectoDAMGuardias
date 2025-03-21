import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'generar_widget.dart' show GenerarWidget;
import 'package:flutter/material.dart';

class GenerarModel extends FlutterFlowModel<GenerarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nomGenerar widget.
  String? nomGenerarValue;
  FormFieldController<String>? nomGenerarValueController;
  Completer<List<UsersRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? atgnbjdg;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<HorarioRow>? horario;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

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
