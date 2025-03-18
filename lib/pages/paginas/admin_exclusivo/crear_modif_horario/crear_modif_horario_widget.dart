import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/componentes/confirmar_hora/confirmar_hora_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'crear_modif_horario_model.dart';
export 'crear_modif_horario_model.dart';

class CrearModifHorarioWidget extends StatefulWidget {
  const CrearModifHorarioWidget({
    super.key,
    required this.tramo,
    required this.modo,
    this.dia,
    this.profe,
    this.aula,
    this.hora,
    this.asignatura,
  });

  final String? tramo;
  final String? modo;
  final String? dia;
  final String? profe;
  final String? aula;
  final String? hora;
  final String? asignatura;

  static String routeName = 'CrearModifHorario';
  static String routePath = '/crearModifHorario';

  @override
  State<CrearModifHorarioWidget> createState() =>
      _CrearModifHorarioWidgetState();
}

class _CrearModifHorarioWidgetState extends State<CrearModifHorarioWidget> {
  late CrearModifHorarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearModifHorarioModel());

    _model.asignaturaTextController ??= TextEditingController(
        text: widget.modo == 'Modificar' ? widget.asignatura : '');
    _model.asignaturaFocusNode ??= FocusNode();
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
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<AulasRow> crearModifHorarioAulasRowList = snapshot.data!;

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
                      'sc9heewa' /* Crear/Modificar Horario */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '8wmogfrc' /* Rellene el horario del dia esp... */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Inter',
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
                      context.pushNamed(PanelControlWidget.routeName);
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child:
                  // Hay que hacer que no se puedan duplicar los horarios del mismo dia
                  Form(
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.diaValueController ??=
                                    FormFieldController<String>(
                                  _model.diaValue ??= widget.dia,
                                ),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    '414fnu7l' /* Lunes */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'rxa22axd' /* Martes */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '059oh251' /* Miércoles */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'sovns7u8' /* Jueves */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'axtesfhd' /* Viernes */,
                                  )
                                ],
                                onChanged: (val) =>
                                    safeSetState(() => _model.diaValue = val),
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
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
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Container(
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
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
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
                                          _model.aulaValue ??=
                                              crearModifHorarioAulasRowList
                                                  .firstOrNull?.codAula,
                                        ),
                                        options: crearModifHorarioAulasRowList
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
                                                'xzsiw1l5' /* Primera Hora (8:25 - 9:20) */,
                                              ),
                                            ),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'q6rvn6e2' /* Primera Hora (8:25 - 9:20) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '99sq5l8q' /* Segunda Hora (9:20 - 10:15) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '4sumlpoy' /* Tercera Hora (10:15 - 11:10) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'l6tuj5r1' /* Recreo (11:10 - 11:30) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7ju3myra' /* Cuarta Hora (11:30 - 12:25) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'eblidhmd' /* Quinta Hora (12:25 - 13:20) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yz2nuum5' /* Sexta Hora (13:20 - 14:15) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '55g0w79j' /* Séptima Hora (14:15 - 15:10) */,
                                              )
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () => _model.horaDiurnoValue =
                                                    val),
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText:
                                                widget.modo == 'Modificar'
                                                    ? widget.hora
                                                    : 'Hora',
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
                                                '36pvz05o' /* Primera Hora (15:30 - 16:25) */,
                                              ),
                                            ),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'mwd1prgx' /* Primera Hora (15:30 - 16:25) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'kendmtqz' /* Segunda Hora (16:25 - 17:20) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '77etonnh' /* Tercera Hora (17:20 - 18:15) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1kgy741m' /* Recreo (18:15 - 18:35) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'kabuuvu3' /* Cuarta Hora (18:35 - 19:30) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qxwkmfzl' /* Quinta Hora (19:30 - 20:25) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'jbpurm4p' /* Sexta Hora (20:25 - 21:20) */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0aa0bu2s' /* Séptima Hora (21:20 - 22:15) */,
                                              )
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () => _model.horaVesperValue =
                                                    val),
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText:
                                                widget.modo == 'Modificar'
                                                    ? widget.hora
                                                    : 'Hora',
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
                                      TextFormField(
                                        controller:
                                            _model.asignaturaTextController,
                                        focusNode: _model.asignaturaFocusNode,
                                        autofocus: true,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'uqs8w7su' /* Asignatura */,
                                          ),
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          errorStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 20.0, 16.0, 20.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        validator: _model
                                            .asignaturaTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ]
                                        .divide(SizedBox(height: 12.0))
                                        .addToEnd(SizedBox(height: 32.0)),
                                  ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (widget.tramo == 'Diurno') {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: ConfirmarHoraWidget(
                                                dia: _model.diaValue!,
                                                hora: _model.horaDiurnoValue!,
                                                asignatura: _model
                                                    .asignaturaTextController
                                                    .text,
                                                clase: _model.aulaValue!,
                                                nombre: _model.profeValue!,
                                                tramo: widget.tramo!,
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      if (FFAppState()
                                          .horarios
                                          .contains(HorarioStruct(
                                            dia: _model.diaValue,
                                            profesor: _model.profeValue,
                                            hora: _model.horaDiurnoValue,
                                            clase: _model.aulaValue,
                                            asignatura: _model
                                                .asignaturaTextController.text,
                                          ))) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'La hora introducida ya está creada',
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
                                        FFAppState().existeHor = true;
                                        safeSetState(() {});
                                      } else {
                                        FFAppState().horasAnadidas =
                                            FFAppState().horasAnadidas + 1;
                                        safeSetState(() {});
                                        FFAppState().existeHor = false;
                                        safeSetState(() {});
                                        FFAppState()
                                            .addToHorarios(HorarioStruct(
                                          dia: _model.diaValue,
                                          profesor: _model.profeValue,
                                          hora: _model.horaDiurnoValue,
                                          clase: _model.aulaValue,
                                          asignatura: _model
                                              .asignaturaTextController.text,
                                        ));
                                        safeSetState(() {});
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: ConfirmarHoraWidget(
                                                dia: _model.diaValue!,
                                                hora: _model.horaVesperValue!,
                                                asignatura: _model
                                                    .asignaturaTextController
                                                    .text,
                                                clase: _model.aulaValue!,
                                                nombre: _model.profeValue!,
                                                tramo: widget.tramo!,
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      if (FFAppState()
                                          .horarios
                                          .contains(HorarioStruct(
                                            dia: _model.diaValue,
                                            profesor: _model.profeValue,
                                            hora: _model.horaVesperValue,
                                            clase: _model.aulaValue,
                                            asignatura: _model
                                                .asignaturaTextController.text,
                                          ))) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'La hora introducida ya está creada',
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
                                        FFAppState().existeHor = true;
                                        safeSetState(() {});
                                      } else {
                                        FFAppState().horasAnadidas =
                                            FFAppState().horasAnadidas + 1;
                                        safeSetState(() {});
                                        FFAppState().existeHor = false;
                                        safeSetState(() {});
                                        FFAppState()
                                            .addToHorarios(HorarioStruct(
                                          dia: _model.diaValue,
                                          profesor: _model.profeValue,
                                          hora: _model.horaVesperValue,
                                          clase: _model.aulaValue,
                                          asignatura: _model
                                              .asignaturaTextController.text,
                                        ));
                                        safeSetState(() {});
                                      }
                                    }
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'jezz2xw5' /* Añadir hora */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
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
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 770.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: (FFAppState().horasAnadidas < 1)
                              ? null
                              : () async {
                                  context
                                      .pushNamed(PanelControlWidget.routeName);
                                },
                          text: FFLocalizations.of(context).getText(
                            'ucix0b8n' /* Confirmar */,
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
