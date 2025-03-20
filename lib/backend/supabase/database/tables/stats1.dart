import '../database.dart';

class Stats1Table extends SupabaseTable<Stats1Row> {
  @override
  String get tableName => 'stats1';

  @override
  Stats1Row createRow(Map<String, dynamic> data) => Stats1Row(data);
}

class Stats1Row extends SupabaseDataRow {
  Stats1Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => Stats1Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get dia => getField<String>('dia');
  set dia(String? value) => setField<String>('dia', value);

  String? get hora => getField<String>('hora');
  set hora(String? value) => setField<String>('hora', value);

  int? get totalGuardias => getField<int>('total_guardias');
  set totalGuardias(int? value) => setField<int>('total_guardias', value);

  int? get sumaTotal => getField<int>('suma_total');
  set sumaTotal(int? value) => setField<int>('suma_total', value);
}
