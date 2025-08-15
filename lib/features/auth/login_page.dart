import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
	const LoginPage({super.key});

	Future<void> _mockLogin(BuildContext context) async {
		final SharedPreferences prefs = await SharedPreferences.getInstance();
		await prefs.setString('settings.session', '{"uid":"mock"}');
		if (!context.mounted) return;
		Navigator.of(context).pushReplacementNamed('/dashboard');
	}

	@override
	Widget build(BuildContext context) {
		final String google = AppLocalizations.of(context)?.loginWithGoogle ?? 'Continue with Google';
		final String apple = AppLocalizations.of(context)?.loginWithApple ?? 'Continue with Apple';
		return Scaffold(
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.all(24),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							FilledButton.icon(onPressed: () => _mockLogin(context), icon: const Icon(Icons.g_mobiledata), label: Text(google)),
							const SizedBox(height: 12),
							OutlinedButton.icon(onPressed: () => _mockLogin(context), icon: const Icon(Icons.apple), label: Text(apple)),
						],
					),
				),
			),
		);
	}
}