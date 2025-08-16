// features/auth/login_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> _mockLogin(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'settings.session',
      '{"uid":"mock","displayName":"User"}',
    );
    if (!context.mounted) return;
    context.go('/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    final String google = AppLocalizations.of(context).loginWithGoogle;
    final String apple = AppLocalizations.of(context).loginWithApple;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FilledButton.icon(
                onPressed: () => _mockLogin(context),
                icon: const Icon(Icons.g_mobiledata),
                label: Text(google),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => _mockLogin(context),
                icon: const Icon(Icons.apple),
                label: Text(apple),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
