import 'package:flutter/material.dart';

import 'bootstrap.dart';
import 'flavors.dart';
import 'app/app.dart';
import 'services/settings_controller.dart';
import 'services/settings_service.dart';

Future<void> main() async {
	await bootstrap(() async {
		FlavorConfig.initialize(AppFlavor.teacher);
		final SettingsController settingsController = SettingsController(SettingsService());
		await settingsController.loadSettings();
		return App(settingsController: settingsController);
	});
}