import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'inicio_sesion_widget.dart' show InicioSesionWidget;
import 'package:flutter/material.dart';

class InicioSesionModel extends FlutterFlowModel<InicioSesionWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for correoInicio widget.
  FocusNode? correoInicioFocusNode;
  TextEditingController? correoInicioTextController;
  String? Function(BuildContext, String?)? correoInicioTextControllerValidator;
  // State field(s) for contrasenaInicio widget.
  FocusNode? contrasenaInicioFocusNode;
  TextEditingController? contrasenaInicioTextController;
  late bool contrasenaInicioVisibility;
  String? Function(BuildContext, String?)?
      contrasenaInicioTextControllerValidator;

  @override
  void initState(BuildContext context) {
    contrasenaInicioVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    correoInicioFocusNode?.dispose();
    correoInicioTextController?.dispose();

    contrasenaInicioFocusNode?.dispose();
    contrasenaInicioTextController?.dispose();
  }
}
