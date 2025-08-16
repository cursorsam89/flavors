// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitleKids => 'Aplicación Infantil';

  @override
  String get appTitleTutor => 'Aplicación Tutor';

  @override
  String welcomeUser(Object username) {
    return 'Bienvenido $username';
  }

  @override
  String get splashLoading => 'Cargando...';

  @override
  String get onboardingTitle => 'Bienvenido';

  @override
  String get onboardingSubtitle => 'Vamos a empezar';

  @override
  String get loginWithGoogle => 'Continuar con Google';

  @override
  String get loginWithApple => 'Continuar con Apple';

  @override
  String get tabHome => 'Inicio';

  @override
  String get tabMore => 'Más';

  @override
  String get soroban => 'Soroban';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get profile => 'Perfil';

  @override
  String get theme => 'Tema';

  @override
  String get signOut => 'Cerrar sesión';
}
