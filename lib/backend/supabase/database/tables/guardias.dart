import '../database.dart';

class GuardiasTable extends SupabaseTable<GuardiasRow> {
  @override
  String get tableName => 'Guardias';

  @override
  GuardiasRow createRow(Map<String, dynamic> data) => GuardiasRow(data);
}

class GuardiasRow extends SupabaseDataRow {
  GuardiasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GuardiasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idProfesor => getField<int>('id_profesor');
  set idProfesor(int? value) => setField<int>('id_profesor', value);

  int? get clase => getField<int>('Clase');
  set clase(int? value) => setField<int>('Clase', value);

  DateTime? get hora => getField<DateTime>('Hora');
  set hora(DateTime? value) => setField<DateTime>('Hora', value);
}
