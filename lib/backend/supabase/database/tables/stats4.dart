import '../database.dart';

class Stats4Table extends SupabaseTable<Stats4Row> {
  @override
  String get tableName => 'stats4';

  @override
  Stats4Row createRow(Map<String, dynamic> data) => Stats4Row(data);
}

class Stats4Row extends SupabaseDataRow {
  Stats4Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => Stats4Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get idProfesor => getField<int>('id_profesor');
  set idProfesor(int? value) => setField<int>('id_profesor', value);

  int? get clase => getField<int>('clase');
  set clase(int? value) => setField<int>('clase', value);

  String? get hora => getField<String>('hora');
  set hora(String? value) => setField<String>('hora', value);

  String? get tiempoGuardia => getField<String>('tiempo_guardia');
  set tiempoGuardia(String? value) => setField<String>('tiempo_guardia', value);
}
