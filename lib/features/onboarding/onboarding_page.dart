import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../l10n/app_localizations.dart';
import '../../flavors.dart';

class OnboardingPage extends StatelessWidget {
	const OnboardingPage({super.key});

	Future<void> _complete(BuildContext context) async {
		final SharedPreferences prefs = await SharedPreferences.getInstance();
		await prefs.setBool('seenOnboarding', true);
		if (!context.mounted) return;
		Navigator.of(context).pushReplacementNamed('/login');
	}

	@override
	Widget build(BuildContext context) {
		final String title = FlavorConfig.isStudent
			? (AppLocalizations.of(context)?.onboardingTitle ?? 'Welcome')
			: (AppLocalizations.of(context)?.onboardingTitle ?? 'Welcome');
		final String subtitle = AppLocalizations.of(context)?.onboardingSubtitle ?? "Let's get you started";
		return Scaffold(
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.all(24),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.stretch,
						children: <Widget>[
							const Spacer(),
							Text(title, style: Theme.of(context).textTheme.displaySmall),
							const SizedBox(height: 8),
							Text(subtitle, style: Theme.of(context).textTheme.titleMedium),
							const Spacer(),
							FilledButton(
								onPressed: () => _complete(context),
								child: const Text('Continue'),
							),
						],
					),
				),
			),
		);
	}
}