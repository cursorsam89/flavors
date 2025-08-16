// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitleKids => 'बच्चों का ऐप';

  @override
  String get appTitleTutor => 'ट्यूटर ऐप';

  @override
  String welcomeUser(Object username) {
    return 'स्वागत है $username';
  }

  @override
  String get splashLoading => 'लोड हो रहा है...';

  @override
  String get onboardingTitle => 'स्वागत';

  @override
  String get onboardingSubtitle => 'चलिये शुरू करें';

  @override
  String get loginWithGoogle => 'Google से जारी रखें';

  @override
  String get loginWithApple => 'Apple से जारी रखें';

  @override
  String get tabHome => 'होम';

  @override
  String get tabMore => 'अधिक';

  @override
  String get soroban => 'सोरबन';

  @override
  String get comingSoon => 'जल्द आ रहा है';

  @override
  String get profile => 'प्रोफ़ाइल';

  @override
  String get theme => 'थीम';

  @override
  String get signOut => 'साइन आउट';
}
