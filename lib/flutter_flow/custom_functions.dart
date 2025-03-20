import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

/// Función para quitar la parte de primera hora o lo que sea del string de
/// selección de horas
String? quitarString(String hora) {
  String cadena = hora;
  int inicio = cadena.indexOf("(");
  int fin = cadena.indexOf(")");

  if (inicio != -1 && fin != -1) {
    String intervalo = cadena.substring(inicio + 1, fin);
    return intervalo;
  }
}

/// Con esto conseguimos cambiar la primera letra del día escogido a
/// mayúsculas
String cambiarAMayusculas(String dia) {
  String primerCaracterMayuscula = dia[0].toUpperCase();

  // Obtiene el resto de la cadena (desde el segundo carácter)
  String restoDeLaCadena = dia.substring(1);

  // Combina el primer carácter en mayúscula con el resto de la cadena
  return primerCaracterMayuscula + restoDeLaCadena;
}

/// Con este código obtenemos si las horas del que menos tiene son iguales al
/// que quiere aceptar la guardia
double dosconcincohoras(double hora1) {
  return hora1 + 3;
}
