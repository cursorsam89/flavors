// Defines app flavors and a holder for the current flavor.

enum AppFlavor { student, teacher }

class FlavorConfig {
	FlavorConfig._(this.flavor);

	static FlavorConfig? _instance;
	final AppFlavor flavor;

	static FlavorConfig initialize(AppFlavor flavor) {
		_instance = FlavorConfig._(flavor);
		return _instance!;
	}

	static FlavorConfig get instance {
		final FlavorConfig? config = _instance;
		if (config == null) {
			throw StateError('FlavorConfig not initialized. Call initialize() in entrypoint.');
		}
		return config;
	}

	static bool get isStudent => instance.flavor == AppFlavor.student;
	static bool get isTeacher => instance.flavor == AppFlavor.teacher;
}