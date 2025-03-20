import '../database.dart';

class GuardiasTable extends SupabaseTable<GuardiasRow> {
  @override
  String get tableName => 'guardias';

  @override
  GuardiasRow createRow(Map<String, dynamic> data) => GuardiasRow(data);
}

class GuardiasRow extends SupabaseDataRow {
  GuardiasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GuardiasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get idProfesor => getField<int>('id_profesor');
  set idProfesor(int? value) => setField<int>('id_profesor', value);

  int? get clase => getField<int>('clase');
  set clase(int? value) => setField<int>('clase', value);

  String? get hora => getField<String>('hora');
  set hora(String? value) => setField<String>('hora', value);

  String? get tarea => getField<String>('tarea');
  set tarea(String? value) => setField<String>('tarea', value);

  bool? get activa => getField<bool>('activa');
  set activa(bool? value) => setField<bool>('activa', value);

  String? get dia => getField<String>('dia');
  set dia(String? value) => setField<String>('dia', value);
}
