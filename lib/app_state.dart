import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/supabase/supabase.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _VisMenu = false;
  bool get VisMenu => _VisMenu;
  set VisMenu(bool value) {
    _VisMenu = value;
  }

  int _UsuarioAuth = 0;
  int get UsuarioAuth => _UsuarioAuth;
  set UsuarioAuth(int value) {
    _UsuarioAuth = value;
  }

  int _idUsuarioSaliente = 0;
  int get idUsuarioSaliente => _idUsuarioSaliente;
  set idUsuarioSaliente(int value) {
    _idUsuarioSaliente = value;
  }

  bool _esGuardia = false;
  bool get esGuardia => _esGuardia;
  set esGuardia(bool value) {
    _esGuardia = value;
  }

  int _horasAnadidas = 0;
  int get horasAnadidas => _horasAnadidas;
  set horasAnadidas(int value) {
    _horasAnadidas = value;
  }

  bool _existeHor = false;
  bool get existeHor => _existeHor;
  set existeHor(bool value) {
    _existeHor = value;
  }

  String _emailActual = '';
  String get emailActual => _emailActual;
  set emailActual(String value) {
    _emailActual = value;
  }

  String _contraAct = '';
  String get contraAct => _contraAct;
  set contraAct(String value) {
    _contraAct = value;
  }

  bool _horaCambiada = false;
  bool get horaCambiada => _horaCambiada;
  set horaCambiada(bool value) {
    _horaCambiada = value;
  }

  bool _verGif = false;
  bool get verGif => _verGif;
  set verGif(bool value) {
    _verGif = value;
  }

  int _asignadas = 0;
  int get asignadas => _asignadas;
  set asignadas(int value) {
    _asignadas = value;
  }

  int _noAsignadas = 0;
  int get noAsignadas => _noAsignadas;
  set noAsignadas(int value) {
    _noAsignadas = value;
  }

  final _aulasManager = FutureRequestManager<List<AulasRow>>();
  Future<List<AulasRow>> aulas({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AulasRow>> Function() requestFn,
  }) =>
      _aulasManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAulasCache() => _aulasManager.clear();
  void clearAulasCacheKey(String? uniqueKey) =>
      _aulasManager.clearRequest(uniqueKey);

  final _profesitosManager = FutureRequestManager<List<UsersRow>>();
  Future<List<UsersRow>> profesitos({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRow>> Function() requestFn,
  }) =>
      _profesitosManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfesitosCache() => _profesitosManager.clear();
  void clearProfesitosCacheKey(String? uniqueKey) =>
      _profesitosManager.clearRequest(uniqueKey);

  final _aulasCrearManager = FutureRequestManager<List<AulasRow>>();
  Future<List<AulasRow>> aulasCrear({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AulasRow>> Function() requestFn,
  }) =>
      _aulasCrearManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAulasCrearCache() => _aulasCrearManager.clear();
  void clearAulasCrearCacheKey(String? uniqueKey) =>
      _aulasCrearManager.clearRequest(uniqueKey);

  final _horariosManager = FutureRequestManager<List<HorarioRow>>();
  Future<List<HorarioRow>> horarios({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<HorarioRow>> Function() requestFn,
  }) =>
      _horariosManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHorariosCache() => _horariosManager.clear();
  void clearHorariosCacheKey(String? uniqueKey) =>
      _horariosManager.clearRequest(uniqueKey);
}
