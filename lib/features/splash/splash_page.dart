import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../l10n/app_localizations.dart';

class SplashPage extends StatefulWidget {
	const SplashPage({super.key});

	@override
	State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
	@override
	void initState() {
		super.initState();
		_unfold();
	}

	Future<void> _unfold() async {
		final SharedPreferences prefs = await SharedPreferences.getInstance();
		final bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
		await Future<void>.delayed(const Duration(milliseconds: 400));
		if (!mounted) return;
		if (!seenOnboarding) {
			if (!mounted) return;
			Navigator.of(context).pushReplacementNamed('/onboarding');
			return;
		}
		final String? session = prefs.getString('settings.session');
		if (session != null) {
			if (!mounted) return;
			Navigator.of(context).pushReplacementNamed('/dashboard');
		} else {
			if (!mounted) return;
			Navigator.of(context).pushReplacementNamed('/login');
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: Text(AppLocalizations.of(context)?.splashLoading ?? 'Loading...'),
			),
		);
	}
}