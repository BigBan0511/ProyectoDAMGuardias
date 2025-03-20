import '../database.dart';

class HorarioTable extends SupabaseTable<HorarioRow> {
  @override
  String get tableName => 'horario';

  @override
  HorarioRow createRow(Map<String, dynamic> data) => HorarioRow(data);
}

class HorarioRow extends SupabaseDataRow {
  HorarioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HorarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get dia => getField<String>('dia');
  set dia(String? value) => setField<String>('dia', value);

  int? get profesor => getField<int>('profesor');
  set profesor(int? value) => setField<int>('profesor', value);

  String? get hora => getField<String>('hora');
  set hora(String? value) => setField<String>('hora', value);

  int? get clase => getField<int>('clase');
  set clase(int? value) => setField<int>('clase', value);

  String? get asignatura => getField<String>('asignatura');
  set asignatura(String? value) => setField<String>('asignatura', value);

  bool? get darclase => getField<bool>('darclase');
  set darclase(bool? value) => setField<bool>('darclase', value);
}
