import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'horarios_widget.dart' show HorariosWidget;
import 'package:flutter/material.dart';

class HorariosModel extends FlutterFlowModel<HorariosWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  Completer<List<UsersRow>>? requestCompleter;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsersRow>? idProfe;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<AulasRow>? idClase;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsersRow>? idProfe1;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<AulasRow>? idClase1;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsersRow>? idProfe2;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<AulasRow>? idClase2;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsersRow>? idProfe3;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<AulasRow>? idClase3;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsersRow>? idProfe4;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<AulasRow>? idClase4;

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
