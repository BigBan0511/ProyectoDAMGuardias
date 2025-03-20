import '../database.dart';

class Stats3Table extends SupabaseTable<Stats3Row> {
  @override
  String get tableName => 'stats3';

  @override
  Stats3Row createRow(Map<String, dynamic> data) => Stats3Row(data);
}

class Stats3Row extends SupabaseDataRow {
  Stats3Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => Stats3Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get idProfe => getField<int>('id_profe');
  set idProfe(int? value) => setField<int>('id_profe', value);

  String? get hora => getField<String>('hora');
  set hora(String? value) => setField<String>('hora', value);

  int? get tiempoGuardias => getField<int>('tiempo_guardias');
  set tiempoGuardias(int? value) => setField<int>('tiempo_guardias', value);
}
