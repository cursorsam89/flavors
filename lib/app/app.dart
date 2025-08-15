import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import '../flavors.dart';
import '../features/splash/splash_page.dart';
import '../features/onboarding/onboarding_page.dart';
import '../features/auth/login_page.dart';
import '../features/dashboard/dashboard_page.dart';
import '../features/soroban/soroban_page.dart';
import '../features/more/more_page.dart';
import '../l10n/app_localizations.dart';
import '../services/settings_controller.dart';

class App extends StatelessWidget {
	const App({super.key, required this.settingsController});

	final SettingsController settingsController;

	@override
	Widget build(BuildContext context) {
		final GoRouter router = GoRouter(
			initialLocation: '/splash',
			routes: <RouteBase>[
				GoRoute(path: '/splash', builder: (BuildContext c, GoRouterState s) => const SplashPage()),
				GoRoute(path: '/onboarding', builder: (BuildContext c, GoRouterState s) => const OnboardingPage()),
				GoRoute(path: '/login', builder: (BuildContext c, GoRouterState s) => const LoginPage()),
				GoRoute(path: '/dashboard', builder: (BuildContext c, GoRouterState s) => const DashboardPage()),
				GoRoute(path: '/soroban', builder: (BuildContext c, GoRouterState s) => const SorobanPage()),
				GoRoute(path: '/more', builder: (BuildContext c, GoRouterState s) => const MorePage()),
			],
		);

		return AnimatedBuilder(
			animation: settingsController,
			builder: (BuildContext context, _) {
				return MaterialApp.router(
					title: FlavorConfig.isStudent
						? AppLocalizations.of(context)?.appTitleKids ?? 'Kids App'
						: AppLocalizations.of(context)?.appTitleTutor ?? 'Tutor App',
					routerConfig: router,
					debugShowCheckedModeBanner: false,
					themeMode: settingsController.themeMode,
					theme: ThemeData.light(useMaterial3: true),
					darkTheme: ThemeData.dark(useMaterial3: true),
					locale: settingsController.locale,
					supportedLocales: const <Locale>[
						Locale('en'),
						Locale('es'),
						Locale('hi'),
						Locale('zh'),
						Locale('fr'),
					],
					localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
						AppLocalizations.delegate,
						GlobalMaterialLocalizations.delegate,
						GlobalCupertinoLocalizations.delegate,
						GlobalWidgetsLocalizations.delegate,
					],
				);
			},
		);
	}
}