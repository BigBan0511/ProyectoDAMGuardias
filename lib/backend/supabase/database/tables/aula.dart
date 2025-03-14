import '../database.dart';

class AulaTable extends SupabaseTable<AulaRow> {
  @override
  String get tableName => 'Aula';

  @override
  AulaRow createRow(Map<String, dynamic> data) => AulaRow(data);
}

class AulaRow extends SupabaseDataRow {
  AulaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AulaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get codAula => getField<String>('cod_aula');
  set codAula(String? value) => setField<String>('cod_aula', value);
}
