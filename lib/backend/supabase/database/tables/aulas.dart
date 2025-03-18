import '../database.dart';

class AulasTable extends SupabaseTable<AulasRow> {
  @override
  String get tableName => 'aulas';

  @override
  AulasRow createRow(Map<String, dynamic> data) => AulasRow(data);
}

class AulasRow extends SupabaseDataRow {
  AulasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AulasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get codAula => getField<String>('cod_aula');
  set codAula(String? value) => setField<String>('cod_aula', value);

  String? get nomAula => getField<String>('nom_aula');
  set nomAula(String? value) => setField<String>('nom_aula', value);
}
