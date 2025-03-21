import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'generar_model.dart';
export 'generar_model.dart';

class GenerarWidget extends StatefulWidget {
  const GenerarWidget({
    super.key,
    required this.tramo,
  });

  final String? tramo;

  @override
  State<GenerarWidget> createState() => _GenerarWidgetState();
}

class _GenerarWidgetState extends State<GenerarWidget> {
  late GenerarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenerarModel());

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
      child: FutureBuilder<List<UsersRow>>(
        future: (_model.requestCompleter ??= Completer<List<UsersRow>>()
              ..complete(UsersTable().queryRows(
                queryFn: (q) => q
                    .eqOrNull(
                      'rol',
                      'Profesor',
                    )
                    .eqOrNull(
                      'activo',
                      true,
                    ),
              )))
            .future,
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFoldingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            );
          }
          List<UsersRow> optionsUsersRowList = snapshot.data!;

          return Material(
            color: Colors.transparent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Container(
              width: 500.0,
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.nomGenerarValueController ??=
                            FormFieldController<String>(
                          _model.nomGenerarValue ??=
                              optionsUsersRowList.firstOrNull?.nombre,
                        ),
                        options:
                            optionsUsersRowList.map((e) => e.nombre).toList(),
                        onChanged: (val) async {
                          safeSetState(() => _model.nomGenerarValue = val);
                          safeSetState(() => _model.requestCompleter = null);
                          await _model.waitForRequestCompleted();
                        },
                        width: 200.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'yqpoar7g' /* Profesor... */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        _model.atgnbjdg = await UsersTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'nombre',
                            _model.nomGenerarValue,
                          ),
                        );
                        _model.horario = await HorarioTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'profesor',
                            _model.atgnbjdg?.firstOrNull?.id,
                          ),
                        );
                        if (_model.horario != null &&
                            (_model.horario)!.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Ya hay datos introducidos en el horario de este profesor',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                        } else {
                          if (widget.tramo == 'Diurno') {
                            await actions.llamarDiur(
                              optionsUsersRowList
                                  .where(
                                      (e) => e.nombre == _model.nomGenerarValue)
                                  .toList()
                                  .firstOrNull!
                                  .id,
                            );
                          } else {
                            await actions.llamarves(
                              optionsUsersRowList
                                  .where(
                                      (e) => e.nombre == _model.nomGenerarValue)
                                  .toList()
                                  .firstOrNull!
                                  .id,
                            );
                          }

                          context.pushNamed(
                            CrearModifHorarioWidget.routeName,
                            queryParameters: {
                              'tramo': serializeParam(
                                widget.tramo,
                                ParamType.String,
                              ),
                              'modo': serializeParam(
                                'Insertar',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        }

                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'cg36i5ar' /* Generar */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
