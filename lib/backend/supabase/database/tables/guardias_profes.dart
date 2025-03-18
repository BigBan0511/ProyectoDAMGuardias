import '../database.dart';

class GuardiasProfesTable extends SupabaseTable<GuardiasProfesRow> {
  @override
  String get tableName => 'guardiasProfes';

  @override
  GuardiasProfesRow createRow(Map<String, dynamic> data) =>
      GuardiasProfesRow(data);
}

class GuardiasProfesRow extends SupabaseDataRow {
  GuardiasProfesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GuardiasProfesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idProfe => getField<int>('id_profe');
  set idProfe(int? value) => setField<int>('id_profe', value);

  int? get idGuardia => getField<int>('id_guardia');
  set idGuardia(int? value) => setField<int>('id_guardia', value);
}
