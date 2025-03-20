import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'elegir_tramo_horario_model.dart';
export 'elegir_tramo_horario_model.dart';

class ElegirTramoHorarioWidget extends StatefulWidget {
  const ElegirTramoHorarioWidget({
    super.key,
    required this.modo,
    this.dia,
    this.profesor,
    this.aula,
    this.asignatura,
    this.index,
  });

  final String? modo;
  final String? dia;
  final String? profesor;
  final String? aula;
  final String? asignatura;
  final int? index;

  @override
  State<ElegirTramoHorarioWidget> createState() =>
      _ElegirTramoHorarioWidgetState();
}

class _ElegirTramoHorarioWidgetState extends State<ElegirTramoHorarioWidget>
    with TickerProviderStateMixin {
  late ElegirTramoHorarioModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ElegirTramoHorarioModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(115.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
        child: Container(
          width: 250.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        CrearModifHorarioWidget.routeName,
                        queryParameters: {
                          'tramo': serializeParam(
                            'Diurno',
                            ParamType.String,
                          ),
                          'modo': serializeParam(
                            widget.modo,
                            ParamType.String,
                          ),
                          'dia': serializeParam(
                            widget.dia,
                            ParamType.String,
                          ),
                          'profe': serializeParam(
                            widget.profesor,
                            ParamType.String,
                          ),
                          'aula': serializeParam(
                            widget.aula,
                            ParamType.String,
                          ),
                          'asignatura': serializeParam(
                            widget.asignatura,
                            ParamType.String,
                          ),
                          'index': serializeParam(
                            widget.index,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: 115.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: valueOrDefault<Color>(
                            Theme.of(context).brightness == Brightness.light
                                ? FlutterFlowTheme.of(context).alternate
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            FlutterFlowTheme.of(context).alternate,
                          ),
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wb_sunny_rounded,
                            color: Theme.of(context).brightness ==
                                    Brightness.light
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context).secondaryText,
                            size: 16.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'pbm3nx8m' /* Diurno */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        CrearModifHorarioWidget.routeName,
                        queryParameters: {
                          'tramo': serializeParam(
                            'Vespertino',
                            ParamType.String,
                          ),
                          'modo': serializeParam(
                            widget.modo,
                            ParamType.String,
                          ),
                          'dia': serializeParam(
                            widget.dia,
                            ParamType.String,
                          ),
                          'profe': serializeParam(
                            widget.profesor,
                            ParamType.String,
                          ),
                          'aula': serializeParam(
                            widget.aula,
                            ParamType.String,
                          ),
                          'asignatura': serializeParam(
                            widget.asignatura,
                            ParamType.String,
                          ),
                          'index': serializeParam(
                            widget.index,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: 115.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: valueOrDefault<Color>(
                            Theme.of(context).brightness == Brightness.dark
                                ? FlutterFlowTheme.of(context).alternate
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.nightlight_round,
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context).secondaryText,
                            size: 16.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'si8hkbr3' /* Vespertino */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation']!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
