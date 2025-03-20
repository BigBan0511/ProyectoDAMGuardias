import '../database.dart';

class Stats2Table extends SupabaseTable<Stats2Row> {
  @override
  String get tableName => 'stats2';

  @override
  Stats2Row createRow(Map<String, dynamic> data) => Stats2Row(data);
}

class Stats2Row extends SupabaseDataRow {
  Stats2Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => Stats2Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get dia => getField<String>('dia');
  set dia(String? value) => setField<String>('dia', value);

  String? get hora => getField<String>('hora');
  set hora(String? value) => setField<String>('hora', value);

  int? get totalGuardias => getField<int>('total_guardias');
  set totalGuardias(int? value) => setField<int>('total_guardias', value);

  int? get sumaTotal2 => getField<int>('suma_total2');
  set sumaTotal2(int? value) => setField<int>('suma_total2', value);
}
