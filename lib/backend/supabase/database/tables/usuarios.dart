import '../database.dart';

class UsuariosTable extends SupabaseTable<UsuariosRow> {
  @override
  String get tableName => 'Usuarios';

  @override
  UsuariosRow createRow(Map<String, dynamic> data) => UsuariosRow(data);
}

class UsuariosRow extends SupabaseDataRow {
  UsuariosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuariosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  double? get numGuardias => getField<double>('num_guardias');
  set numGuardias(double? value) => setField<double>('num_guardias', value);

  String? get rol => getField<String>('rol');
  set rol(String? value) => setField<String>('rol', value);

  String? get idauth => getField<String>('idauth');
  set idauth(String? value) => setField<String>('idauth', value);
}
