import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _horarios = prefs
              .getStringList('ff_horarios')
              ?.map((x) {
                try {
                  return HorarioStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _horarios;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  List<HorarioStruct> _horarios = [];
  List<HorarioStruct> get horarios => _horarios;
  set horarios(List<HorarioStruct> value) {
    _horarios = value;
    prefs.setStringList(
        'ff_horarios', value.map((x) => x.serialize()).toList());
  }

  void addToHorarios(HorarioStruct value) {
    horarios.add(value);
    prefs.setStringList(
        'ff_horarios', _horarios.map((x) => x.serialize()).toList());
  }

  void removeFromHorarios(HorarioStruct value) {
    horarios.remove(value);
    prefs.setStringList(
        'ff_horarios', _horarios.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromHorarios(int index) {
    horarios.removeAt(index);
    prefs.setStringList(
        'ff_horarios', _horarios.map((x) => x.serialize()).toList());
  }

  void updateHorariosAtIndex(
    int index,
    HorarioStruct Function(HorarioStruct) updateFn,
  ) {
    horarios[index] = updateFn(_horarios[index]);
    prefs.setStringList(
        'ff_horarios', _horarios.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInHorarios(int index, HorarioStruct value) {
    horarios.insert(index, value);
    prefs.setStringList(
        'ff_horarios', _horarios.map((x) => x.serialize()).toList());
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
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
