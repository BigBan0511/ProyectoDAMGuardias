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
  // HomePage
  {
    '48kce4fo': {
      'es': 'Inicio',
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
  // InicioSesion
  {
    '74cut5n7': {
      'es': 'Guardias (temporal)',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ggdpmx5n': {
      'es': 'Crear Cuenta',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '0ke3hje0': {
      'es': 'Crear Cuenta',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'vaz8f11f': {
      'es': 'Rellena los campos para poder crear tu cuenta',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'd0stplk0': {
      'es': 'Email',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '9x32styu': {
      'es': 'Contraseña',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'su8fwhv6': {
      'es': 'Crear Cuenta',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'rsvyukbr': {
      'es': 'Iniciar Sesión',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'zej7bfhr': {
      'es': 'Bienvenido de vuelta',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'c9q7xg02': {
      'es': 'Rellena la información para iniciar sesión',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    '78zoye7p': {
      'es': 'Email',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    's51w4k2m': {
      'es': 'Contraseña',
      'en': '',
      'eu': '',
      'ru': '',
      'zh_Hans': '',
    },
    'jdnmy8gu': {
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
  // inicio
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
