// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitleKids => 'Kids App';

  @override
  String get appTitleTutor => 'Tutor App';

  @override
  String welcomeUser(Object username) {
    return 'Welcome $username';
  }

  @override
  String get splashLoading => 'Loading...';

  @override
  String get onboardingTitle => 'Welcome';

  @override
  String get onboardingSubtitle => 'Let\'s get you started';

  @override
  String get loginWithGoogle => 'Continue with Google';

  @override
  String get loginWithApple => 'Continue with Apple';

  @override
  String get tabHome => 'Home';

  @override
  String get tabMore => 'More';

  @override
  String get soroban => 'Soroban';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get profile => 'Profile';

  @override
  String get theme => 'Theme';

  @override
  String get signOut => 'Sign out';
}
