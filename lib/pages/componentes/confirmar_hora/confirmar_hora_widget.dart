import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'confirmar_hora_model.dart';
export 'confirmar_hora_model.dart';

class ConfirmarHoraWidget extends StatefulWidget {
  const ConfirmarHoraWidget({
    super.key,
    required this.dia,
    required this.hora,
    required this.asignatura,
    required this.clase,
    required this.nombre,
    required this.tramo,
  });

  final String? dia;
  final String? hora;
  final String? asignatura;
  final String? clase;
  final String? nombre;
  final String? tramo;

  @override
  State<ConfirmarHoraWidget> createState() => _ConfirmarHoraWidgetState();
}

class _ConfirmarHoraWidgetState extends State<ConfirmarHoraWidget> {
  late ConfirmarHoraModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmarHoraModel());
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
      child: FutureBuilder<List<AulasRow>>(
        future: AulasTable().querySingleRow(
          queryFn: (q) => q.eqOrNull(
            'cod_aula',
            widget.clase,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<AulasRow> card45TransferSmallAulasRowList = snapshot.data!;

          final card45TransferSmallAulasRow =
              card45TransferSmallAulasRowList.isNotEmpty
                  ? card45TransferSmallAulasRowList.first
                  : null;

          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.35,
            constraints: BoxConstraints(
              maxWidth: 570.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'uudsropp' /* Datos de la Hora */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Día: ${widget.dia}',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Readex Pro',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.nombre,
                          'Paco',
                        ),
                        textAlign: TextAlign.end,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Text(
                        '${widget.asignatura} (${widget.clase})',
                        textAlign: TextAlign.end,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.hora,
                          '8:30',
                        ),
                        textAlign: TextAlign.end,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ].divide(SizedBox(height: 5.0)),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(
                              CrearModifHorarioWidget.routeName,
                              queryParameters: {
                                'tramo': serializeParam(
                                  widget.tramo,
                                  ParamType.String,
                                ),
                                'modo': serializeParam(
                                  '',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            'gl2btpxu' /* Cancelar */,
                          ),
                          options: FFButtonOptions(
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            hoverColor: FlutterFlowTheme.of(context).alternate,
                            hoverBorderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            hoverTextColor:
                                FlutterFlowTheme.of(context).primaryText,
                            hoverElevation: 3.0,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            'v0p8agp8' /* Confirmar */,
                          ),
                          options: FFButtonOptions(
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            hoverColor: FlutterFlowTheme.of(context).accent1,
                            hoverBorderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            hoverTextColor:
                                FlutterFlowTheme.of(context).primaryText,
                            hoverElevation: 0.0,
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 4.0))
                    .addToEnd(SizedBox(height: 12.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
