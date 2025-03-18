import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en', 'zh_Hans', 'ru', 'eu'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
    String? zh_HansText = '',
    String? ruText = '',
    String? euText = '',
  }) =>
      [esText, enText, zh_HansText, ruText, euText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // InicioSesion
  {
    'jzb38jbr': {
      'es': 'GuardiApp',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'bk2jn6l4': {
      'es': 'Iniciar Sesión',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '19kcncnd': {
      'es': 'Bienvenido de vuelta',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'arz3q34z': {
      'es': 'Rellena la información para iniciar sesión',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ndu41gwg': {
      'es': 'Email',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '9mwjdrm8': {
      'es': 'Contraseña',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '0ajwm30p': {
      'es': 'Iniciar Sesión',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'sl5ixgax': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // InicioLogeado
  {
    'is5gco0a': {
      'es': 'GuardiApp',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'wfcyr5md': {
      'es': 'Bienvenido ',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'yp9347f0': {
      'es': 'Comenzar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'hrqu2o2s': {
      'es': 'GuardiApp',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '8m62imem': {
      'es': 'Bienvenido ',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'k1urpsmp': {
      'es': ', comience a organizar sus guardias',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    's3plbot5': {
      'es': 'Comenzar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'nlmfb8so': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // CrearModifUsuarios
  {
    'ns6a5c9i': {
      'es': 'Nombre completo',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'vgc412pl': {
      'es': 'Correo electrónico',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'l9ob7qy4': {
      'es': 'Contraseña inicial',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'm3u7ekq6': {
      'es': 'Generar contraseña',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '9h63cwbs': {
      'es': 'Permisos del usuario',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'w2zvfqs7': {
      'es': 'Administrador',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ly6oidit': {
      'es': 'Profesor',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'jp822thl': {
      'es': 'Crear usuario',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'v1ydk4nu': {
      'es': 'Please enter the patients full name.',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'shn0rsmb': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'um1nuzhw': {
      'es': 'Please enter an age for the patient.',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'm5vp154q': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '99cwtel4': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '29pwdc6f': {
      'es': 'Please enter the date of birth of the patient.',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'g6ampxsi': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'k9lzpqlb': {
      'es': 'Field is required',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'zvmvmss6': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ciohhm9b': {
      'es': 'Datos de usuario',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'a049fwnw': {
      'es': 'Rellene los datos del nuevo usuario o edítelos',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'df0xv7bz': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // MisGuardias
  {
    'upbftqx4': {
      'es': 'Buscar...',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'vh16n5z3': {
      'es': 'Clases',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'y07uayma': {
      'es': 'No-Code Platform Design',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'n8q726lj': {
      'es': '12 Projects',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'pg5bfbus': {
      'es': '30%',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'byc91sfx': {
      'es': 'Design for sample apps',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '8g007pbf': {
      'es': '12 Projects',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'buzwnyij': {
      'es': '30%',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'bc7g1k1z': {
      'es': 'Mis Guardias',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'mjfhji4h': {
      'es': 'Hoy',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'yxdibwti': {
      'es': 'Design Template Screens',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'e2ywllyw': {
      'es': 'Create template screen for task todo app.',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'x1o80kh4': {
      'es': 'Due',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '2525lyoo': {
      'es': 'Tuesday, 10:00am',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'xtp4vqgp': {
      'es': 'Aceptar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'nipfehzs': {
      'es': 'Theme Collection',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'scplj81p': {
      'es': 'Create themes for use by our users.',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'imfa2ut8': {
      'es': 'Due',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '5b578y4b': {
      'es': 'Tuesday, 10:00am',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'sbovrkfi': {
      'es': 'Aceptar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'rdtm8gpe': {
      'es': 'Siguiente',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    't4ijbd2t': {
      'es': 'Design Template Screens',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'q5fm3m94': {
      'es': 'Create template screen for task todo app.',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'uzxvpyx6': {
      'es': 'Due',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '44yiwf12': {
      'es': 'Tuesday, 10:00am',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '3zu28h44': {
      'es': 'In Progress',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'auc9k6cr': {
      'es': 'Design Template Screens',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'xvjgpkfi': {
      'es': 'Create template screen for task todo app.',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'qdwm0f61': {
      'es': 'Due',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'uk2qhzoo': {
      'es': 'Tuesday, 10:00am',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'qsnqhoia': {
      'es': 'In Progress',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'jz3bvca6': {
      'es': 'Completadas',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '9fdpykx6': {
      'es': 'Design Template Screens',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'sfgq4c5o': {
      'es': 'Create template screen for task todo app.',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '0pkynxp1': {
      'es': 'Completed',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'hnlmfg1d': {
      'es': 'Tuesday, 10:00am',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'f5l0nejn': {
      'es': 'Complete',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ptso5exy': {
      'es': 'Design Template Screens',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'b6ds16bw': {
      'es': 'Create template screen for task todo app.',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'u8r15inj': {
      'es': 'Completed',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'o1nq507b': {
      'es': 'Tuesday, 10:00am',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '4wcj6awb': {
      'es': 'Complete',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'p5et8xo3': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // PerfilProfe
  {
    'i52h25lq': {
      'es': 'Opciones',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'v8qfoec8': {
      'es': 'Cambiar Idioma',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'p714mxbb': {
      'es': 'Cambiar imagen de perfil',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'r6iqm4jr': {
      'es': 'Cerrar Sesión',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'gi75dpe6': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // Ajustes
  {
    'lbhxnhgi': {
      'es': 'Ajustes',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'lkpljhe9': {
      'es': 'Cambiar contraseña',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'rshrw9yo': {
      'es': 'Manual de uso',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'pm49mivc': {
      'es': 'Sobre nosotros',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'fq1h4ehm': {
      'es': 'Ayuda',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'pr3qc2fn': {
      'es': 'Política de privacidad',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '19n0lmc1': {
      'es': 'Términos y condiciones',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'nscx4dax': {
      'es': 'Visítanos',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '8cexnx5w': {
      'es': 'Versión',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'zofc3ctt': {
      'es': 'v0.0.1',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '80lrxehz': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // PanelControl
  {
    '1v7cgztb': {
      'es': 'Panel de control',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'b6k32oqa': {
      'es': 'Usuarios',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '7hvlus96': {
      'es': 'Horarios',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'usal3ygg': {
      'es': 'Aulas',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'bftka7q9': {
      'es': 'Guardias',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'lbj111x9': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // Usuarios
  {
    'gzj2q6ab': {
      'es': 'Lista de usuarios',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '9ezzojqo': {
      'es': 'Profesores',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'd2x5upvx': {
      'es': 'Editar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '02yzb1pa': {
      'es': 'Borrar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'v2y4n50z': {
      'es': 'Email',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'hi5rmjvb': {
      'es': 'Administradores',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'y0t5fkd5': {
      'es': 'Editar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'vqvwz53e': {
      'es': 'Borrar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'kw3pboei': {
      'es': 'Email',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'r8f7wvvy': {
      'es': 'Usuarios eliminados (Desactivados)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'v4i3za1i': {
      'es': 'Editar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'semu3sof': {
      'es': 'Borrar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'mknh24ii': {
      'es': 'Reactivar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'tmveh9rc': {
      'es': 'Email',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'mylttgtu': {
      'es': 'Usuarios',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'vhzn7btr': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // Guardias
  {
    '8zmwxcfj': {
      'es': 'Lista de guardias',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'nbhumf6r': {
      'es': '15:30 - 16:25',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'a266s5nr': {
      'es': 'Inglés',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '0obb16of': {
      'es': 'Eugenia',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '1w210bx0': {
      'es': 'Guardias',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '3334j6ok': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // CrearModifHorario
  {
    '02qzgzx3': {
      'es': 'Search...',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '414fnu7l': {
      'es': 'Lunes',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'rxa22axd': {
      'es': 'Martes',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '059oh251': {
      'es': 'Miércoles',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'sovns7u8': {
      'es': 'Jueves',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'axtesfhd': {
      'es': 'Viernes',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ap9bx6yb': {
      'es': 'Search...',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'gvc5xtd6': {
      'es': 'Search...',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'xzsiw1l5': {
      'es': 'Primera Hora (8:25 - 9:20)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'm7qk0qnw': {
      'es': 'Search...',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'q6rvn6e2': {
      'es': 'Primera Hora (8:25 - 9:20)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '99sq5l8q': {
      'es': 'Segunda Hora (9:20 - 10:15)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '4sumlpoy': {
      'es': 'Tercera Hora (10:15 - 11:10)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'l6tuj5r1': {
      'es': 'Recreo (11:10 - 11:30)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '7ju3myra': {
      'es': 'Cuarta Hora (11:30 - 12:25)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'eblidhmd': {
      'es': 'Quinta Hora (12:25 - 13:20)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'yz2nuum5': {
      'es': 'Sexta Hora (13:20 - 14:15)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '55g0w79j': {
      'es': 'Séptima Hora (14:15 - 15:10)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '36pvz05o': {
      'es': 'Primera Hora (15:30 - 16:25)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'rva0vh2r': {
      'es': 'Search...',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'mwd1prgx': {
      'es': 'Primera Hora (15:30 - 16:25)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'kendmtqz': {
      'es': 'Segunda Hora (16:25 - 17:20)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '77etonnh': {
      'es': 'Tercera Hora (17:20 - 18:15)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '1kgy741m': {
      'es': 'Recreo (18:15 - 18:35)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'kabuuvu3': {
      'es': 'Cuarta Hora (18:35 - 19:30)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'qxwkmfzl': {
      'es': 'Quinta Hora (19:30 - 20:25)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'jbpurm4p': {
      'es': 'Sexta Hora (20:25 - 21:20)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '0aa0bu2s': {
      'es': 'Séptima Hora (21:20 - 22:15)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'uqs8w7su': {
      'es': 'Asignatura',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'jezz2xw5': {
      'es': 'Añadir hora',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ucix0b8n': {
      'es': 'Confirmar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'sc9heewa': {
      'es': 'Crear/Modificar Horario',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '8wmogfrc': {
      'es': 'Rellene el horario del dia especificado',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'urf5xfhg': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // Horarios
  {
    'q0x5uvj5': {
      'es': 'Lunes',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'depsmiom': {
      'es': 'Martes',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'xvk4anlw': {
      'es': 'Miércoles',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '4wihex7a': {
      'es': 'Jueves',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '7mckwh5j': {
      'es': 'Viernes',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'sh1an7kb': {
      'es': 'Horarios',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'j1t2u0md': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // PrototipoHomePage
  {
    '48kce4fo': {
      'es': 'Inicio',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'yri8dj0j': {
      'es': 'Title (Acceso a Datos)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '1pfwi4ik': {
      'es': '15:30 - 16:25',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'pbdle8j6': {
      'es': 'Title',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '203olvkg': {
      'es': '16:25 - 17:20',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'j76kw7ei': {
      'es': 'Title',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '0kszxqei': {
      'es': '17:20 - 18:15',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'z05gum7p': {
      'es': 'Recreo',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'p21eq87s': {
      'es': '18:15 - 18:35',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'co0he0p3': {
      'es': 'Title',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'a7xd8nh2': {
      'es': '18:35 - 19:30',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '2x4ekyvh': {
      'es': 'Title',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ulkgiyge': {
      'es': '19:30 - 20:25',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '34fgi40e': {
      'es': 'Title',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'g5t103yl': {
      'es': '20:25 - 21:20',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'mmm626lg': {
      'es': '15:30 - 16:25',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'dinybta1': {
      'es': '16:25 - 17:20',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '95blb8ok': {
      'es': '17:20 - 18:15',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'mr0d1n9f': {
      'es': 'Recreo',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'm1vjiojz': {
      'es': '18:15 - 18:35',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'x9pscngn': {
      'es': '18:35 - 19:30',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'idehbxam': {
      'es': '19:30 - 20:25',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'tcplv63g': {
      'es': '20:25 - 21:20',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'g5w1u3jj': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // Aulas
  {
    'rh72m42p': {
      'es': 'Lista de aulas del centro',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'qdgeiy6v': {
      'es': 'Aulas',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'tfg0i11p': {
      'es': 'Home',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // SelectorIdioma
  {
    'il04urf9': {
      'es': 'Elegir idioma',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '8l6ot1ey': {
      'es': 'Español',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '9sgz3l3z': {
      'es': 'Inglés',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'gl0bicel': {
      'es': 'Ruso',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'eqlc4jss': {
      'es': 'Chino',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'szy1xko4': {
      'es': 'Vasco',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // menuTelef
  {
    'pxyyj555': {
      'es': 'Menú',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ceqb5xee': {
      'es': 'Perfil',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'zvp5rkzv': {
      'es': 'Ajustes',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '281lecsq': {
      'es': 'Mis guardias',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'pixl5sae': {
      'es': 'Panel de control',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'gw06c73f': {
      'es': 'Modo claro',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '43rxee57': {
      'es': 'Modo oscuro',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'w8qw2lrk': {
      'es': 'Cerrar sesión',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // barraLateral
  {
    'v09odcg8': {
      'es': 'Perfil',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ghuzykvk': {
      'es': 'Mis guardias',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ljg2gaom': {
      'es': 'Ajustes',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'j9s8l5ns': {
      'es': 'Panel de control',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '8jts9kb9': {
      'es': 'Cerrar Sesión',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // cambiarContrasena
  {
    '9rpfabu9': {
      'es': 'Cambiar contraseña',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    't1v6couk': {
      'es': 'Nueva contraseña',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'nwrgvanu': {
      'es': 'Confirmar contraseña',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '3e42c6fn': {
      'es': 'Confirmar cambio',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // ElegirTramo
  {
    'pbm3nx8m': {
      'es': 'Diurno',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'si8hkbr3': {
      'es': 'Vespertino',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // ConfirmarHora
  {
    'uudsropp': {
      'es': 'Datos de la Hora',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'gl2btpxu': {
      'es': 'Cancelar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'v0p8agp8': {
      'es': 'Confirmar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // confirmarUsuario
  {
    '4qv5qwq6': {
      'es': 'Usuario creado',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'tbco9jii': {
      'es': 'Aceptar',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    't6om783z': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '8hgdkag3': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '9wf3ug6n': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'jrm9g1lu': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'xinx50j7': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '7g73admo': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'g679m5dw': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'fynux3jz': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '29mir2qq': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '7uj2jyin': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '6ekkc203': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '7gxvb7em': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'wbyx2jp7': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'i9ezvv4l': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'v00rm7vn': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'sg8cc9k1': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'm8h9l0ab': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '0gcazc19': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'wpyhef9l': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '07laiflv': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '6ylruhkr': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'hk1n83pl': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ei6da3tb': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '62hc26g6': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '9ytfr6uk': {
      'es': '',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
