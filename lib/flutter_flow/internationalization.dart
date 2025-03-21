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
      'en': 'GuardiApp',
      'eu': 'GuardiApp',
      'ru': 'GuardiApp',
      'zh_Hans': 'GuardiApp',
    },
    'bk2jn6l4': {
      'es': 'Iniciar Sesión',
      'en': 'Login',
      'eu': 'Saioa hasi',
      'ru': 'Авторизоваться',
      'zh_Hans': '登录',
    },
    '19kcncnd': {
      'es': 'Bienvenido de vuelta',
      'en': 'Welcome back',
      'eu': 'Ongi etorri berriro',
      'ru': 'Добро пожаловать',
      'zh_Hans': '欢迎回来',
    },
    'arz3q34z': {
      'es': 'Rellena la información para iniciar sesión',
      'en': 'Fill in the information to log in',
      'eu': 'Bete informazioa saioa hasteko',
      'ru': 'Заполните информацию для входа',
      'zh_Hans': '填写信息登录',
    },
    'ndu41gwg': {
      'es': 'Email',
      'en': 'E-mail',
      'eu': 'Posta elektronikoa',
      'ru': 'Электронная почта',
      'zh_Hans': '电子邮件',
    },
    '9mwjdrm8': {
      'es': 'Contraseña',
      'en': 'Password',
      'eu': 'Pasahitza',
      'ru': 'Пароль',
      'zh_Hans': '密码',
    },
    '0ajwm30p': {
      'es': 'Iniciar Sesión',
      'en': 'Login',
      'eu': 'Saioa hasi',
      'ru': 'Авторизоваться',
      'zh_Hans': '登录',
    },
    'sl5ixgax': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // InicioLogeado
  {
    'is5gco0a': {
      'es': 'GuardiApp',
      'en': 'GuardiApp',
      'eu': 'GuardiApp',
      'ru': 'GuardiApp',
      'zh_Hans': 'GuardiApp',
    },
    'wfcyr5md': {
      'es': 'Bienvenido ',
      'en': 'Welcome',
      'eu': 'Ongi etorri',
      'ru': 'Добро пожаловать',
      'zh_Hans': '欢迎',
    },
    'yp9347f0': {
      'es': 'Comenzar',
      'en': 'Begin',
      'eu': 'Hasi',
      'ru': 'Начинать',
      'zh_Hans': '开始',
    },
    'hrqu2o2s': {
      'es': 'GuardiApp',
      'en': 'GuardiApp',
      'eu': 'GuardiApp',
      'ru': 'GuardiApp',
      'zh_Hans': 'GuardiApp',
    },
    '8m62imem': {
      'es': 'Bienvenido ',
      'en': 'Welcome',
      'eu': 'Ongi etorri',
      'ru': 'Добро пожаловать',
      'zh_Hans': '欢迎',
    },
    'k1urpsmp': {
      'es': ', comience a organizar sus guardias',
      'en': ', start organizing your guards',
      'eu': ', hasi zure guardiak antolatzen',
      'ru': ', начните организовывать своих охранников',
      'zh_Hans': '，开始组织你的警卫',
    },
    's3plbot5': {
      'es': 'Comenzar',
      'en': 'Begin',
      'eu': 'Hasi',
      'ru': 'Начинать',
      'zh_Hans': '开始',
    },
    'nlmfb8so': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // CrearModifUsuarios
  {
    'ns6a5c9i': {
      'es': 'Nombre completo',
      'en': 'Full name',
      'eu': 'Izen osoa',
      'ru': 'Полное имя',
      'zh_Hans': '姓名',
    },
    'vgc412pl': {
      'es': 'Correo electrónico',
      'en': 'Email',
      'eu': 'Posta elektronikoa',
      'ru': 'Электронная почта',
      'zh_Hans': '电子邮件',
    },
    'l9ob7qy4': {
      'es': 'Contraseña inicial',
      'en': 'Initial password',
      'eu': 'Hasierako pasahitza',
      'ru': 'Первоначальный пароль',
      'zh_Hans': '初始密码',
    },
    'm3u7ekq6': {
      'es': 'Generar contraseña',
      'en': 'Generate password',
      'eu': 'Sortu pasahitza',
      'ru': 'Сгенерировать пароль',
      'zh_Hans': '生成密码',
    },
    '9h63cwbs': {
      'es': 'Permisos del usuario',
      'en': 'User permissions',
      'eu': 'Erabiltzaileen baimenak',
      'ru': 'Разрешения пользователя',
      'zh_Hans': '用户权限',
    },
    'w2zvfqs7': {
      'es': 'Administrador',
      'en': 'Administrator',
      'eu': 'Administratzailea',
      'ru': 'Администратор',
      'zh_Hans': '行政人员',
    },
    'ly6oidit': {
      'es': 'Profesor',
      'en': 'Teacher',
      'eu': 'Irakaslea',
      'ru': 'Учитель',
      'zh_Hans': '老师',
    },
    'jp822thl': {
      'es': 'Crear usuario',
      'en': 'Create user',
      'eu': 'Sortu erabiltzailea',
      'ru': 'Создать пользователя',
      'zh_Hans': '创建用户',
    },
    'v1ydk4nu': {
      'es': 'Please enter the patients full name.',
      'en': 'Please enter the patients full name.',
      'eu': 'Mesedez, idatzi pazientearen izen-abizenak.',
      'ru': 'Введите полное имя пациента.',
      'zh_Hans': '请输入患者的全名。',
    },
    'shn0rsmb': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'eu': 'Mesedez, aukeratu goitibeherako aukera bat',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'um1nuzhw': {
      'es': 'Please enter an age for the patient.',
      'en': 'Please enter an age for the patient.',
      'eu': 'Mesedez, sartu pazientearen adina.',
      'ru': 'Введите возраст пациента.',
      'zh_Hans': '请输入患者的年龄。',
    },
    'm5vp154q': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'eu': 'Mesedez, aukeratu goitibeherako aukera bat',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '99cwtel4': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'eu': 'Mesedez, aukeratu goitibeherako aukera bat',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '29pwdc6f': {
      'es': 'Please enter the date of birth of the patient.',
      'en': 'Please enter the date of birth of the patient.',
      'eu': 'Mesedez, idatzi pazientearen jaioteguna.',
      'ru': 'Введите дату рождения пациента.',
      'zh_Hans': '请输入患者的出生日期。',
    },
    'g6ampxsi': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'eu': 'Mesedez, aukeratu goitibeherako aukera bat',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'k9lzpqlb': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
      'ru': 'Поле обязательно для заполнения',
      'zh_Hans': '必填字段',
    },
    'zvmvmss6': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'eu': 'Mesedez, aukeratu goitibeherako aukera bat',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'ciohhm9b': {
      'es': 'Datos de usuario',
      'en': 'User data',
      'eu': 'Erabiltzailearen datuak',
      'ru': 'Данные пользователя',
      'zh_Hans': '用户数据',
    },
    'a049fwnw': {
      'es': 'Rellene los datos del nuevo usuario o edítelos',
      'en': 'Fill in the new user\'s details or edit them',
      'eu': 'Bete erabiltzaile berriaren datuak edo editatu',
      'ru': 'Заполните данные нового пользователя или отредактируйте их.',
      'zh_Hans': '填写新用户的详细信息或编辑它们',
    },
    'df0xv7bz': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // PerfilProfe
  {
    'i52h25lq': {
      'es': 'Opciones',
      'en': 'Options',
      'eu': 'Aukerak',
      'ru': 'Параметры',
      'zh_Hans': '选项',
    },
    'v8qfoec8': {
      'es': 'Cambiar Idioma',
      'en': 'Change Language',
      'eu': 'Hizkuntza aldatu',
      'ru': 'Изменить язык',
      'zh_Hans': '更改语言',
    },
    'p714mxbb': {
      'es': 'Cambiar imagen de perfil',
      'en': 'Change profile picture',
      'eu': 'Aldatu profileko argazkia',
      'ru': 'Изменить фотографию профиля',
      'zh_Hans': '更改个人资料图片',
    },
    '70mfyee5': {
      'es': 'Cambiar contraseña',
      'en': 'Change password',
      'eu': 'Aldatu pasahitza',
      'ru': 'Изменить пароль',
      'zh_Hans': '更改密码',
    },
    'r6iqm4jr': {
      'es': 'Cerrar Sesión',
      'en': 'Log Out',
      'eu': 'Amaitu saioa',
      'ru': 'Выйти',
      'zh_Hans': '登出',
    },
    'rz8i3rn5': {
      'es': 'Visítanos',
      'en': 'Visit us',
      'eu': 'Bisita gaitzazu',
      'ru': 'Посетите нас',
      'zh_Hans': '访问我们',
    },
    'ew7mho8f': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // PanelControl
  {
    '1v7cgztb': {
      'es': 'Panel de control',
      'en': 'control Panel',
      'eu': 'kontrol panela',
      'ru': 'панель управления',
      'zh_Hans': '控制面板',
    },
    'b6k32oqa': {
      'es': 'Usuarios',
      'en': 'Users',
      'eu': 'Erabiltzaileak',
      'ru': 'Пользователи',
      'zh_Hans': '用户',
    },
    '7hvlus96': {
      'es': 'Horarios',
      'en': 'Schedules',
      'eu': 'Ordutegiak',
      'ru': 'Расписания',
      'zh_Hans': '时间表',
    },
    'usal3ygg': {
      'es': 'Aulas',
      'en': 'Classrooms',
      'eu': 'Ikasgelak',
      'ru': 'Классы',
      'zh_Hans': '教室',
    },
    'bftka7q9': {
      'es': 'Guardias',
      'en': 'Guards',
      'eu': 'Zaindariak',
      'ru': 'Охранники',
      'zh_Hans': '守卫',
    },
    'ys1wfgfl': {
      'es': 'Estadísticas',
      'en': 'Statistics',
      'eu': 'Estatistikak',
      'ru': 'Статистика',
      'zh_Hans': '统计数据',
    },
    'lbj111x9': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // Usuarios
  {
    'gzj2q6ab': {
      'es': 'Lista de usuarios',
      'en': 'List of users',
      'eu': 'Erabiltzaileen zerrenda',
      'ru': 'Список пользователей',
      'zh_Hans': '用户列表',
    },
    '9ezzojqo': {
      'es': 'Profesores',
      'en': 'Teachers',
      'eu': 'Irakasleak',
      'ru': 'Учителя',
      'zh_Hans': '教师',
    },
    'd2x5upvx': {
      'es': 'Editar',
      'en': 'Edit',
      'eu': 'Editatu',
      'ru': 'Редактировать',
      'zh_Hans': '编辑',
    },
    '02yzb1pa': {
      'es': 'Borrar',
      'en': 'Delete',
      'eu': 'Ezabatu',
      'ru': 'Удалить',
      'zh_Hans': '删除',
    },
    'hi5rmjvb': {
      'es': 'Administradores',
      'en': 'Administrators',
      'eu': 'Administratzaileak',
      'ru': 'Администраторы',
      'zh_Hans': '管理员',
    },
    'y0t5fkd5': {
      'es': 'Editar',
      'en': 'Edit',
      'eu': 'Editatu',
      'ru': 'Редактировать',
      'zh_Hans': '编辑',
    },
    'vqvwz53e': {
      'es': 'Borrar',
      'en': 'Delete',
      'eu': 'Ezabatu',
      'ru': 'Удалить',
      'zh_Hans': '删除',
    },
    'r8f7wvvy': {
      'es': 'Usuarios eliminados (Desactivados)',
      'en': 'Deleted Users (Deactivated)',
      'eu': 'Ezabatutako erabiltzaileak (Desaktibatuta)',
      'ru': 'Удаленные пользователи (деактивированы)',
      'zh_Hans': '已删除用户（已停用）',
    },
    'v4i3za1i': {
      'es': 'Editar',
      'en': 'Edit',
      'eu': 'Editatu',
      'ru': 'Редактировать',
      'zh_Hans': '编辑',
    },
    'semu3sof': {
      'es': 'Borrar',
      'en': 'Delete',
      'eu': 'Ezabatu',
      'ru': 'Удалить',
      'zh_Hans': '删除',
    },
    's3vy1f05': {
      'es': 'Reactivar',
      'en': 'Reactivate',
      'eu': 'Berriz aktibatu',
      'ru': 'Реактивировать',
      'zh_Hans': '重新激活',
    },
    'mylttgtu': {
      'es': 'Usuarios',
      'en': 'Users',
      'eu': 'Erabiltzaileak',
      'ru': 'Пользователи',
      'zh_Hans': '用户',
    },
    'r9hq56kg': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // CrearModifHorario
  {
    '02qzgzx3': {
      'es': 'Search...',
      'en': 'Search...',
      'eu': 'Bilatu...',
      'ru': 'Поиск...',
      'zh_Hans': '搜索...',
    },
    '414fnu7l': {
      'es': 'Lunes',
      'en': 'Monday',
      'eu': 'astelehena',
      'ru': 'Понедельник',
      'zh_Hans': '周一',
    },
    'rxa22axd': {
      'es': 'Martes',
      'en': 'Tuesday',
      'eu': 'asteartea',
      'ru': 'Вторник',
      'zh_Hans': '周二',
    },
    '059oh251': {
      'es': 'Miércoles',
      'en': 'Wednesday',
      'eu': 'asteazkena',
      'ru': 'Среда',
      'zh_Hans': '周三',
    },
    'sovns7u8': {
      'es': 'Jueves',
      'en': 'Thursday',
      'eu': 'Osteguna',
      'ru': 'Четверг',
      'zh_Hans': '周四',
    },
    'axtesfhd': {
      'es': 'Viernes',
      'en': 'Friday',
      'eu': 'ostirala',
      'ru': 'Пятница',
      'zh_Hans': '星期五',
    },
    'ap9bx6yb': {
      'es': 'Search...',
      'en': 'Search...',
      'eu': 'Bilatu...',
      'ru': 'Поиск...',
      'zh_Hans': '搜索...',
    },
    'gvc5xtd6': {
      'es': 'Search...',
      'en': 'Search...',
      'eu': 'Bilatu...',
      'ru': 'Поиск...',
      'zh_Hans': '搜索...',
    },
    'xzsiw1l5': {
      'es': 'Primera Hora (8:25 - 9:20)',
      'en': 'First Hour (8:25 - 9:20)',
      'eu': 'Lehen ordua (8:25 - 9:20)',
      'ru': 'Первый час (8:25 - 9:20)',
      'zh_Hans': '第一小时 (8:25 - 9:20)',
    },
    'slhh5s3q': {
      'es': 'Selector de Hora',
      'en': 'Time Selector',
      'eu': 'Ordu-hautatzailea',
      'ru': 'Селектор времени',
      'zh_Hans': '时间选择器',
    },
    'm7qk0qnw': {
      'es': 'Search...',
      'en': 'Search...',
      'eu': 'Bilatu...',
      'ru': 'Поиск...',
      'zh_Hans': '搜索...',
    },
    'q6rvn6e2': {
      'es': 'Primera Hora (8:25 - 9:20)',
      'en': 'First Hour (8:25 - 9:20)',
      'eu': 'Lehen ordua (8:25 - 9:20)',
      'ru': 'Первый час (8:25 - 9:20)',
      'zh_Hans': '第一小时 (8:25 - 9:20)',
    },
    '99sq5l8q': {
      'es': 'Segunda Hora (9:20 - 10:15)',
      'en': 'Second Hour (9:20 - 10:15)',
      'eu': 'Bigarren ordua (9:20 - 10:15)',
      'ru': 'Второй час (9:20 - 10:15)',
      'zh_Hans': '第二个小时 (9:20 - 10:15)',
    },
    '4sumlpoy': {
      'es': 'Tercera Hora (10:15 - 11:10)',
      'en': 'Third Hour (10:15 - 11:10)',
      'eu': 'Hirugarren ordua (10:15 - 11:10)',
      'ru': 'Третий час (10:15 - 11:10)',
      'zh_Hans': '第三个小时 (10:15 - 11:10)',
    },
    'l6tuj5r1': {
      'es': 'Recreo (11:10 - 11:30)',
      'en': 'Recess (11:10 - 11:30)',
      'eu': 'Atsedenaldia (11:10 - 11:30)',
      'ru': 'Перерыв (11:10 - 11:30)',
      'zh_Hans': '休息（11:10 - 11:30）',
    },
    '7ju3myra': {
      'es': 'Cuarta Hora (11:30 - 12:25)',
      'en': 'Fourth Hour (11:30 - 12:25)',
      'eu': 'Laugarren ordua (11:30 - 12:25)',
      'ru': 'Четвертый час (11:30 - 12:25)',
      'zh_Hans': '第四个小时 (11:30 - 12:25)',
    },
    'eblidhmd': {
      'es': 'Quinta Hora (12:25 - 13:20)',
      'en': 'Fifth Hour (12:25 - 13:20)',
      'eu': 'Bosgarren ordua (12:25 - 13:20)',
      'ru': 'Пятый час (12:25 - 13:20)',
      'zh_Hans': '第五个小时 (12:25 - 13:20)',
    },
    'yz2nuum5': {
      'es': 'Sexta Hora (13:20 - 14:15)',
      'en': 'Sixth Hour (1:20 PM - 2:15 PM)',
      'eu': 'Seigarren ordua (13:20 - 14:15)',
      'ru': 'Шестой час (1:20 PM - 2:15 PM)',
      'zh_Hans': '第六个小时（下午 1:20 - 下午 2:15）',
    },
    '55g0w79j': {
      'es': 'Séptima Hora (14:15 - 15:10)',
      'en': 'Seventh Hour (2:15 PM - 3:10 PM)',
      'eu': 'Zazpigarren ordua (14:15 - 15:10)',
      'ru': 'Седьмой час (14:15 - 15:10)',
      'zh_Hans': '第七小时（下午 2:15 - 下午 3:10）',
    },
    '36pvz05o': {
      'es': 'Primera Hora (15:30 - 16:25)',
      'en': 'First Hour (3:30 PM - 4:25 PM)',
      'eu': 'Lehen ordua (15:30 - 16:25)',
      'ru': 'Первый час (15:30 - 16:25)',
      'zh_Hans': '第一小时（下午 3:30 - 下午 4:25）',
    },
    'ptpu4q9e': {
      'es': 'Selector de Hora',
      'en': 'Time Selector',
      'eu': 'Denbora hautatzailea',
      'ru': 'Селектор времени',
      'zh_Hans': '时间选择器',
    },
    'rva0vh2r': {
      'es': 'Search...',
      'en': 'Search...',
      'eu': 'Bilatu...',
      'ru': 'Поиск...',
      'zh_Hans': '搜索...',
    },
    'mwd1prgx': {
      'es': 'Primera Hora (15:30 - 16:25)',
      'en': 'First Hour (3:30 PM - 4:25 PM)',
      'eu': 'Lehen ordua (15:30 - 16:25)',
      'ru': 'Первый час (15:30 - 16:25)',
      'zh_Hans': '第一小时（下午 3:30 - 下午 4:25）',
    },
    'kendmtqz': {
      'es': 'Segunda Hora (16:25 - 17:20)',
      'en': 'Second Hour (16:25 - 17:20)',
      'eu': 'Bigarren ordua (16:25 - 17:20)',
      'ru': 'Второй час (16:25 - 17:20)',
      'zh_Hans': '第二小时 (16:25 - 17:20)',
    },
    '77etonnh': {
      'es': 'Tercera Hora (17:20 - 18:15)',
      'en': 'Third Hour (17:20 - 18:15)',
      'eu': 'Hirugarren ordua (17:20 - 18:15)',
      'ru': 'Третий час (17:20 - 18:15)',
      'zh_Hans': '第三个小时 (17:20 - 18:15)',
    },
    '1kgy741m': {
      'es': 'Recreo (18:15 - 18:35)',
      'en': 'Recess (6:15 - 6:35 PM)',
      'eu': 'Atsedenaldia (18:15 - 18:35)',
      'ru': 'Перерыв (18:15 - 18:35)',
      'zh_Hans': '休息（下午 6:15 - 6:35）',
    },
    'kabuuvu3': {
      'es': 'Cuarta Hora (18:35 - 19:30)',
      'en': 'Fourth Hour (18:35 - 19:30)',
      'eu': 'Laugarren ordua (18:35 - 19:30)',
      'ru': 'Четвертый час (18:35 - 19:30)',
      'zh_Hans': '第四个小时 (18:35 - 19:30)',
    },
    'qxwkmfzl': {
      'es': 'Quinta Hora (19:30 - 20:25)',
      'en': 'Fifth Hour (7:30 PM - 8:25 PM)',
      'eu': 'Bosgarren ordua (19:30 - 20:25)',
      'ru': 'Пятый час (7:30 вечера - 8:25 вечера)',
      'zh_Hans': '第五个小时（晚上 7:30 - 8:25）',
    },
    'jbpurm4p': {
      'es': 'Sexta Hora (20:25 - 21:20)',
      'en': 'Sixth Hour (8:25 PM - 9:20 PM)',
      'eu': 'Seigarren ordua (20:25 - 21:20)',
      'ru': 'Шестой час (8:25 вечера - 9:20 вечера)',
      'zh_Hans': '第六个小时（晚上 8:25 - 9:20）',
    },
    '0aa0bu2s': {
      'es': 'Séptima Hora (21:20 - 22:15)',
      'en': 'Seventh Hour (9:20 PM - 10:15 PM)',
      'eu': 'Zazpigarren ordua (21:20 - 22:15)',
      'ru': 'Седьмой час (9:20 вечера - 10:15 вечера)',
      'zh_Hans': '第七小时 (晚上 9:20 - 10:15)',
    },
    'uqs8w7su': {
      'es': 'Asignatura',
      'en': 'Subject',
      'eu': 'Gaia',
      'ru': 'Предмет',
      'zh_Hans': '主题',
    },
    'bm9uz33k': {
      'es': 'Generar horario',
      'en': 'Generate schedule',
      'eu': 'Sortu ordutegia',
      'ru': 'Сгенерировать расписание',
      'zh_Hans': '生成时间表',
    },
    'zksqnwyw': {
      'es': 'Generar horario',
      'en': 'Generate schedule',
      'eu': 'Sortu ordutegia',
      'ru': 'Сгенерировать расписание',
      'zh_Hans': '生成时间表',
    },
    '4yj2uaoo': {
      'es': 'Añadir hora',
      'en': 'Add time',
      'eu': 'Gehitu denbora',
      'ru': 'Добавить время',
      'zh_Hans': '添加时间',
    },
    'ucix0b8n': {
      'es': 'Confirmar',
      'en': 'Confirm',
      'eu': 'Berretsi',
      'ru': 'Подтверждать',
      'zh_Hans': '确认',
    },
    'sc9heewa': {
      'es': 'Crear/Modificar Horario',
      'en': 'Create/Modify Schedule',
      'eu': 'Sortu/Aldatu ordutegia',
      'ru': 'Создать/изменить расписание',
      'zh_Hans': '创建/修改时间表',
    },
    '8wmogfrc': {
      'es': 'Rellene el horario del dia especificado',
      'en': 'Fill in the schedule for the specified day',
      'eu': 'Bete zehaztutako eguneko ordutegia',
      'ru': 'Заполните расписание на указанный день',
      'zh_Hans': '填写指定日期的日程',
    },
    's602t6gj': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // Horarios
  {
    'syotxa39': {
      'es': 'Filtrar',
      'en': 'Filter',
      'eu': 'Iragazkia',
      'ru': 'Фильтр',
      'zh_Hans': '筛选',
    },
    '37n24pv2': {
      'es': 'Search...',
      'en': 'Search...',
      'eu': 'Bilatu...',
      'ru': 'Поиск...',
      'zh_Hans': '搜索...',
    },
    'txfqtv2q': {
      'es': 'Option 1',
      'en': 'Option 1',
      'eu': '1. aukera',
      'ru': 'Вариант 1',
      'zh_Hans': '选项 1',
    },
    'u4khusm3': {
      'es': 'Option 2',
      'en': 'Option 2',
      'eu': '2. aukera',
      'ru': 'Вариант 2',
      'zh_Hans': '选项 2',
    },
    'rvlw586n': {
      'es': 'Option 3',
      'en': 'Option 3',
      'eu': '3. aukera',
      'ru': 'Вариант 3',
      'zh_Hans': '选项 3',
    },
    'fv2b8yl9': {
      'es': 'Lunes',
      'en': 'Monday',
      'eu': 'astelehena',
      'ru': 'Понедельник',
      'zh_Hans': '周一',
    },
    'za0wl657': {
      'es': 'Martes',
      'en': 'Tuesday',
      'eu': 'asteartea',
      'ru': 'Вторник',
      'zh_Hans': '周二',
    },
    'tfmer2iv': {
      'es': 'Miércoles',
      'en': 'Wednesday',
      'eu': 'asteazkena',
      'ru': 'Среда',
      'zh_Hans': '周三',
    },
    'duonf10y': {
      'es': 'Jueves',
      'en': 'Thursday',
      'eu': 'Osteguna',
      'ru': 'Четверг',
      'zh_Hans': '周四',
    },
    'pha3cdq1': {
      'es': 'Viernes',
      'en': 'Friday',
      'eu': 'ostirala',
      'ru': 'Пятница',
      'zh_Hans': '星期五',
    },
    'sh1an7kb': {
      'es': 'Horarios',
      'en': 'Schedules',
      'eu': 'Ordutegiak',
      'ru': 'Расписания',
      'zh_Hans': '时间表',
    },
    'az14jiiq': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // Inicio
  {
    '48kce4fo': {
      'es': 'Inicio',
      'en': 'Start',
      'eu': 'Hasi',
      'ru': 'Начинать',
      'zh_Hans': '开始',
    },
    'n8ewci4u': {
      'es': 'No asistir',
      'en': 'Do not attend',
      'eu': 'Ez joan',
      'ru': 'Не посещать',
      'zh_Hans': '不参加',
    },
    'ziy0mwka': {
      'es': 'Cancelar',
      'en': 'Cancel',
      'eu': 'Utzi',
      'ru': 'Отмена',
      'zh_Hans': '取消',
    },
    'eo5nnwbw': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // Aulas
  {
    'rh72m42p': {
      'es': 'Lista de aulas del centro',
      'en': 'List of classrooms in the center',
      'eu': 'Zentroko ikasgelen zerrenda',
      'ru': 'Список учебных классов в центре',
      'zh_Hans': '中心教室列表',
    },
    'qdgeiy6v': {
      'es': 'Aulas',
      'en': 'Classrooms',
      'eu': 'Ikasgelak',
      'ru': 'Классы',
      'zh_Hans': '教室',
    },
    'tfg0i11p': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // Guardias
  {
    'nzu6z9db': {
      'es': 'Lunes',
      'en': 'Monday',
      'eu': 'astelehena',
      'ru': 'Понедельник',
      'zh_Hans': '周一',
    },
    'dq4hdhck': {
      'es': 'Posibles asignaciones:',
      'en': 'Possible assignments:',
      'eu': 'Egin daitezkeen lanak:',
      'ru': 'Возможные задания:',
      'zh_Hans': '可能的任务：',
    },
    'nnvpwab6': {
      'es': 'Martes',
      'en': 'Tuesday',
      'eu': 'asteartea',
      'ru': 'Вторник',
      'zh_Hans': '周二',
    },
    'x6s8obnf': {
      'es': 'Posibles asignaciones:',
      'en': 'Possible assignments:',
      'eu': 'Egin daitezkeen lanak:',
      'ru': 'Возможные задания:',
      'zh_Hans': '可能的任务：',
    },
    '8168xc6g': {
      'es': 'Miércoles',
      'en': 'Wednesday',
      'eu': 'asteazkena',
      'ru': 'Среда',
      'zh_Hans': '周三',
    },
    '5y4v94h3': {
      'es': 'Posibles asignaciones:',
      'en': 'Possible assignments:',
      'eu': 'Egin daitezkeen lanak:',
      'ru': 'Возможные задания:',
      'zh_Hans': '可能的任务：',
    },
    'vcsvny35': {
      'es': 'Jueves',
      'en': 'Thursday',
      'eu': 'Osteguna',
      'ru': 'Четверг',
      'zh_Hans': '周四',
    },
    '3r12hefe': {
      'es': 'Posibles asignaciones:',
      'en': 'Possible assignments:',
      'eu': 'Egin daitezkeen lanak:',
      'ru': 'Возможные задания:',
      'zh_Hans': '可能的任务：',
    },
    'djklgja7': {
      'es': 'Viernes',
      'en': 'Friday',
      'eu': 'ostirala',
      'ru': 'Пятница',
      'zh_Hans': '星期五',
    },
    'waitwdvp': {
      'es': 'Posibles asignaciones:',
      'en': 'Possible assignments:',
      'eu': 'Egin daitezkeen lanak:',
      'ru': 'Возможные задания:',
      'zh_Hans': '可能的任务：',
    },
    'o109p734': {
      'es': 'Guardias',
      'en': 'Guards',
      'eu': 'Zaindariak',
      'ru': 'Охранники',
      'zh_Hans': '守卫',
    },
    'yiwut7xs': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // CrearModifGuardia
  {
    'jg0ptdt4': {
      'es': 'Search...',
      'en': 'Search...',
      'eu': 'Bilatu...',
      'ru': 'Поиск...',
      'zh_Hans': '搜索...',
    },
    'kfpin6j1': {
      'es': 'Lunes',
      'en': 'Monday',
      'eu': 'astelehena',
      'ru': 'Понедельник',
      'zh_Hans': '周一',
    },
    '182dxst5': {
      'es': 'Martes',
      'en': 'Tuesday',
      'eu': 'asteartea',
      'ru': 'Вторник',
      'zh_Hans': '周二',
    },
    'rd98si4p': {
      'es': 'Miércoles',
      'en': 'Wednesday',
      'eu': 'asteazkena',
      'ru': 'Среда',
      'zh_Hans': '周三',
    },
    '8om0jggi': {
      'es': 'Jueves',
      'en': 'Thursday',
      'eu': 'Osteguna',
      'ru': 'Четверг',
      'zh_Hans': '周四',
    },
    'adtbkgak': {
      'es': 'Viernes',
      'en': 'Friday',
      'eu': 'ostirala',
      'ru': 'Пятница',
      'zh_Hans': '星期五',
    },
    'ok38fldt': {
      'es': 'Search...',
      'en': 'Search...',
      'eu': 'Bilatu...',
      'ru': 'Поиск...',
      'zh_Hans': '搜索...',
    },
    'gwqiqab0': {
      'es': 'Search...',
      'en': 'Search...',
      'eu': 'Bilatu...',
      'ru': 'Поиск...',
      'zh_Hans': '搜索...',
    },
    'd9d46s2d': {
      'es': 'Primera Hora (8:25 - 9:20)',
      'en': 'First Hour (8:25 - 9:20)',
      'eu': 'Lehen ordua (8:25 - 9:20)',
      'ru': 'Первый час (8:25 - 9:20)',
      'zh_Hans': '第一小时 (8:25 - 9:20)',
    },
    'pe2ahpae': {
      'es': 'Selector de Hora',
      'en': 'Time Selector',
      'eu': 'Denbora hautatzailea',
      'ru': 'Селектор времени',
      'zh_Hans': '时间选择器',
    },
    'b55zaot8': {
      'es': 'Search...',
      'en': 'Search...',
      'eu': 'Bilatu...',
      'ru': 'Поиск...',
      'zh_Hans': '搜索...',
    },
    'sx6rxs4a': {
      'es': 'Primera Hora (8:25 - 9:20)',
      'en': 'First Hour (8:25 - 9:20)',
      'eu': 'Lehen ordua (8:25 - 9:20)',
      'ru': 'Первый час (8:25 - 9:20)',
      'zh_Hans': '第一小时 (8:25 - 9:20)',
    },
    't2rq6x0l': {
      'es': 'Segunda Hora (9:20 - 10:15)',
      'en': 'Second Hour (9:20 - 10:15)',
      'eu': 'Bigarren ordua (9:20 - 10:15)',
      'ru': 'Второй час (9:20 - 10:15)',
      'zh_Hans': '第二个小时 (9:20 - 10:15)',
    },
    '53rrgxbk': {
      'es': 'Tercera Hora (10:15 - 11:10)',
      'en': 'Third Hour (10:15 - 11:10)',
      'eu': 'Hirugarren ordua (10:15 - 11:10)',
      'ru': 'Третий час (10:15 - 11:10)',
      'zh_Hans': '第三个小时 (10:15 - 11:10)',
    },
    'xjhw7vcm': {
      'es': 'Recreo (11:10 - 11:30)',
      'en': 'Recess (11:10 - 11:30)',
      'eu': 'Atsedenaldia (11:10 - 11:30)',
      'ru': 'Перерыв (11:10 - 11:30)',
      'zh_Hans': '休息（11:10 - 11:30）',
    },
    'akiobv6f': {
      'es': 'Cuarta Hora (11:30 - 12:25)',
      'en': 'Fourth Hour (11:30 - 12:25)',
      'eu': 'Laugarren ordua (11:30 - 12:25)',
      'ru': 'Четвертый час (11:30 - 12:25)',
      'zh_Hans': '第四个小时 (11:30 - 12:25)',
    },
    '6d6mofu2': {
      'es': 'Quinta Hora (12:25 - 13:20)',
      'en': 'Fifth Hour (12:25 - 13:20)',
      'eu': 'Bosgarren ordua (12:25 - 13:20)',
      'ru': 'Пятый час (12:25 - 13:20)',
      'zh_Hans': '第五个小时 (12:25 - 13:20)',
    },
    'wjfhlxjf': {
      'es': 'Sexta Hora (13:20 - 14:15)',
      'en': 'Sixth Hour (1:20 PM - 2:15 PM)',
      'eu': 'Seigarren ordua (13:20 - 14:15)',
      'ru': 'Шестой час (1:20 PM - 2:15 PM)',
      'zh_Hans': '第六个小时（下午 1:20 - 下午 2:15）',
    },
    '0l5yxffg': {
      'es': 'Séptima Hora (14:15 - 15:10)',
      'en': 'Seventh Hour (2:15 PM - 3:10 PM)',
      'eu': 'Zazpigarren ordua (14:15 - 15:10)',
      'ru': 'Седьмой час (14:15 - 15:10)',
      'zh_Hans': '第七小时（下午 2:15 - 下午 3:10）',
    },
    'li4k3ffo': {
      'es': 'Primera Hora (15:30 - 16:25)',
      'en': 'First Hour (3:30 PM - 4:25 PM)',
      'eu': 'Lehen ordua (15:30 - 16:25)',
      'ru': 'Первый час (15:30 - 16:25)',
      'zh_Hans': '第一小时（下午 3:30 - 下午 4:25）',
    },
    'dqdy2vxz': {
      'es': 'Selector de Hora',
      'en': 'Time Selector',
      'eu': 'Denbora hautatzailea',
      'ru': 'Селектор времени',
      'zh_Hans': '时间选择器',
    },
    'jxyjauln': {
      'es': 'Search...',
      'en': 'Search...',
      'eu': 'Bilatu...',
      'ru': 'Поиск...',
      'zh_Hans': '搜索...',
    },
    'bmkvfxdp': {
      'es': 'Primera Hora (15:30 - 16:25)',
      'en': 'First Hour (3:30 PM - 4:25 PM)',
      'eu': 'Lehen ordua (15:30 - 16:25)',
      'ru': 'Первый час (15:30 - 16:25)',
      'zh_Hans': '第一小时（下午 3:30 - 下午 4:25）',
    },
    '6cbs4x1d': {
      'es': 'Segunda Hora (16:25 - 17:20)',
      'en': 'Second Hour (16:25 - 17:20)',
      'eu': 'Bigarren ordua (16:25 - 17:20)',
      'ru': 'Второй час (16:25 - 17:20)',
      'zh_Hans': '第二小时 (16:25 - 17:20)',
    },
    'tsol4q33': {
      'es': 'Tercera Hora (17:20 - 18:15)',
      'en': 'Third Hour (17:20 - 18:15)',
      'eu': 'Hirugarren ordua (17:20 - 18:15)',
      'ru': 'Третий час (17:20 - 18:15)',
      'zh_Hans': '第三个小时 (17:20 - 18:15)',
    },
    '3z5qpck0': {
      'es': 'Recreo (18:15 - 18:35)',
      'en': 'Recess (6:15 - 6:35 PM)',
      'eu': 'Atsedenaldia (18:15 - 18:35)',
      'ru': 'Перерыв (18:15 - 18:35)',
      'zh_Hans': '休息（下午 6:15 - 6:35）',
    },
    's6danfk9': {
      'es': 'Cuarta Hora (18:35 - 19:30)',
      'en': 'Fourth Hour (18:35 - 19:30)',
      'eu': 'Laugarren ordua (18:35 - 19:30)',
      'ru': 'Четвертый час (18:35 - 19:30)',
      'zh_Hans': '第四个小时 (18:35 - 19:30)',
    },
    '21pprbyn': {
      'es': 'Quinta Hora (19:30 - 20:25)',
      'en': 'Fifth Hour (7:30 PM - 8:25 PM)',
      'eu': 'Bosgarren ordua (19:30 - 20:25)',
      'ru': 'Пятый час (7:30 вечера - 8:25 вечера)',
      'zh_Hans': '第五个小时（晚上 7:30 - 8:25）',
    },
    'k3qx74h2': {
      'es': 'Sexta Hora (20:25 - 21:20)',
      'en': 'Sixth Hour (8:25 PM - 9:20 PM)',
      'eu': 'Seigarren ordua (20:25 - 21:20)',
      'ru': 'Шестой час (8:25 вечера - 9:20 вечера)',
      'zh_Hans': '第六个小时（晚上 8:25 - 9:20）',
    },
    'wijo2qlw': {
      'es': 'Séptima Hora (21:20 - 22:15)',
      'en': 'Seventh Hour (9:20 PM - 10:15 PM)',
      'eu': 'Zazpigarren ordua (21:20 - 22:15)',
      'ru': 'Седьмой час (9:20 вечера - 10:15 вечера)',
      'zh_Hans': '第七小时 (晚上 9:20 - 10:15)',
    },
    'goh9ceph': {
      'es': 'Confirmar',
      'en': 'Confirm',
      'eu': 'Berretsi',
      'ru': 'Подтверждать',
      'zh_Hans': '确认',
    },
    'yceg5577': {
      'es': 'Crear/Modificar Guardias',
      'en': 'Create/Modify Guards',
      'eu': 'Sortu/Aldatu Guardias',
      'ru': 'Создать/изменить охранников',
      'zh_Hans': '创建/修改警卫',
    },
    'u1e4bi5g': {
      'es': 'Rellene la guardia del dia especificado',
      'en': 'Fill in the guard for the specified day',
      'eu': 'Zehaztutako egunerako guardia bete',
      'ru': 'Заполните охрану на указанный день',
      'zh_Hans': '填写指定日期的守卫',
    },
    'jnd2051g': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // Estadisticas
  {
    'uh9qf5ms': {
      'es': 'Estadísticas',
      'en': 'Statistics',
      'eu': 'Estatistikak',
      'ru': 'Статистика',
      'zh_Hans': '统计数据',
    },
    'wocyhdcq': {
      'es': 'Guardias asignadas por día y tramo',
      'en': 'Guards assigned by day and section',
      'eu': 'Egun eta atalen arabera esleitutako zaindariak',
      'ru': 'Охранники, назначенные по дням и секциям',
      'zh_Hans': '按日和部门分配警卫',
    },
    'cb7frav0': {
      'es': 'Día',
      'en': 'Day',
      'eu': 'Eguna',
      'ru': 'День',
      'zh_Hans': '天',
    },
    'wipn7cx2': {
      'es': 'Hora',
      'en': 'Hour',
      'eu': 'Ordua',
      'ru': 'Час',
      'zh_Hans': '小时',
    },
    'czmbhzk5': {
      'es': 'Total de guardias',
      'en': 'Total number of guards',
      'eu': 'Guardia kopurua guztira',
      'ru': 'Общее количество охранников',
      'zh_Hans': '警卫总人数',
    },
    '9msfvw2o': {
      'es': 'Guardias por día y tramo horario',
      'en': 'Guards per day and time slot',
      'eu': 'Guardiak eguneko eta ordu-tarte bakoitzeko',
      'ru': 'Охранников в день и временной интервал',
      'zh_Hans': '每天和每个时间段的保安人数',
    },
    'ov3ipt2z': {
      'es': 'Asignadas',
      'en': 'Assigned',
      'eu': 'Esleitua',
      'ru': 'Назначенный',
      'zh_Hans': '已分配',
    },
    'wwe908yt': {
      'es': 'No Asignadas',
      'en': 'Not Assigned',
      'eu': 'Esleitu gabe',
      'ru': 'Не назначено',
      'zh_Hans': '未分配',
    },
    'vpxe38wd': {
      'es': 'Tiempo de guardia realizado',
      'en': 'On-call time performed',
      'eu': 'Deialdiko ordua burutu da',
      'ru': 'Время выполнения вызова',
      'zh_Hans': '值班时间',
    },
    'fmpo6g8f': {
      'es': 'Profesor',
      'en': 'Teacher',
      'eu': 'Irakaslea',
      'ru': 'Учитель',
      'zh_Hans': '老师',
    },
    'uyviir2f': {
      'es': 'Hora',
      'en': 'Hour',
      'eu': 'Ordua',
      'ru': 'Час',
      'zh_Hans': '小时',
    },
    'pf74ugyy': {
      'es': 'Tiempo de guardia',
      'en': 'On-call time',
      'eu': 'Deialdirako ordua',
      'ru': 'Время дежурства',
      'zh_Hans': '值班时间',
    },
    '4mtcuigk': {
      'es': 'Tiempo de guardia realizado por grupo',
      'en': 'Guard time performed by group',
      'eu': 'Taldeka egindako guardia-denbora',
      'ru': 'Время охраны, выполненное группой',
      'zh_Hans': '团体守卫时间',
    },
    'siuynigj': {
      'es': 'Profesor',
      'en': 'Teacher',
      'eu': 'Irakaslea',
      'ru': 'Учитель',
      'zh_Hans': '老师',
    },
    'ajx3unsk': {
      'es': 'Clase',
      'en': 'Class',
      'eu': 'Klasea',
      'ru': 'Сорт',
      'zh_Hans': '班级',
    },
    'py7ye2tj': {
      'es': 'Hora',
      'en': 'Hour',
      'eu': 'Ordua',
      'ru': 'Час',
      'zh_Hans': '小时',
    },
    '67jlr4su': {
      'es': 'Tiempo de guardia',
      'en': 'On-call time',
      'eu': 'Deialdirako ordua',
      'ru': 'Время дежурства',
      'zh_Hans': '值班时间',
    },
    'p5et8xo3': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // GuardiasProfes
  {
    '6239b2v9': {
      'es': 'Guardias Disponibles',
      'en': 'Guards Available',
      'eu': 'Zaindariak eskuragarri',
      'ru': 'Охранники доступны',
      'zh_Hans': '有警卫',
    },
    'xvoccuqp': {
      'es': 'Hora',
      'en': 'Hour',
      'eu': 'Ordua',
      'ru': 'Час',
      'zh_Hans': '小时',
    },
    'dcnbhwri': {
      'es': 'Apuntarse',
      'en': 'Sign up',
      'eu': 'Izena eman',
      'ru': 'Зарегистрироваться',
      'zh_Hans': '报名',
    },
    'swqp68uj': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Hasiera',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // SelectorIdioma
  {
    'il04urf9': {
      'es': 'Elegir idioma',
      'en': 'Choose language',
      'eu': 'Aukeratu hizkuntza',
      'ru': 'Выберите язык',
      'zh_Hans': '选择语言',
    },
    '8l6ot1ey': {
      'es': 'Español',
      'en': 'Spanish',
      'eu': 'gaztelania',
      'ru': 'испанский',
      'zh_Hans': '西班牙语',
    },
    '9sgz3l3z': {
      'es': 'Inglés',
      'en': 'English',
      'eu': 'ingelesa',
      'ru': 'Английский',
      'zh_Hans': '英语',
    },
    'gl0bicel': {
      'es': 'Ruso',
      'en': 'Russian',
      'eu': 'errusiera',
      'ru': 'Русский',
      'zh_Hans': '俄语',
    },
    'eqlc4jss': {
      'es': 'Chino',
      'en': 'Chinese',
      'eu': 'txinera',
      'ru': 'китайский',
      'zh_Hans': '中国人',
    },
    'szy1xko4': {
      'es': 'Vasco',
      'en': 'Basque',
      'eu': 'euskara',
      'ru': 'баскский',
      'zh_Hans': '巴斯克',
    },
  },
  // menuTelef
  {
    'pxyyj555': {
      'es': 'Menú',
      'en': 'Menu',
      'eu': 'Menua',
      'ru': 'Меню',
      'zh_Hans': '菜单',
    },
    'ceqb5xee': {
      'es': 'Perfil',
      'en': 'Profile',
      'eu': 'Profila',
      'ru': 'Профиль',
      'zh_Hans': '轮廓',
    },
    'plgw6r8i': {
      'es': 'Horarios Sala de Profesores',
      'en': 'Teachers\' Room Schedule',
      'eu': 'Irakasleen Gelako ordutegia',
      'ru': 'Расписание занятий в учительской',
      'zh_Hans': '教师室时间表',
    },
    '3k2rq126': {
      'es': 'Guardias Disponibles',
      'en': 'Guards Available',
      'eu': 'Zaindariak eskuragarri',
      'ru': 'Охранники доступны',
      'zh_Hans': '有警卫',
    },
    'u7vwu84g': {
      'es': 'Guardias Sala de Profesores',
      'en': 'Teachers\' Room Guards',
      'eu': 'Irakasleen gelako zaindariak',
      'ru': 'Охранники учительской комнаты',
      'zh_Hans': '教师休息室保安',
    },
    'pixl5sae': {
      'es': 'Panel de control',
      'en': 'control Panel',
      'eu': 'kontrol panela',
      'ru': 'панель управления',
      'zh_Hans': '控制面板',
    },
    'gw06c73f': {
      'es': 'Modo claro',
      'en': 'Light mode',
      'eu': 'Argi modua',
      'ru': 'Легкий режим',
      'zh_Hans': '灯光模式',
    },
    '43rxee57': {
      'es': 'Modo oscuro',
      'en': 'Dark mode',
      'eu': 'Modu iluna',
      'ru': 'Темный режим',
      'zh_Hans': '暗黑模式',
    },
    'w8qw2lrk': {
      'es': 'Cerrar sesión',
      'en': 'Log out',
      'eu': 'Amaitu saioa',
      'ru': 'Выйти',
      'zh_Hans': '登出',
    },
  },
  // barraLateral
  {
    'v09odcg8': {
      'es': 'Perfil',
      'en': 'Profile',
      'eu': 'Profila',
      'ru': 'Профиль',
      'zh_Hans': '轮廓',
    },
    'ljg2gaom': {
      'es': 'Horarios',
      'en': 'Schedules',
      'eu': 'Ordutegiak',
      'ru': 'Расписания',
      'zh_Hans': '时间表',
    },
    '296d2zci': {
      'es': 'Guardias disponibles',
      'en': 'Guards available',
      'eu': 'Zaindariak eskuragarri',
      'ru': 'Охранники доступны',
      'zh_Hans': '有警卫',
    },
    'yivqj27w': {
      'es': 'Guardias generales',
      'en': 'General Guards',
      'eu': 'Guardia Nagusiak',
      'ru': 'Генеральная гвардия',
      'zh_Hans': '近卫将军',
    },
    'j9s8l5ns': {
      'es': 'Panel de control',
      'en': 'control Panel',
      'eu': 'kontrol panela',
      'ru': 'панель управления',
      'zh_Hans': '控制面板',
    },
    '8jts9kb9': {
      'es': 'Cerrar Sesión',
      'en': 'Log Out',
      'eu': 'Amaitu saioa',
      'ru': 'Выйти',
      'zh_Hans': '登出',
    },
  },
  // cambiarContrasena
  {
    '9rpfabu9': {
      'es': 'Cambiar contraseña',
      'en': 'Change password',
      'eu': 'Aldatu pasahitza',
      'ru': 'Изменить пароль',
      'zh_Hans': '更改密码',
    },
    't1v6couk': {
      'es': 'Nueva contraseña',
      'en': 'New password',
      'eu': 'Pasahitz berria',
      'ru': 'Новый пароль',
      'zh_Hans': '新密码',
    },
    'nwrgvanu': {
      'es': 'Confirmar contraseña',
      'en': 'Confirm Password',
      'eu': 'Berretsi pasahitza',
      'ru': 'Подтвердите пароль',
      'zh_Hans': '确认密码',
    },
    '3e42c6fn': {
      'es': 'Confirmar cambio',
      'en': 'Confirm change',
      'eu': 'Berretsi aldaketa',
      'ru': 'Подтвердить изменение',
      'zh_Hans': '确认更改',
    },
  },
  // ElegirTramoHorario
  {
    'pbm3nx8m': {
      'es': 'Diurno',
      'en': 'Day',
      'eu': 'Eguna',
      'ru': 'День',
      'zh_Hans': '天',
    },
    'si8hkbr3': {
      'es': 'Vespertino',
      'en': 'Evening',
      'eu': 'Arratsaldean',
      'ru': 'Вечер',
      'zh_Hans': '晚上',
    },
  },
  // ConfirmarHora
  {
    'uudsropp': {
      'es': 'Datos de la Hora',
      'en': 'Time Data',
      'eu': 'Denbora Datuak',
      'ru': 'Данные о времени',
      'zh_Hans': '时间数据',
    },
    'gl2btpxu': {
      'es': 'Cancelar',
      'en': 'Cancel',
      'eu': 'Utzi',
      'ru': 'Отмена',
      'zh_Hans': '取消',
    },
    'v0p8agp8': {
      'es': 'Confirmar',
      'en': 'Confirm',
      'eu': 'Berretsi',
      'ru': 'Подтверждать',
      'zh_Hans': '确认',
    },
  },
  // confirmarUsuario
  {
    '4qv5qwq6': {
      'es': 'Usuario creado',
      'en': 'User created',
      'eu': 'Erabiltzailea sortu da',
      'ru': 'Пользователь создал',
      'zh_Hans': '用户创建',
    },
    'tbco9jii': {
      'es': 'Aceptar',
      'en': 'Accept',
      'eu': 'Onartu',
      'ru': 'Принимать',
      'zh_Hans': '接受',
    },
  },
  // ElegirTramoGuardia
  {
    '5ok5slec': {
      'es': 'Diurno',
      'en': 'Day',
      'eu': 'Eguna',
      'ru': 'День',
      'zh_Hans': '天',
    },
    'vfilf07r': {
      'es': 'Vespertino',
      'en': 'Evening',
      'eu': 'Arratsaldean',
      'ru': 'Вечер',
      'zh_Hans': '晚上',
    },
  },
  // imgPerf
  {
    'mgh60hcm': {
      'es': 'Cambiar foto',
      'en': 'Change photo',
      'eu': 'Aldatu argazkia',
      'ru': 'Изменить фото',
      'zh_Hans': '更改照片',
    },
    '0jfpqp2z': {
      'es': 'Sube una nueva foto para cambiarla en tu perfil.',
      'en': 'Upload a new photo to change it on your profile.',
      'eu': 'Kargatu argazki berri bat zure profilean aldatzeko.',
      'ru': 'Загрузите новую фотографию, чтобы изменить ее в своем профиле.',
      'zh_Hans': '上传新照片以在您的个人资料中进行更改。',
    },
    'dxkrgru1': {
      'es': 'Subir imagen',
      'en': 'Upload image',
      'eu': 'Igo irudia',
      'ru': 'Загрузить изображение',
      'zh_Hans': '上传图片',
    },
    'z2bbndiw': {
      'es': 'Guardar',
      'en': 'Keep',
      'eu': 'Mantendu',
      'ru': 'Держать',
      'zh_Hans': '保持',
    },
  },
  // darseBaja
  {
    'y0f2miu6': {
      'es': 'Darse de baja',
      'en': 'Unsubscribe',
      'eu': 'Harpidetza kendu',
      'ru': 'Отписаться',
      'zh_Hans': '取消订阅',
    },
    '9y0nfma5': {
      'es': 'Escriba una tarea para la clase...',
      'en': 'Write an assignment for the class...',
      'eu': 'Idatzi klaserako lan bat...',
      'ru': 'Напишите задание для класса...',
      'zh_Hans': '为班级写一份作业...',
    },
    'jmlqgmzw': {
      'es': 'Enviar',
      'en': 'Send',
      'eu': 'Bidali',
      'ru': 'Отправлять',
      'zh_Hans': '发送',
    },
  },
  // generar
  {
    'yqpoar7g': {
      'es': 'Profesor...',
      'en': 'Teacher...',
      'eu': 'Irakaslea...',
      'ru': 'Учитель...',
      'zh_Hans': '老师...',
    },
    '3tpmbv7i': {
      'es': 'Search...',
      'en': 'Search...',
      'eu': 'Bilatu...',
      'ru': 'Поиск...',
      'zh_Hans': '搜索...',
    },
    'ejtkdofg': {
      'es': 'Option 1',
      'en': 'Option 1',
      'eu': '1. aukera',
      'ru': 'Вариант 1',
      'zh_Hans': '选项 1',
    },
    'rz54cbrz': {
      'es': 'Option 2',
      'en': 'Option 2',
      'eu': '2. aukera',
      'ru': 'Вариант 2',
      'zh_Hans': '选项 2',
    },
    '5we4q8o4': {
      'es': 'Option 3',
      'en': 'Option 3',
      'eu': '3. aukera',
      'ru': 'Вариант 3',
      'zh_Hans': '选项 3',
    },
    'cg36i5ar': {
      'es': 'Generar',
      'en': 'Trigger',
      'eu': 'Trigger',
      'ru': 'Курок',
      'zh_Hans': '扳机',
    },
  },
  // Miscellaneous
  {
    'zkir6ry0': {
      'es':
          'Acepte el permiso para poder usar una la cámara de su dispositivo para cambiar su imagen de perfil',
      'en':
          'Please accept permission to use your device\'s camera to change your profile picture.',
      'eu':
          'Mesedez, onartu zure gailuko kamera erabiltzeko baimena zure profileko argazkia aldatzeko.',
      'ru':
          'Пожалуйста, дайте разрешение на использование камеры вашего устройства для изменения фотографии вашего профиля.',
      'zh_Hans': '请接受使用您设备的相机来更改您的个人资料图片的权限。',
    },
    'ff8nk7do': {
      'es': 'Para poder subir una imagen debe aceptar los permisos de acceso',
      'en': 'To upload an image you must accept the access permissions',
      'eu': 'Irudi bat igotzeko sarbide-baimenak onartu behar dituzu',
      'ru':
          'Чтобы загрузить изображение, вам необходимо принять разрешения на доступ.',
      'zh_Hans': '要上传图片，您必须接受访问权限',
    },
    't6om783z': {
      'es': 'Error al autenticarse',
      'en': 'Failed to authenticate',
      'eu': 'Ezin izan da autentifikatu',
      'ru': 'Не удалось аутентифицироваться',
      'zh_Hans': '身份验证失败',
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
      'es': 'Las contraseñas no coinciden',
      'en': 'Passwords do not match',
      'eu': 'Pasahitzak ez datoz bat',
      'ru': 'Пароли не совпадают',
      'zh_Hans': '密码不匹配',
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
      'es': 'Las credenciales dadas no son válidas para iniciar sesión',
      'en': 'The credentials given are not valid for logging in.',
      'eu': 'Emandako kredentzialak ez du balio saioa hasteko.',
      'ru': 'Указанные учетные данные недействительны для входа в систему.',
      'zh_Hans': '提供的凭据不适用于登录。',
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
