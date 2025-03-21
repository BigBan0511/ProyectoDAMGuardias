import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/barra_lateral/barra_lateral_widget.dart';
import 'dart:async';
import 'inicio_widget.dart' show InicioWidget;
import 'package:flutter/material.dart';

class InicioModel extends FlutterFlowModel<InicioWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<GuardiasRow>>? requestCompleter;
  // Model for barraLateral component.
  late BarraLateralModel barraLateralModel;

  @override
  void initState(BuildContext context) {
    barraLateralModel = createModel(context, () => BarraLateralModel());
  }

  @override
  void dispose() {
    barraLateralModel.dispose();
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
