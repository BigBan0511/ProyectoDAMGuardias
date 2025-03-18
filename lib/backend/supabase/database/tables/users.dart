import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  double? get numGuardias => getField<double>('num_guardias');
  set numGuardias(double? value) => setField<double>('num_guardias', value);

  String? get rol => getField<String>('rol');
  set rol(String? value) => setField<String>('rol', value);

  String? get idTabla => getField<String>('id_tabla');
  set idTabla(String? value) => setField<String>('id_tabla', value);

  bool? get activo => getField<bool>('activo');
  set activo(bool? value) => setField<bool>('activo', value);

  String? get imagenperfil => getField<String>('imagenperfil');
  set imagenperfil(String? value) => setField<String>('imagenperfil', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);
}
