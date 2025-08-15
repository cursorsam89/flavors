import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
	WidgetsFlutterBinding.ensureInitialized();

	// Lock portrait by default; individual screens may override (e.g., Soroban).
	await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
		DeviceOrientation.portraitUp,
		DeviceOrientation.portraitDown,
	]);

	// Fullscreen immersive mode.
	await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

	// Initialize Firebase non-fatally if configured.
	try {
		if (Firebase.apps.isEmpty) {
			await Firebase.initializeApp();
		}
	} catch (e) {
		if (kDebugMode) {
			debugPrint('Firebase initialization skipped or failed: $e');
		}
	}

	runZonedGuarded(() async {
		final Widget app = await builder();
		runApp(app);
	}, (Object error, StackTrace stack) {
		// Hook for Crashlytics if desired.
		debugPrint('Uncaught zone error: $error');
	});
}