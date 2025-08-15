import 'package:flutter/material.dart';

import 'settings_service.dart';

class SettingsController extends ChangeNotifier {
	SettingsController(this._service);

	final SettingsService _service;

	ThemeMode _themeMode = ThemeMode.system;
	Locale? _locale;

	ThemeMode get themeMode => _themeMode;
	Locale? get locale => _locale;

	Future<void> loadSettings() async {
		_themeMode = await _service.themeMode();
		_locale = await _service.locale();
		notifyListeners();
	}

	Future<void> updateThemeMode(ThemeMode themeMode) async {
		_themeMode = themeMode;
		notifyListeners();
		await _service.updateThemeMode(themeMode);
	}

	Future<void> updateLocale(Locale? locale) async {
		_locale = locale;
		notifyListeners();
		await _service.updateLocale(locale);
	}
}