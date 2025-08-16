// features/splash/splash_page.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      if (!mounted) return;
      context.go('/onboarding');
      return;
    }
    final String? session = prefs.getString('settings.session');
    if (session != null) {
      if (!mounted) return;
      context.go('/dashboard');
    } else {
      if (!mounted) return;
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(AppLocalizations.of(context).splashLoading)),
    );
  }
}
