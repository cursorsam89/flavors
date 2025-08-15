import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
	static const String _keyThemeMode = 'settings.themeMode';
	static const String _keyLocale = 'settings.locale';
	static const String _keySession = 'settings.session';

	Future<ThemeMode> themeMode() async {
		final SharedPreferences prefs = await SharedPreferences.getInstance();
		final String? mode = prefs.getString(_keyThemeMode);
		switch (mode) {
			case 'dark':
				return ThemeMode.dark;
			case 'light':
				return ThemeMode.light;
			case 'system':
			default:
				return ThemeMode.system;
		}
	}

	Future<void> updateThemeMode(ThemeMode theme) async {
		final SharedPreferences prefs = await SharedPreferences.getInstance();
		final String mode = switch (theme) {
			ThemeMode.dark => 'dark',
			ThemeMode.light => 'light',
			ThemeMode.system => 'system',
		};
		await prefs.setString(_keyThemeMode, mode);
	}

	Future<Locale?> locale() async {
		final SharedPreferences prefs = await SharedPreferences.getInstance();
		final String? jsonValue = prefs.getString(_keyLocale);
		if (jsonValue == null) return null;
		final Map<String, dynamic> map = json.decode(jsonValue) as Map<String, dynamic>;
		final String? languageCode = map['languageCode'] as String?;
		final String? countryCode = map['countryCode'] as String?;
		if (languageCode == null || languageCode.isEmpty) return null;
		return Locale(languageCode, countryCode?.isEmpty ?? true ? null : countryCode);
	}

	Future<void> updateLocale(Locale? locale) async {
		final SharedPreferences prefs = await SharedPreferences.getInstance();
		if (locale == null) {
			await prefs.remove(_keyLocale);
			return;
		}
		await prefs.setString(_keyLocale, json.encode(<String, String?>{
			'languageCode': locale.languageCode,
			'countryCode': locale.countryCode,
		}));
	}

	Future<Map<String, dynamic>?> loadSession() async {
		final SharedPreferences prefs = await SharedPreferences.getInstance();
		final String? jsonValue = prefs.getString(_keySession);
		return jsonValue == null ? null : json.decode(jsonValue) as Map<String, dynamic>;
	}

	Future<void> saveSession(Map<String, dynamic>? session) async {
		final SharedPreferences prefs = await SharedPreferences.getInstance();
		if (session == null) {
			await prefs.remove(_keySession);
			return;
		}
		await prefs.setString(_keySession, json.encode(session));
	}
}