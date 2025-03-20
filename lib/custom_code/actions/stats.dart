// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

/// Con este código generamos las estadísticas de la app llamando a funciones
/// de Supabase
Future stats(String funcion) async {
  // Add your function code here!
  final supabase = Supabase.instance.client;

  if (funcion == "f1") {
    try {
      await supabase.rpc('f1');
    } catch (e) {
      throw Exception('Error al ejecutar la función: $e');
    }
  }
  if (funcion == "f2") {
    try {
      await supabase.rpc('f2');
    } catch (e) {
      throw Exception('Error al ejecutar la función: $e');
    }
  }
  if (funcion == "f3") {
    try {
      await supabase.rpc('f3');
    } catch (e) {
      throw Exception('Error al ejecutar la función: $e');
    }
  }
  if (funcion == "f4") {
    try {
      await supabase.rpc('f4');
    } catch (e) {
      throw Exception('Error al ejecutar la función: $e');
    }
  }
}
