import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

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
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Beign2
  {
    '1o5m3xfv': {
      'en': 'إشارتي',
      'ar': '',
    },
    'qykxo1lx': {
      'en': 'تخطي',
      'ar': '',
    },
    '7jd0rcpy': {
      'en': 'تطبيق لمساعدة الصم و البكم للتعامل \nمع العالم الخارجى',
      'ar': '',
    },
    'l66eta6j': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Begin3
  {
    '16543a5i': {
      'en': 'إشارتي',
      'ar': '',
    },
    '9dq46g5q': {
      'en': 'تخطي',
      'ar': '',
    },
    '00l2yc9h': {
      'en':
          'تعلم من خلال الفديوهات\n التعليمة بسهولة لمعرفة الحروف \nبلغة الاشارة',
      'ar': '',
    },
    't2n0wv0s': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Begin4
  {
    'm7kco153': {
      'en': 'إشارتي',
      'ar': '',
    },
    'lwgot7wz': {
      'en': 'تسجيل الدخول',
      'ar': '',
    },
    '91wbfe1g': {
      'en': 'حساب جديد',
      'ar': '',
    },
    'w0q634yp': {
      'en': 'Home',
      'ar': '',
    },
  },
  // SignUp
  {
    'c4dx1334': {
      'en': '...مرحبا بك',
      'ar': '',
    },
    'fgdvzxcq': {
      'en': 'الاسم',
      'ar': '',
    },
    'dlpjvdwg': {
      'en': 'البريد الالكتروني',
      'ar': '',
    },
    'hj39cdtx': {
      'en': 'كلمة المرور',
      'ar': '',
    },
    'f783mml1': {
      'en': ' تأكيد كلمة المرور',
      'ar': '',
    },
    'rfki7ev4': {
      'en': 'كلمة المرور غير متطابقة ',
      'ar': '',
    },
    'uoi4apug': {
      'en': 'حساب جديد',
      'ar': '',
    },
    'bbavsncd': {
      'en': 'لديك حساب بالفعل؟ ',
      'ar': '',
    },
    '6qvzideu': {
      'en': 'تسجيل الدخول',
      'ar': '',
    },
    '5nlkw04m': {
      'en': 'Field is required',
      'ar': '',
    },
    'ybbv11py': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '2umgxp73': {
      'en': 'Field is required',
      'ar': '',
    },
    've1eerqf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    't0bflobd': {
      'en': 'Field is required',
      'ar': '',
    },
    'f3lhvsv7': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '70q01vjx': {
      'en': 'Field is required',
      'ar': '',
    },
    '11tdh8v1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '3b8pbqve': {
      'en': 'تسجيل الدخول',
      'ar': '',
    },
    'l929wyvt': {
      'en': 'Home',
      'ar': '',
    },
  },
  // login
  {
    'g1u5ccnc': {
      'en': '...مرحبا بك',
      'ar': '',
    },
    'cta0wene': {
      'en': 'البريد الالكتروني',
      'ar': '',
    },
    'dops7ny6': {
      'en': ' كلمة المرور',
      'ar': '',
    },
    'uucuoqcg': {
      'en': 'تسجيل الدخول',
      'ar': '',
    },
    '54n2cgvx': {
      'en': 'ليس لديك حساب؟ ',
      'ar': '',
    },
    '7ibkb217': {
      'en': 'حساب جديد',
      'ar': '',
    },
    'r2332bzx': {
      'en': 'Email is required',
      'ar': '',
    },
    'hxgss652': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5ktovmtf': {
      'en': 'Password is required',
      'ar': '',
    },
    'c2q8y6vs': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'iges0xfv': {
      'en': 'تسجيل الدخول',
      'ar': '',
    },
    'f08f6sz3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ProfilePage
  {
    'vm26swuw': {
      'en': 'تعديل الملف الشخصي',
      'ar': '',
    },
    '0qkwhy43': {
      'en': 'تسجيل الخروج',
      'ar': '',
    },
    'f3v3ai3a': {
      'en': 'هيا نبدأ',
      'ar': '',
    },
    '96vf8d46': {
      'en': 'Home',
      'ar': '',
    },
  },
  // EditProfile
  {
    '7jukvr0z': {
      'en': 'تعديل الملف الشخصي',
      'ar': '',
    },
    'pkz5sua6': {
      'en': 'تغيير الصورة',
      'ar': '',
    },
    'w4xj3wkp': {
      'en': 'الأسم',
      'ar': '',
    },
    'hdljp6dn': {
      'en': 'ادخل الاسم الخاص بك',
      'ar': '',
    },
    'owknimqg': {
      'en': 'البريد الالكترونى',
      'ar': '',
    },
    'vbqiwla4': {
      'en': 'التالي',
      'ar': '',
    },
    '3ea5jjyi': {
      'en': 'الغاء',
      'ar': '',
    },
    'gbvqgxhg': {
      'en': 'Home',
      'ar': '',
    },
  },
  // HomePage
  {
    'y0uiermq': {
      'en': 'ابدأ',
      'ar': '',
    },
    '9ofk3ft3': {
      'en': 'تعلم',
      'ar': '',
    },
    'kwaigj3c': {
      'en': 'مساعدة',
      'ar': '',
    },
    'x7fe69vu': {
      'en': 'عنا',
      'ar': '',
    },
    '0pgm332e': {
      'en': 'خروج',
      'ar': '',
    },
    'of45zrfr': {
      'en': '  مرحبا بك في إشارتي',
      'ar': '  بك في إشارتي',
    },
    '42spctfv': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AboutUS
  {
    'c1nb0q5k': {
      'en': 'إشارتى فى لغة الاشارة العربية',
      'ar': '',
    },
    '04bx177b': {
      'en': 'تصميم و برمجة',
      'ar': '',
    },
    'twjsuha7': {
      'en': 'محمود خيري',
      'ar': '',
    },
    'mm43x7x2': {
      'en': 'سلمى خالد',
      'ar': '',
    },
    'a2u12b1y': {
      'en': 'أيه يسري',
      'ar': '',
    },
    '4szs80xw': {
      'en': 'مريم مصطفى',
      'ar': '',
    },
    '9v62ij2p': {
      'en': 'تحت إشراف الدكتور : أشرف',
      'ar': '',
    },
    'qr0oqogm': {
      'en': 'عنا',
      'ar': '',
    },
    '96i961yw': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Camera
  {
    '9mvhwrp6': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Help
  {
    '4qe9n31z': {
      'en': 'كيفية البدأ....؟',
      'ar': '',
    },
    'nbsak8d0': {
      'en': 'تطبيق لمساعدة الصم و البكم للتعامل \nمع العالم الخارجى',
      'ar': '',
    },
    'jhbf5mnx': {
      'en': 'كيفية التعلم....؟',
      'ar': '',
    },
    'ib5rkeh6': {
      'en':
          'تعلم من خلال الفديوهات\n التعليمة بسهولة لمعرفة الحروف \nبلغة الاشارة',
      'ar': '',
    },
    '5b0cae87': {
      'en': 'للتواصل معنا',
      'ar': '',
    },
    'rnzej3ie': {
      'en': 'تواصل معنا من خلال \n...........................',
      'ar': '',
    },
    '79236d1x': {
      'en': 'مساعدة',
      'ar': '',
    },
    'gp4ap4lp': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Learn
  {
    'jfkfcoz1': {
      'en': 'عن ماذا تبحث...؟',
      'ar': '',
    },
    '03qll7jm': {
      'en': 'بحث',
      'ar': '',
    },
    'kj0iyjan': {
      'en': 'تعلم من خلال الفديوهات',
      'ar': '',
    },
    '178qgrrd': {
      'en': 'Home',
      'ar': '',
    },
  },
  // video
  {
    'os4e5h5k': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CameraCopy
  {
    'ybjvby3v': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Logout
  {
    'n5ihxv12': {
      'en': 'هل تريد تسجيل الخروج ....؟',
      'ar': '',
    },
    'obw4ct4y': {
      'en': 'لا',
      'ar': '',
    },
    'bgn721q0': {
      'en': 'نعم',
      'ar': '',
    },
  },
  // Menu
  {
    '1glxb302': {
      'en': 'تعديل الملف الشخصي',
      'ar': '',
    },
    'qpav5yme': {
      'en': 'الصفحة الرئيسية',
      'ar': '',
    },
    'akxs19vk': {
      'en': 'تعلم',
      'ar': '',
    },
    'sl1kmuuu': {
      'en': 'مساعدة',
      'ar': '',
    },
    'yo69lxjg': {
      'en': 'عنا ',
      'ar': '',
    },
    'kyeyitn2': {
      'en': 'خروج ',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'q49y8s5t': {
      'en': '',
      'ar': '',
    },
    'o4s1xbv1': {
      'en': '',
      'ar': '',
    },
    'eix9ppwq': {
      'en': '',
      'ar': '',
    },
    'wg27mw3u': {
      'en': '',
      'ar': '',
    },
    'fp66aha2': {
      'en': '',
      'ar': '',
    },
    'xtojk2jd': {
      'en': '',
      'ar': '',
    },
    'gd8s3fqm': {
      'en': '',
      'ar': '',
    },
    'rjdb2wtx': {
      'en': '',
      'ar': '',
    },
    'h0hdxtr3': {
      'en': '',
      'ar': '',
    },
    '0rvqkx14': {
      'en': '',
      'ar': '',
    },
    '8dvq2i3r': {
      'en': '',
      'ar': '',
    },
    '92nn0ccb': {
      'en': '',
      'ar': '',
    },
    '1w6kehxs': {
      'en': '',
      'ar': '',
    },
    '52g54rb5': {
      'en': '',
      'ar': '',
    },
    'rqedi12i': {
      'en': '',
      'ar': '',
    },
    '645dvzzq': {
      'en': '',
      'ar': '',
    },
    'jpap4tmf': {
      'en': '',
      'ar': '',
    },
    'h99zhte7': {
      'en': '',
      'ar': '',
    },
    'omhw9v3r': {
      'en': '',
      'ar': '',
    },
    'mdim6zwn': {
      'en': '',
      'ar': '',
    },
    'o4esph15': {
      'en': '',
      'ar': '',
    },
    'fwpmryqx': {
      'en': '',
      'ar': '',
    },
    'a08xant6': {
      'en': '',
      'ar': '',
    },
    'wsren0ct': {
      'en': '',
      'ar': '',
    },
    'v6aljvxn': {
      'en': '',
      'ar': '',
    },
    'pidmfxrq': {
      'en': '',
      'ar': '',
    },
    'jok5ycv8': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
