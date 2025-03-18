// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HorarioStruct extends BaseStruct {
  HorarioStruct({
    String? dia,
    String? profesor,
    String? hora,
    String? clase,
    String? asignatura,
  })  : _dia = dia,
        _profesor = profesor,
        _hora = hora,
        _clase = clase,
        _asignatura = asignatura;

  // "dia" field.
  String? _dia;
  String get dia => _dia ?? '';
  set dia(String? val) => _dia = val;

  bool hasDia() => _dia != null;

  // "profesor" field.
  String? _profesor;
  String get profesor => _profesor ?? '';
  set profesor(String? val) => _profesor = val;

  bool hasProfesor() => _profesor != null;

  // "hora" field.
  String? _hora;
  String get hora => _hora ?? '';
  set hora(String? val) => _hora = val;

  bool hasHora() => _hora != null;

  // "clase" field.
  String? _clase;
  String get clase => _clase ?? '';
  set clase(String? val) => _clase = val;

  bool hasClase() => _clase != null;

  // "asignatura" field.
  String? _asignatura;
  String get asignatura => _asignatura ?? '';
  set asignatura(String? val) => _asignatura = val;

  bool hasAsignatura() => _asignatura != null;

  static HorarioStruct fromMap(Map<String, dynamic> data) => HorarioStruct(
        dia: data['dia'] as String?,
        profesor: data['profesor'] as String?,
        hora: data['hora'] as String?,
        clase: data['clase'] as String?,
        asignatura: data['asignatura'] as String?,
      );

  static HorarioStruct? maybeFromMap(dynamic data) =>
      data is Map ? HorarioStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'dia': _dia,
        'profesor': _profesor,
        'hora': _hora,
        'clase': _clase,
        'asignatura': _asignatura,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dia': serializeParam(
          _dia,
          ParamType.String,
        ),
        'profesor': serializeParam(
          _profesor,
          ParamType.String,
        ),
        'hora': serializeParam(
          _hora,
          ParamType.String,
        ),
        'clase': serializeParam(
          _clase,
          ParamType.String,
        ),
        'asignatura': serializeParam(
          _asignatura,
          ParamType.String,
        ),
      }.withoutNulls;

  static HorarioStruct fromSerializableMap(Map<String, dynamic> data) =>
      HorarioStruct(
        dia: deserializeParam(
          data['dia'],
          ParamType.String,
          false,
        ),
        profesor: deserializeParam(
          data['profesor'],
          ParamType.String,
          false,
        ),
        hora: deserializeParam(
          data['hora'],
          ParamType.String,
          false,
        ),
        clase: deserializeParam(
          data['clase'],
          ParamType.String,
          false,
        ),
        asignatura: deserializeParam(
          data['asignatura'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HorarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HorarioStruct &&
        dia == other.dia &&
        profesor == other.profesor &&
        hora == other.hora &&
        clase == other.clase &&
        asignatura == other.asignatura;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([dia, profesor, hora, clase, asignatura]);
}

HorarioStruct createHorarioStruct({
  String? dia,
  String? profesor,
  String? hora,
  String? clase,
  String? asignatura,
}) =>
    HorarioStruct(
      dia: dia,
      profesor: profesor,
      hora: hora,
      clase: clase,
      asignatura: asignatura,
    );
