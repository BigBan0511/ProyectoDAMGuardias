import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
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
