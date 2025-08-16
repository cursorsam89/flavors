// features/more/more_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/settings_controller.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  Future<void> _signOut(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('settings.session');
    if (!context.mounted) return;
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final SettingsController settings = context.watch<SettingsController>();
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              subtitle: Text('Coming soon'),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              subtitle: Text(_labelForLocale(settings.locale)),
              onTap: () => _showLanguageSheet(context, settings),
            ),
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: const Text('Theme'),
              subtitle: Text(_labelForTheme(settings.themeMode)),
              onTap: () => _showThemeSheet(context, settings),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign out'),
              onTap: () => _signOut(context),
            ),
          ],
        ),
      ),
    );
  }

  static String _labelForTheme(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.system:
        return 'System';
    }
  }

  static String _labelForLocale(Locale? locale) {
    if (locale == null) return 'System default';
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Spanish';
      case 'hi':
        return 'Hindi';
      case 'zh':
        return 'Chinese';
      case 'fr':
        return 'French';
      default:
        return locale.toLanguageTag();
    }
  }

  Future<void> _showThemeSheet(
    BuildContext context,
    SettingsController settings,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext _) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('System'),
                onTap: () {
                  settings.updateThemeMode(ThemeMode.system);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Light'),
                onTap: () {
                  settings.updateThemeMode(ThemeMode.light);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Dark'),
                onTap: () {
                  settings.updateThemeMode(ThemeMode.dark);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showLanguageSheet(
    BuildContext context,
    SettingsController settings,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext _) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('System default'),
                onTap: () {
                  settings.updateLocale(null);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('English'),
                onTap: () {
                  settings.updateLocale(const Locale('en'));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Spanish'),
                onTap: () {
                  settings.updateLocale(const Locale('es'));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Hindi'),
                onTap: () {
                  settings.updateLocale(const Locale('hi'));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Chinese'),
                onTap: () {
                  settings.updateLocale(const Locale('zh'));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('French'),
                onTap: () {
                  settings.updateLocale(const Locale('fr'));
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
