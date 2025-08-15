// Basic smoke test for app to render without errors.
import 'package:flutter_test/flutter_test.dart';
import 'package:flavors/main_student.dart' as entry;

void main() {
	test('entrypoint exists', () async {
		// Simply ensure main() can be invoked without throwing.
		await entry.main();
	});
}
