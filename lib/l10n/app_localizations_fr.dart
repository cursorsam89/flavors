// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitleKids => 'Application Enfants';

  @override
  String get appTitleTutor => 'Application Tuteur';

  @override
  String welcomeUser(Object username) {
    return 'Bienvenue $username';
  }

  @override
  String get splashLoading => 'Chargement...';

  @override
  String get onboardingTitle => 'Bienvenue';

  @override
  String get onboardingSubtitle => 'Commençons';

  @override
  String get loginWithGoogle => 'Continuer avec Google';

  @override
  String get loginWithApple => 'Continuer avec Apple';

  @override
  String get tabHome => 'Accueil';

  @override
  String get tabMore => 'Plus';

  @override
  String get soroban => 'Soroban';

  @override
  String get comingSoon => 'Bientôt disponible';

  @override
  String get profile => 'Profil';

  @override
  String get theme => 'Thème';

  @override
  String get signOut => 'Déconnexion';
}
