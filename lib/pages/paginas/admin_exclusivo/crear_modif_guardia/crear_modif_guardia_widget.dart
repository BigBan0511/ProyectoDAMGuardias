import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'crear_modif_guardia_model.dart';
export 'crear_modif_guardia_model.dart';

class CrearModifGuardiaWidget extends StatefulWidget {
  const CrearModifGuardiaWidget({
    super.key,
    required this.tramo,
    required this.modo,
    this.dia,
    this.profe,
    this.aula,
    this.index,
  });

  final String? tramo;
  final String? modo;
  final String? dia;
  final String? profe;
  final String? aula;
  final int? index;

  static String routeName = 'CrearModifGuardia';
  static String routePath = '/crearModifGuardia';

  @override
  State<CrearModifGuardiaWidget> createState() =>
      _CrearModifGuardiaWidgetState();
}

class _CrearModifGuardiaWidgetState extends State<CrearModifGuardiaWidget> {
  late CrearModifGuardiaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearModifGuardiaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<AulasRow>>(
      future: FFAppState().aulasCrear(
        requestFn: () => AulasTable().queryRows(
          queryFn: (q) => q,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFoldingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<AulasRow> crearModifGuardiaAulasRowList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'yceg5577' /* Crear/Modificar Guardias */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'u1e4bi5g' /* Rellene la guardia del dia esp... */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderRadius: 12.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        GuardiasWidget.routeName,
                        queryParameters: {
                          'tipoUsuario': serializeParam(
                            _model.aa?.firstOrNull?.rol,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                constraints: BoxConstraints(
                                  maxWidth: 770.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller:
                                              _model.diaValueController ??=
                                                  FormFieldController<String>(
                                            _model.diaValue ??=
                                                valueOrDefault<String>(
                                              widget.dia,
                                              'Lunes',
                                            ),
                                          ),
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              'kfpin6j1' /* Lunes */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '182dxst5' /* Martes */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'rd98si4p' /* Miércoles */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '8om0jggi' /* Jueves */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'adtbkgak' /* Viernes */,
                                            )
                                          ],
                                          onChanged: (val) => safeSetState(
                                              () => _model.diaValue = val),
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: 40.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: widget.modo == 'Modificar'
                                              ? widget.dia
                                              : 'Día de la semana',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                      FutureBuilder<List<UsersRow>>(
                                        future: FFAppState().profesitos(
                                          requestFn: () =>
                                              UsersTable().queryRows(
                                            queryFn: (q) => q
                                                .eqOrNull(
                                                  'rol',
                                                  'Profesor',
                                                )
                                                .eqOrNull(
                                                  'activo',
                                                  true,
                                                ),
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitFoldingCube(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRow> profeUsersRowList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller:
                                                _model.profeValueController ??=
                                                    FormFieldController<String>(
                                              _model.profeValue ??=
                                                  widget.modo == 'Modificar'
                                                      ? widget.profe
                                                      : profeUsersRowList
                                                          .firstOrNull?.nombre,
                                            ),
                                            options: profeUsersRowList
                                                .map((e) => e.nombre)
                                                .toList(),
                                            onChanged: (val) => safeSetState(
                                                () => _model.profeValue = val),
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText:
                                                widget.modo == 'Modificar'
                                                    ? widget.profe
                                                    : 'Profesor',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                      FlutterFlowDropDown<String>(
                                        controller:
                                            _model.aulaValueController ??=
                                                FormFieldController<String>(
                                          _model.aulaValue ??= widget.modo ==
                                                  'Modificar'
                                              ? widget.aula
                                              : crearModifGuardiaAulasRowList
                                                  .firstOrNull?.codAula,
                                        ),
                                        options: crearModifGuardiaAulasRowList
                                            .map((e) => e.codAula)
                                            .withoutNulls
                                            .toList(),
                                        onChanged: (val) => safeSetState(
                                            () => _model.aulaValue = val),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        height: 40.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: widget.modo == 'Modificar'
                                            ? widget.aula
                                            : 'Aula',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
                                      if (widget.tramo == 'Diurno')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .horaDiurnoValueController ??=
                                                FormFieldController<String>(
                                              _model.horaDiurnoValue ??=
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'd9d46s2d' /* Primera Hora (8:25 - 9:20) */,
                                              ),
                                            ),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'sx6rxs4a' /* Primera Hora (8:25 - 9:20) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                't2rq6x0l' /* Segunda Hora (9:20 - 10:15) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '53rrgxbk' /* Tercera Hora (10:15 - 11:10) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'xjhw7vcm' /* Recreo (11:10 - 11:30) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'akiobv6f' /* Cuarta Hora (11:30 - 12:25) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '6d6mofu2' /* Quinta Hora (12:25 - 13:20) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'wjfhlxjf' /* Sexta Hora (13:20 - 14:15) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0l5yxffg' /* Séptima Hora (14:15 - 15:10) */,
                                              )
                                            ],
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.horaDiurnoValue = val);
                                              FFAppState().horaCambiada = true;
                                              safeSetState(() {});
                                            },
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'pe2ahpae' /* Selector de Hora */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      if (widget.tramo == 'Vespertino')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .horaVesperValueController ??=
                                                FormFieldController<String>(
                                              _model.horaVesperValue ??=
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'li4k3ffo' /* Primera Hora (15:30 - 16:25) */,
                                              ),
                                            ),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'bmkvfxdp' /* Primera Hora (15:30 - 16:25) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '6cbs4x1d' /* Segunda Hora (16:25 - 17:20) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'tsol4q33' /* Tercera Hora (17:20 - 18:15) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3z5qpck0' /* Recreo (18:15 - 18:35) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                's6danfk9' /* Cuarta Hora (18:35 - 19:30) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '21pprbyn' /* Quinta Hora (19:30 - 20:25) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'k3qx74h2' /* Sexta Hora (20:25 - 21:20) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'wijo2qlw' /* Séptima Hora (21:20 - 22:15) */,
                                              )
                                            ],
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.horaVesperValue = val);
                                              FFAppState().horaCambiada = true;
                                              safeSetState(() {});
                                            },
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'dqdy2vxz' /* Selector de Hora */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                    ]
                                        .divide(SizedBox(height: 12.0))
                                        .addToEnd(SizedBox(height: 32.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FutureBuilder<List<UsersRow>>(
                      future: UsersTable().querySingleRow(
                        queryFn: (q) => q.eqOrNull(
                          'nombre',
                          _model.profeValue,
                        ),
                      ),
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
                        List<UsersRow> maxWidthUsersRowList = snapshot.data!;

                        final maxWidthUsersRow = maxWidthUsersRowList.isNotEmpty
                            ? maxWidthUsersRowList.first
                            : null;

                        return Container(
                          constraints: BoxConstraints(
                            maxWidth: 770.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 12.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.aa = await UsersTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'id_tabla',
                                    currentUserUid,
                                  ),
                                );
                                if (widget.tramo == 'Diurno') {
                                  if (widget.modo == 'Modificar') {
                                    if (_model.diaValue == null ||
                                        _model.diaValue == '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Debe introducir un día',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    } else if (_model.aulaValue == null ||
                                        _model.aulaValue == '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Debe introducir un aula',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    } else {
                                      if ((_model.diaValue == widget.dia) &&
                                          (widget.profe ==
                                              _model.profeValue) &&
                                          !FFAppState().horaCambiada) {
                                        context.pushNamed(
                                          GuardiasWidget.routeName,
                                          queryParameters: {
                                            'tipoUsuario': serializeParam(
                                              _model.aa?.firstOrNull?.rol,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        _model.horrr4 =
                                            await HorarioTable().queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'profesor',
                                                maxWidthUsersRow?.id,
                                              )
                                              .eqOrNull(
                                                'dia',
                                                _model.diaValue,
                                              )
                                              .eqOrNull(
                                                'hora',
                                                _model.horaDiurnoValue,
                                              ),
                                        );
                                        if (_model.horrr3 != null &&
                                            (_model.horrr3)!.isNotEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'El profesor tiene clase a esa hora',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        } else {
                                          await GuardiasTable().update(
                                            data: {
                                              'id_profesor':
                                                  maxWidthUsersRow?.id,
                                              'clase':
                                                  crearModifGuardiaAulasRowList
                                                      .where((e) =>
                                                          _model.aulaValue ==
                                                          e.codAula)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.id,
                                              'hora': _model.horaDiurnoValue,
                                              'activa':
                                                  _model.profeValue != null &&
                                                      _model.profeValue != '',
                                              'dia': _model.diaValue,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              widget.index,
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Guardia creada',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                            ),
                                          );

                                          context.pushNamed(
                                            GuardiasWidget.routeName,
                                            queryParameters: {
                                              'tipoUsuario': serializeParam(
                                                _model.aa?.firstOrNull?.rol,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      }
                                    }
                                  } else {
                                    if (_model.diaValue == null ||
                                        _model.diaValue == '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Debe introducir un día',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    } else if (_model.aulaValue == null ||
                                        _model.aulaValue == '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Debe introducir un aula',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    } else {
                                      _model.horrr =
                                          await HorarioTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'profesor',
                                              maxWidthUsersRow?.id,
                                            )
                                            .eqOrNull(
                                              'dia',
                                              _model.diaValue,
                                            )
                                            .eqOrNull(
                                              'hora',
                                              _model.horaDiurnoValue,
                                            ),
                                      );
                                      if (_model.horrr != null &&
                                          (_model.horrr)!.isNotEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'El profesor tiene clase a esa hora',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      } else {
                                        await GuardiasTable().insert({
                                          'id_profesor': maxWidthUsersRow?.id,
                                          'clase': crearModifGuardiaAulasRowList
                                              .where((e) =>
                                                  _model.aulaValue == e.codAula)
                                              .toList()
                                              .firstOrNull
                                              ?.id,
                                          'hora': _model.horaDiurnoValue,
                                          'activa': _model.profeValue != null &&
                                              _model.profeValue != '',
                                          'dia': _model.diaValue,
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Guardia creada',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                          ),
                                        );

                                        context.pushNamed(
                                          GuardiasWidget.routeName,
                                          queryParameters: {
                                            'tipoUsuario': serializeParam(
                                              _model.aa?.firstOrNull?.rol,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    }
                                  }
                                } else {
                                  if (widget.modo == 'Modificar') {
                                    if (_model.diaValue == null ||
                                        _model.diaValue == '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Debe introducir un día',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    } else if (_model.aulaValue == null ||
                                        _model.aulaValue == '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Debe introducir un aula',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    } else {
                                      if ((_model.diaValue == widget.dia) &&
                                          (widget.profe ==
                                              _model.profeValue) &&
                                          !FFAppState().horaCambiada) {
                                        context.pushNamed(
                                          GuardiasWidget.routeName,
                                          queryParameters: {
                                            'tipoUsuario': serializeParam(
                                              _model.aa?.firstOrNull?.rol,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        _model.horrr3 =
                                            await HorarioTable().queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'profesor',
                                                maxWidthUsersRow?.id,
                                              )
                                              .eqOrNull(
                                                'dia',
                                                _model.diaValue,
                                              )
                                              .eqOrNull(
                                                'hora',
                                                _model.horaVesperValue,
                                              ),
                                        );
                                        if (_model.horrr3 != null &&
                                            (_model.horrr3)!.isNotEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'El profesor tiene clase a esa hora',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        } else {
                                          await GuardiasTable().update(
                                            data: {
                                              'id_profesor':
                                                  maxWidthUsersRow?.id,
                                              'clase':
                                                  crearModifGuardiaAulasRowList
                                                      .where((e) =>
                                                          _model.aulaValue ==
                                                          e.codAula)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.id,
                                              'hora': _model.horaVesperValue,
                                              'activa':
                                                  _model.profeValue != null &&
                                                      _model.profeValue != '',
                                              'dia': _model.diaValue,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              widget.index,
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Guardia creada',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                            ),
                                          );

                                          context.pushNamed(
                                            GuardiasWidget.routeName,
                                            queryParameters: {
                                              'tipoUsuario': serializeParam(
                                                _model.aa?.firstOrNull?.rol,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      }
                                    }
                                  } else {
                                    if (_model.diaValue == null ||
                                        _model.diaValue == '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Debe introducir un día',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    } else if (_model.aulaValue == null ||
                                        _model.aulaValue == '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Debe introducir un aula',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    } else {
                                      _model.horrr5 =
                                          await HorarioTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'profesor',
                                              maxWidthUsersRow?.id,
                                            )
                                            .eqOrNull(
                                              'dia',
                                              _model.diaValue,
                                            )
                                            .eqOrNull(
                                              'hora',
                                              _model.horaDiurnoValue,
                                            ),
                                      );
                                      if (_model.horrr5 != null &&
                                          (_model.horrr5)!.isNotEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'El profesor tiene clase a esa hora',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      } else {
                                        await GuardiasTable().insert({
                                          'id_profesor': maxWidthUsersRow?.id,
                                          'clase': crearModifGuardiaAulasRowList
                                              .where((e) =>
                                                  _model.aulaValue == e.codAula)
                                              .toList()
                                              .firstOrNull
                                              ?.id,
                                          'hora': _model.horaVesperValue,
                                          'activa': _model.profeValue != null &&
                                              _model.profeValue != '',
                                          'dia': _model.diaValue,
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Guardia creada',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                          ),
                                        );

                                        context.pushNamed(
                                          GuardiasWidget.routeName,
                                          queryParameters: {
                                            'tipoUsuario': serializeParam(
                                              _model.aa?.firstOrNull?.rol,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    }
                                  }
                                }

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'goh9ceph' /* Confirmar */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
