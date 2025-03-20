import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'guardias_profes_widget.dart' show GuardiasProfesWidget;
import 'package:flutter/material.dart';

class GuardiasProfesModel extends FlutterFlowModel<GuardiasProfesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<GuardiasRow>? yaAsignado;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UsersRow>? hora2;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<HorarioRow>? adeu;
  Completer<List<GuardiasRow>>? requestCompleter;

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
