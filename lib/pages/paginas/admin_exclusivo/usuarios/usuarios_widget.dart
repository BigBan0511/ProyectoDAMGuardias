import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'usuarios_model.dart';
export 'usuarios_model.dart';

class UsuariosWidget extends StatefulWidget {
  const UsuariosWidget({super.key});

  static String routeName = 'Usuarios';
  static String routePath = '/usuarios';

  @override
  State<UsuariosWidget> createState() => _UsuariosWidgetState();
}

class _UsuariosWidgetState extends State<UsuariosWidget> {
  late UsuariosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsuariosModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsersRow>>(
      future: (_model.requestCompleter ??= Completer<List<UsersRow>>()
            ..complete(UsersTable().queryRows(
              queryFn: (q) => q,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<UsersRow> usuariosUsersRowList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed(PanelControlWidget.routeName);
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'mylttgtu' /* Usuarios */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.add_circle_outline_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        CrearModifUsuariosWidget.routeName,
                        queryParameters: {
                          'modo': serializeParam(
                            'insertar',
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              1.0,
                            ),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 12.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'gzj2q6ab' /* Lista de usuarios */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 0.0, 10.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '9ezzojqo' /* Profesores */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 20.0),
                      child: Builder(
                        builder: (context) {
                          final us = usuariosUsersRowList.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: us.length,
                            itemBuilder: (context, usIndex) {
                              final usItem = us[usIndex];
                              return Visibility(
                                visible: (usuariosUsersRowList
                                            .elementAtOrNull(usIndex)
                                            ?.rol ==
                                        'Profesor') &&
                                    usItem.activo!,
                                child: Slidable(
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    extentRatio: 0.5,
                                    children: [
                                      SlidableAction(
                                        label:
                                            FFLocalizations.of(context).getText(
                                          'd2x5upvx' /* Editar */,
                                        ),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        icon: Icons.edit,
                                        onPressed: (_) async {
                                          context.pushNamed(
                                            CrearModifUsuariosWidget.routeName,
                                            queryParameters: {
                                              'nombre': serializeParam(
                                                usuariosUsersRowList
                                                    .elementAtOrNull(usIndex)
                                                    ?.nombre,
                                                ParamType.String,
                                              ),
                                              'email': serializeParam(
                                                usuariosUsersRowList
                                                    .elementAtOrNull(usIndex)
                                                    ?.email,
                                                ParamType.String,
                                              ),
                                              'rol': serializeParam(
                                                usuariosUsersRowList
                                                    .elementAtOrNull(usIndex)
                                                    ?.rol,
                                                ParamType.String,
                                              ),
                                              'modo': serializeParam(
                                                'modificar',
                                                ParamType.String,
                                              ),
                                              'id': serializeParam(
                                                usuariosUsersRowList
                                                    .elementAtOrNull(usIndex)
                                                    ?.id,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                      ),

                                      // Habría que poner una tabla que sea de los que se quitan porque pedro dijo que no podíamos borrarlos tal cual, sino que se queden como de "baja".
                                      SlidableAction(
                                        label:
                                            FFLocalizations.of(context).getText(
                                          '02yzb1pa' /* Borrar */,
                                        ),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                        icon: Icons.delete_outline_rounded,
                                        onPressed: (_) async {
                                          await UsersTable().update(
                                            data: {
                                              'activo': false,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              usuariosUsersRowList
                                                  .elementAtOrNull(usIndex)
                                                  ?.id,
                                            ),
                                          );
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                        },
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: ListTile(
                                      title: Text(
                                        '${usuariosUsersRowList.elementAtOrNull(usIndex)?.nombre} (${usuariosUsersRowList.elementAtOrNull(usIndex)?.rol})',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      subtitle: Text(
                                        FFLocalizations.of(context).getText(
                                          'v2y4n50z' /* Email */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.swipe_left,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      dense: false,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 12.0, 0.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Divider(
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 0.0, 10.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'hi5rmjvb' /* Administradores */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Builder(
                        builder: (context) {
                          final us2 = usuariosUsersRowList.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: us2.length,
                            itemBuilder: (context, us2Index) {
                              final us2Item = us2[us2Index];
                              return Visibility(
                                visible: usuariosUsersRowList
                                        .elementAtOrNull(us2Index)
                                        ?.rol ==
                                    'Admin',
                                child: Slidable(
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    extentRatio: 0.5,
                                    children: [
                                      SlidableAction(
                                        label:
                                            FFLocalizations.of(context).getText(
                                          'y0t5fkd5' /* Editar */,
                                        ),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        icon: Icons.edit,
                                        onPressed: (_) async {
                                          context.pushNamed(
                                            CrearModifUsuariosWidget.routeName,
                                            queryParameters: {
                                              'nombre': serializeParam(
                                                usuariosUsersRowList
                                                    .elementAtOrNull(us2Index)
                                                    ?.nombre,
                                                ParamType.String,
                                              ),
                                              'email': serializeParam(
                                                usuariosUsersRowList
                                                    .elementAtOrNull(us2Index)
                                                    ?.email,
                                                ParamType.String,
                                              ),
                                              'rol': serializeParam(
                                                usuariosUsersRowList
                                                    .elementAtOrNull(us2Index)
                                                    ?.rol,
                                                ParamType.String,
                                              ),
                                              'modo': serializeParam(
                                                'modificar',
                                                ParamType.String,
                                              ),
                                              'id': serializeParam(
                                                usuariosUsersRowList
                                                    .elementAtOrNull(us2Index)
                                                    ?.id,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                      ),

                                      // Habría que poner una tabla que sea de los que se quitan porque pedro dijo que no podíamos borrarlos tal cual, sino que se queden como de "baja".
                                      SlidableAction(
                                        label:
                                            FFLocalizations.of(context).getText(
                                          'vqvwz53e' /* Borrar */,
                                        ),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                        icon: Icons.delete_outline_rounded,
                                        onPressed: (_) async {
                                          await UsersTable().update(
                                            data: {
                                              'activo': false,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              usuariosUsersRowList
                                                  .elementAtOrNull(us2Index)
                                                  ?.id,
                                            ),
                                          );
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                        },
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: ListTile(
                                      title: Text(
                                        '${usuariosUsersRowList.elementAtOrNull(us2Index)?.nombre} (${usuariosUsersRowList.elementAtOrNull(us2Index)?.rol})',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      subtitle: Text(
                                        FFLocalizations.of(context).getText(
                                          'kw3pboei' /* Email */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.swipe_left,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      dense: false,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 12.0, 0.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Divider(
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 0.0, 10.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'r8f7wvvy' /* Usuarios eliminados (Desactiva... */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Builder(
                        builder: (context) {
                          final us3 = usuariosUsersRowList.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: us3.length,
                            itemBuilder: (context, us3Index) {
                              final us3Item = us3[us3Index];
                              return Visibility(
                                visible: !us3Item.activo!,
                                child: Slidable(
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    extentRatio: 0.75,
                                    children: [
                                      SlidableAction(
                                        label:
                                            FFLocalizations.of(context).getText(
                                          'v4i3za1i' /* Editar */,
                                        ),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        icon: Icons.edit,
                                        onPressed: (_) async {
                                          context.pushNamed(
                                            CrearModifUsuariosWidget.routeName,
                                            queryParameters: {
                                              'nombre': serializeParam(
                                                usuariosUsersRowList
                                                    .elementAtOrNull(us3Index)
                                                    ?.nombre,
                                                ParamType.String,
                                              ),
                                              'email': serializeParam(
                                                usuariosUsersRowList
                                                    .elementAtOrNull(us3Index)
                                                    ?.email,
                                                ParamType.String,
                                              ),
                                              'rol': serializeParam(
                                                usuariosUsersRowList
                                                    .elementAtOrNull(us3Index)
                                                    ?.rol,
                                                ParamType.String,
                                              ),
                                              'modo': serializeParam(
                                                'modificar',
                                                ParamType.String,
                                              ),
                                              'id': serializeParam(
                                                usuariosUsersRowList
                                                    .elementAtOrNull(us3Index)
                                                    ?.id,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                      ),

                                      // Habría que poner una tabla que sea de los que se quitan porque pedro dijo que no podíamos borrarlos tal cual, sino que se queden como de "baja".
                                      SlidableAction(
                                        label:
                                            FFLocalizations.of(context).getText(
                                          'semu3sof' /* Borrar */,
                                        ),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                        icon: Icons.delete_outline_rounded,
                                        onPressed: (_) async {
                                          await UsersTable().update(
                                            data: {
                                              'activo': false,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              usuariosUsersRowList
                                                  .elementAtOrNull(us3Index)
                                                  ?.id,
                                            ),
                                          );
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                        },
                                      ),
                                      SlidableAction(
                                        label:
                                            FFLocalizations.of(context).getText(
                                          'mknh24ii' /* Reactivar */,
                                        ),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        icon: Icons.restore,
                                        onPressed: (_) async {
                                          await UsersTable().update(
                                            data: {
                                              'activo': true,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              usuariosUsersRowList
                                                  .elementAtOrNull(us3Index)
                                                  ?.id,
                                            ),
                                          );
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                        },
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: ListTile(
                                      title: Text(
                                        '${usuariosUsersRowList.elementAtOrNull(us3Index)?.nombre} (${usuariosUsersRowList.elementAtOrNull(us3Index)?.rol})',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      subtitle: Text(
                                        FFLocalizations.of(context).getText(
                                          'tmveh9rc' /* Email */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.swipe_left,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      dense: false,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 12.0, 0.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
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
