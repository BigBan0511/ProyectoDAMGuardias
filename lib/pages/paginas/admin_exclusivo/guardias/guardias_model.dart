import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'guardias_widget.dart' show GuardiasWidget;
import 'package:flutter/material.dart';

class GuardiasModel extends FlutterFlowModel<GuardiasWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsersRow>? nom;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<AulasRow>? clase;
  Completer<List<GuardiasRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsersRow>? nom1;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<AulasRow>? clase1;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsersRow>? nom2;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<AulasRow>? clase2;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsersRow>? nom3;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<AulasRow>? clase3;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsersRow>? nom4;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<AulasRow>? clase4;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsersRow>? usuario;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }

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
